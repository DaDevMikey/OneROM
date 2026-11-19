#!/usr/bin/env python3
"""
patch_framework_jar.py

Injects S10AppCodeOverrides into classes.dex of framework.jar and hooks
ApplicationLoaders.smali to load version-bound system app code overrides from
/system/framework/s10-app-overrides/<app_name>/classes.jar.

Handles Android 14+ / Android 17 QPR2 multidex container framework.jar by
de-concatenating with d8, disassembling and hooking classes.dex, reassembling,
and repacking standard multidex classes.dex through classesN.dex.
"""

import os
import re
import sys
import time
import shutil
import zipfile
import tempfile
import subprocess
from pathlib import Path

def main():
    if len(sys.argv) < 2:
        print("Usage: patch_framework_jar.py <framework.jar> [S10AppCodeOverrides.java]", file=sys.stderr)
        sys.exit(1)

    fw_path = Path(sys.argv[1]).resolve()
    if not fw_path.is_file():
        print(f"Error: framework.jar not found at {fw_path}", file=sys.stderr)
        sys.exit(1)

    if len(sys.argv) >= 3:
        src_java = Path(sys.argv[2]).resolve()
    else:
        # Default search path in repository
        repo_root = Path(__file__).resolve().parent.parent.parent
        src_java = repo_root / "target/beyond1lte/patches/product_abilist/app-overrides/src/com/android/internal/os/S10AppCodeOverrides.java"

    if not src_java.is_file():
        print(f"Error: S10AppCodeOverrides.java not found at {src_java}", file=sys.stderr)
        sys.exit(1)

    # Locate d8
    d8 = os.environ.get("D8")
    if not d8 or not os.path.isfile(d8):
        candidates = [
            "/home/mikey/Android/Sdk/build-tools/37.0.0/d8",
            "/home/mikey/Android/Sdk/build-tools/36.0.0/d8",
            "/home/mikey/Android/Sdk/build-tools/35.0.0/d8",
            "/home/mikey/Android/Sdk/build-tools/34.0.0/d8",
            shutil.which("d8")
        ]
        for c in candidates:
            if c and os.path.isfile(c) and os.access(c, os.X_OK):
                d8 = c
                break

    if not d8:
        print("Error: Android SDK build-tools d8 not found", file=sys.stderr)
        sys.exit(1)

    print(f"[*] Patching framework.jar: {fw_path}")
    print(f"[*] S10AppCodeOverrides source: {src_java}")
    print(f"[*] Using d8: {d8}")
    start_time = time.time()

    with tempfile.TemporaryDirectory() as td:
        td_path = Path(td)
        dex_dir = td_path / "dexes"
        dex_dir.mkdir()

        # 1. De-concatenate multidex framework.jar using d8
        print("[*] Splitting multidex framework.jar with d8...")
        subprocess.check_call([d8, "--output", str(dex_dir), str(fw_path)])

        dex_files = sorted(dex_dir.glob("classes*.dex"))
        print(f"[*] Generated {len(dex_files)} DEX files: {[d.name for d in dex_files]}")

        # 2. Disassemble classes.dex
        smali_dir = td_path / "smali"
        print("[*] Disassembling classes.dex with baksmali...")
        subprocess.check_call(["baksmali", "d", "--api", "34", "-j", "16", "-o", str(smali_dir), str(dex_dir / "classes.dex")])

        # 3. Compile S10AppCodeOverrides.java
        print("[*] Compiling S10AppCodeOverrides.java...")
        classes_dir = td_path / "classes"
        classes_dir.mkdir()
        ovr_dex_dir = td_path / "ovr_dex"
        ovr_dex_dir.mkdir()

        subprocess.check_call(["javac", "--release", "11", "-d", str(classes_dir), str(src_java)])
        compiled_class = classes_dir / "com/android/internal/os/S10AppCodeOverrides.class"
        subprocess.check_call([d8, "--output", str(ovr_dex_dir), str(compiled_class)])

        ovr_smali_dir = td_path / "ovr_smali"
        subprocess.check_call(["baksmali", "d", "--api", "34", "-o", str(ovr_smali_dir), str(ovr_dex_dir / "classes.dex")])

        # 4. Inject S10AppCodeOverrides.smali
        dest_os = smali_dir / "com/android/internal/os"
        dest_os.mkdir(parents=True, exist_ok=True)
        shutil.copy2(ovr_smali_dir / "com/android/internal/os/S10AppCodeOverrides.smali", dest_os / "S10AppCodeOverrides.smali")
        print("[*] Injected S10AppCodeOverrides.smali into classes.dex smali tree")

        # 5. Patch ApplicationLoaders.smali
        app_loaders = smali_dir / "android/app/ApplicationLoaders.smali"
        if not app_loaders.is_file():
            print("Error: ApplicationLoaders.smali not found in classes.dex!", file=sys.stderr)
            sys.exit(1)

        loaders_text = app_loaders.read_text()
        if "Lcom/android/internal/os/S10AppCodeOverrides;->get" not in loaders_text:
            target_invoke = "invoke-static/range {v0 .. v9}, Lcom/android/internal/os/ClassLoaderFactory;->createClassLoader(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/ClassLoader;IZLjava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/List;)Ljava/lang/ClassLoader;"
            if target_invoke not in loaders_text:
                print("Error: Target createClassLoader invocation not found in ApplicationLoaders.smali", file=sys.stderr)
                sys.exit(1)

            hook_code = (
                "    invoke-static {v0}, Lcom/android/internal/os/S10AppCodeOverrides;->get(Ljava/lang/String;)Ljava/lang/String;\n\n"
                "    move-result-object v0\n\n"
                "    " + target_invoke
            )
            app_loaders.write_text(loaders_text.replace(target_invoke, hook_code, 1))
            print("[*] Hooked ApplicationLoaders.smali to route dexPath via S10AppCodeOverrides.get()")
        else:
            print("[*] ApplicationLoaders.smali is already hooked")

        # 5b. Patch GeneratedPolicyMetadata.smali to initialize all policy classes and avoid fatal crash
        gpm_file = smali_dir / "android/app/admin/metadata/GeneratedPolicyMetadata.smali"
        if gpm_file.is_file():
            gpm_text = gpm_file.read_text()
            if "CrossDevicePolicies" not in gpm_text or "cond_done_init" not in gpm_text:
                # 1. In ensureInitialized(), instantiate all policy classes if sPolicies is empty
                init_hook = """
    sget-object v0, Landroid/app/admin/metadata/GeneratedPolicyMetadata;->sPolicies:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_done_init

    new-instance v0, Landroid/app/admin/metadata/AdvancedSecurityOverridesPolicies;
    invoke-direct {v0}, Landroid/app/admin/metadata/AdvancedSecurityOverridesPolicies;-><init>()V

    new-instance v0, Landroid/app/admin/metadata/ApplicationManagementPolicies;
    invoke-direct {v0}, Landroid/app/admin/metadata/ApplicationManagementPolicies;-><init>()V

    new-instance v0, Landroid/app/admin/metadata/BrandingPolicies;
    invoke-direct {v0}, Landroid/app/admin/metadata/BrandingPolicies;-><init>()V

    new-instance v0, Landroid/app/admin/metadata/CrossDevicePolicies;
    invoke-direct {v0}, Landroid/app/admin/metadata/CrossDevicePolicies;-><init>()V

    new-instance v0, Landroid/app/admin/metadata/DataLeakPreventionPolicies;
    invoke-direct {v0}, Landroid/app/admin/metadata/DataLeakPreventionPolicies;-><init>()V

    new-instance v0, Landroid/app/admin/metadata/DateTimePolicies;
    invoke-direct {v0}, Landroid/app/admin/metadata/DateTimePolicies;-><init>()V

    new-instance v0, Landroid/app/admin/metadata/DeviceConnectivityManagementPolicies;
    invoke-direct {v0}, Landroid/app/admin/metadata/DeviceConnectivityManagementPolicies;-><init>()V

    new-instance v0, Landroid/app/admin/metadata/DeviceRadioStatePolicies;
    invoke-direct {v0}, Landroid/app/admin/metadata/DeviceRadioStatePolicies;-><init>()V

    new-instance v0, Landroid/app/admin/metadata/ReportingPolicies;
    invoke-direct {v0}, Landroid/app/admin/metadata/ReportingPolicies;-><init>()V

    new-instance v0, Landroid/app/admin/metadata/SecurityPolicies;
    invoke-direct {v0}, Landroid/app/admin/metadata/SecurityPolicies;-><init>()V

    new-instance v0, Landroid/app/admin/metadata/SystemPoliciesPolicies;
    invoke-direct {v0}, Landroid/app/admin/metadata/SystemPoliciesPolicies;-><init>()V

    :cond_done_init
"""
                gpm_text = re.sub(
                    r"(\.method private static ensureInitialized\(\)V\s*\.registers 6)",
                    r"\1" + init_hook,
                    gpm_text
                )

                # 2. In getPolicyMetadata, return null instead of throwing IllegalArgumentException
                get_method_pattern = r"(\.method public static getPolicyMetadata\(Landroid/app/admin/PolicyIdentifier;\)Landroid/app/admin/metadata/PolicyMetadata;.*?)new-instance v0, Ljava/lang/IllegalArgumentException;.*?(\.end method)"
                get_method_replacement = r"""\1const/4 v0, 0x0

    return-object v0
\2"""
                gpm_text = re.sub(get_method_pattern, get_method_replacement, gpm_text, flags=re.S)
                gpm_file.write_text(gpm_text)
                print("[*] Successfully patched GeneratedPolicyMetadata.smali for dynamic policy registration")

        # 6. Reassemble classes.dex
        print("[*] Reassembling classes.dex with smali...")
        new_classes_dex = dex_dir / "classes.dex"
        subprocess.check_call(["smali", "a", "--api", "34", "-j", "16", "-o", str(new_classes_dex), str(smali_dir)])

        # 7. Repack framework.jar preserving non-dex resources and storing dex files uncompressed (ZIP_STORED) for direct mmap
        print("[*] Packaging updated framework.jar...")
        tmp_jar = td_path / "framework_patched.jar"
        with zipfile.ZipFile(fw_path, "r") as zin, zipfile.ZipFile(tmp_jar, "w") as zout:
            # Copy all non-dex files as-is
            for item in zin.infolist():
                if item.filename.endswith(".dex"):
                    continue
                zout.writestr(item, zin.read(item.filename))

            # Add all DEX files uncompressed (ZIP_STORED)
            for dex_file in sorted(dex_dir.glob("classes*.dex")):
                zout.write(dex_file, dex_file.name, compress_type=zipfile.ZIP_STORED)

        shutil.copy2(tmp_jar, fw_path)
        print(f"[+] Successfully patched framework.jar in {time.time()-start_time:.2f}s (size: {fw_path.stat().st_size} bytes)")

if __name__ == "__main__":
    main()
