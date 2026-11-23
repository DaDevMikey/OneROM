#!/usr/bin/env python3
"""
patch_services_signature.py

Allows platform-level trust and signature normalization for SecSettings.apk
on One UI 9.5 (Android 17 QPR2) so that apktool can rebuild and sign SecSettings.apk
with the project platform key while preserving android.uid.system.
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
        print(f"Usage: {sys.argv[0]} <services.jar>", file=sys.stderr)
        sys.exit(1)

    jar_path = Path(sys.argv[1]).resolve()
    if not jar_path.is_file():
        print(f"Error: {jar_path} not found", file=sys.stderr)
        sys.exit(1)

    # Locate d8
    d8 = os.environ.get("D8")
    if not d8 or not os.path.isfile(d8):
        candidates = [
            "/home/mikey/Android/Sdk/build-tools/36.1.0/d8",
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
        print("Error: d8 not found", file=sys.stderr)
        sys.exit(1)

    print(f"[*] Patching services.jar: {jar_path}")
    print(f"[*] Using d8: {d8}")
    start_time = time.time()

    with tempfile.TemporaryDirectory() as td:
        td_path = Path(td)
        dex_dir = td_path / "dexes"
        dex_dir.mkdir()

        # 1. Split multidex container with d8
        print("[*] Splitting multidex services.jar with d8...")
        subprocess.check_call([d8, "--output", str(dex_dir), str(jar_path)])

        dex_files = sorted(dex_dir.glob("classes*.dex"))
        print(f"[*] Generated {len(dex_files)} DEX files: {[d.name for d in dex_files]}")

        # 2. Locate ScanPackageUtils across DEX files
        target_dex = None
        target_smali_file = None
        target_smali_dir = td_path / "smali_target"

        for df in dex_files:
            test_dir = td_path / f"test_{df.stem}"
            subprocess.check_call(["baksmali", "d", "--api", "34", "-o", str(test_dir), str(df)])
            candidate = test_dir / "com/android/server/pm/ScanPackageUtils.smali"
            if candidate.is_file():
                target_dex = df
                target_smali_dir = test_dir
                target_smali_file = candidate
                print(f"[*] Found ScanPackageUtils.smali in {df.name}")
                break

        if not target_smali_file or not target_smali_file.is_file():
            print("Error: ScanPackageUtils.smali not found in any DEX file!", file=sys.stderr)
            sys.exit(1)

        # 3. Patch ScanPackageUtils.smali
        content = target_smali_file.read_text(encoding="utf-8")
        method_match = re.search(r"(\.method public static applyPolicy\(Lcom/android/internal/pm/parsing/pkg/ParsedPackage;ILcom/android/server/pm/pkg/AndroidPackage;Z\)V\s*\.registers \d+)", content)
        if not method_match:
            print("Error: applyPolicy method not found in ScanPackageUtils.smali!", file=sys.stderr)
            sys.exit(1)
        method_anchor = method_match.group(1)

        norm_hook = """
    # [OneROM] Trust and normalize platform signing details for rebuilt system apps
    invoke-interface {p0}, Lcom/android/internal/pm/parsing/pkg/ParsedPackage;->getPackageName()Ljava/lang/String;
    move-result-object v0
    const-string v1, "com.android.settings"
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :cond_onerom_normalize
    const-string v1, "com.sec.android.app.camera"
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :cond_onerom_normalize
    const-string v1, "com.sec.android.sdhms"
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :cond_onerom_normalize
    const-string v1, "com.android.systemui"
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :cond_onerom_not_settings
    :cond_onerom_normalize
    if-eqz p2, :cond_onerom_not_settings
    invoke-interface {p2}, Lcom/android/server/pm/pkg/AndroidPackage;->getSigningDetails()Landroid/content/pm/SigningDetails;
    move-result-object v0
    invoke-interface {p0, v0}, Lcom/android/internal/pm/parsing/pkg/ParsedPackage;->setSigningDetails(Landroid/content/pm/SigningDetails;)Lcom/android/internal/pm/parsing/pkg/ParsedPackage;
    :cond_onerom_not_settings
"""
        new_content = content.replace(method_anchor, method_anchor + norm_hook, 1)

        sign_anchor = "    invoke-interface {p0, v1}, Lcom/android/internal/pm/parsing/pkg/ParsedPackage;->setSignedWithPlatformKey(Z)Lcom/android/internal/pm/parsing/pkg/ParsedPackage;"
        if sign_anchor in new_content:
            force_sign_hook = """    # [OneROM] Force signedWithPlatformKey for rebuilt system apps
    invoke-interface {p0}, Lcom/android/internal/pm/parsing/pkg/ParsedPackage;->getPackageName()Ljava/lang/String;
    move-result-object v3
    const-string v4, "com.android.settings"
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-nez v4, :cond_onerom_sign_plat
    const-string v4, "com.sec.android.app.camera"
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-nez v4, :cond_onerom_sign_plat
    const-string v4, "com.sec.android.sdhms"
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-nez v4, :cond_onerom_sign_plat
    const-string v4, "com.android.systemui"
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-eqz v4, :cond_onerom_done_plat
    :cond_onerom_sign_plat
    const/4 v1, 0x1
    :cond_onerom_done_plat
"""
            new_content = new_content.replace(sign_anchor, force_sign_hook + sign_anchor, 1)
        else:
            print("Error: setSignedWithPlatformKey anchor not found in ScanPackageUtils.smali!", file=sys.stderr)
            sys.exit(1)

        target_smali_file.write_text(new_content, encoding="utf-8")
        print("[*] Successfully injected platform signature normalization hook into ScanPackageUtils.smali")

        # 3b. Suppress 'There's an internal problem with your device' boot popup in ActivityTaskManagerService
        for smali_f in target_smali_dir.rglob("*.smali"):
            if "1041137" in smali_f.read_text(encoding="utf-8"):
                stxt = smali_f.read_text(encoding="utf-8")
                pat = r"(\.method public final run\(\)V\s*\.registers \d+)"
                rep = r"\1\n    return-void\n"
                new_stxt, cnt = re.subn(pat, rep, stxt, count=1)
                if cnt > 0:
                    smali_f.write_text(new_stxt, encoding="utf-8")
                    print(f"[*] Successfully suppressed internal system error dialog in {smali_f.name}")

        # 3c. Ensure FontManagerService$Lifecycle.onBootPhase never blocks boot across all DEXes
        dexes_to_rebuild = {target_dex: target_smali_dir}
        for df in dex_files:
            test_dir = td_path / f"test_{df.stem}"
            fms_lifecycle = test_dir / "com/android/server/graphics/fonts/FontManagerService$Lifecycle.smali"
            if fms_lifecycle.is_file():
                fcontent = fms_lifecycle.read_text(encoding="utf-8")
                pat = r"(\.method public final onBootPhase\(I\)V.*?\n\.end method)"
                safe_onbootphase = """.method public final onBootPhase(I)V
    .registers 3

    :try_start_0
    iget-object v0, p0, Lcom/android/server/graphics/fonts/FontManagerService$Lifecycle;->mServiceStarted:Ljava/util/concurrent/CompletableFuture;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/util/concurrent/CompletableFuture;->join()Ljava/lang/Object;
    :cond_0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catch_all

    :catch_all
    return-void
.end method"""
                new_fcontent, cnt = re.subn(pat, safe_onbootphase, fcontent, flags=re.DOTALL)
                if cnt > 0:
                    fms_lifecycle.write_text(new_fcontent, encoding="utf-8")
                    dexes_to_rebuild[df] = test_dir
                    print(f"[*] Successfully protected FontManagerService$Lifecycle.onBootPhase in {df.name}")

        # 3d. Suppress enforceTaskPermission in ActivityTaskManagerService.getCutoutPolicy$1
        for df in dex_files:
            test_dir = td_path / f"test_{df.stem}"
            atms = test_dir / "com/android/server/wm/ActivityTaskManagerService.smali"
            if atms.is_file():
                atms_content = atms.read_text(encoding="utf-8")
                pat = r"(\.method public final getCutoutPolicy\$1\(ILjava/lang/String;\)I\s*\.registers \d+\n\s*const-string/jumbo v0, \"getCutoutPolicy\(\)\"\n\s*invoke-static \{v0\}, Lcom/android/server/wm/ActivityTaskManagerService;->enforceTaskPermission\(Ljava/lang/String;\)V\n)"
                rep = ".method public final getCutoutPolicy$1(ILjava/lang/String;)I\n    .registers 6\n"
                new_atms_content, cnt = re.subn(pat, rep, atms_content)
                if cnt > 0:
                    atms.write_text(new_atms_content, encoding="utf-8")
                    dexes_to_rebuild[df] = test_dir
                    print(f"[*] Successfully bypassed enforceTaskPermission in getCutoutPolicy in {df.name}")

        # 3e. Disable AppZygote in HostingRecord.usesAppZygote() to prevent Chromium sandbox crashes on kernel 4.14
        for df in dex_files:
            test_dir = td_path / f"test_{df.stem}"
            hr_smali = test_dir / "com/android/server/am/HostingRecord.smali"
            if hr_smali.is_file():
                hr_content = hr_smali.read_text(encoding="utf-8")
                pat = r"(\.method public final usesAppZygote\(\)Z\s*\.registers \d+\n)(.*?)(\.end method)"
                rep = r"\1    const/4 v0, 0x0\n    return v0\n\3"
                new_hr_content, cnt = re.subn(pat, rep, hr_content, flags=re.DOTALL)
                if cnt > 0:
                    hr_smali.write_text(new_hr_content, encoding="utf-8")
                    dexes_to_rebuild[df] = test_dir
                    print(f"[*] Successfully disabled usesAppZygote in {df.name}")

        # 4. Reassemble modified DEXes
        for df, sdir in dexes_to_rebuild.items():
            print(f"[*] Reassembling {df.name} with smali...")
            df.unlink()
            subprocess.check_call(["smali", "a", "--api", "34", "-j", "16", "-o", str(df), str(sdir)])

        # 5. Repack services.jar with ZIP_STORED DEXes
        print("[*] Repacking services.jar...")
        tmp_jar = td_path / "services_patched.jar"
        with zipfile.ZipFile(jar_path, "r") as zin, zipfile.ZipFile(tmp_jar, "w") as zout:
            for item in zin.infolist():
                if item.filename.endswith(".dex"):
                    continue
                zout.writestr(item, zin.read(item.filename))

            for df in sorted(dex_dir.glob("classes*.dex")):
                zout.write(df, df.name, compress_type=zipfile.ZIP_STORED)

        shutil.copy2(tmp_jar, jar_path)
        print(f"[+] Successfully patched services.jar in {time.time()-start_time:.2f}s (size: {jar_path.stat().st_size} bytes)")

if __name__ == "__main__":
    main()
