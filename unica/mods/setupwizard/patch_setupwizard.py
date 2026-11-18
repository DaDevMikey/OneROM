#!/usr/bin/env python3
import os
import sys
import re
import shutil

def patch_setupwizard(target_dir, mod_dir):
    print(f"[setupwizard] Patching SecSetupWizard_Global in {target_dir}")

    # 1. Patch smali/e7/f.smali (One UI 8.5/9.0) or smali/S2/f.smali (One UI 8.0)
    f_smali_path = None
    for cand in ['smali/e7/f.smali', 'smali/S2/f.smali']:
        p = os.path.join(target_dir, cand)
        if os.path.isfile(p):
            f_smali_path = p
            break
            
    if not f_smali_path:
        # Search for any f.smali with disclaimer
        for root, dirs, files in os.walk(target_dir):
            if 'f.smali' in files:
                candidate = os.path.join(root, 'f.smali')
                with open(candidate, 'r', errors='ignore') as f:
                    if '"disclaimer"' in f.read():
                        f_smali_path = candidate
                        break

    if f_smali_path:
        print(f"[setupwizard] Found step sequence class: {f_smali_path}")
        with open(f_smali_path, 'r') as f:
            c = f.read()

        # Unconditionally add disclaimer
        m_disc = re.search(r'(const-string v13, "disclaimer"[\s\S]*?move-result v13[\s\S]*?if-eqz v13, :cond_[a-zA-Z0-9_]+)', c)
        if m_disc:
            c = c[:m_disc.end()] + '\n\n    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z\n\n    goto/16 :goto_8' + c[m_disc.end():]
            print("[setupwizard] Injected disclaimer sequence jump")
        else:
            print("[setupwizard] WARNING: Could not find disclaimer block in step sequence class")

        # Unconditionally add navigationbar_setting
        m_nav = re.search(r'(const-string v13, "navigationbar_setting"[\s\S]*?move-result v13[\s\S]*?if-eqz v13, :cond_[a-zA-Z0-9_]+)', c)
        if m_nav:
            c = c[:m_nav.end()] + '\n\n    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z\n\n    goto/16 :goto_8' + c[m_nav.end():]
            print("[setupwizard] Injected navigationbar sequence jump")
        else:
            print("[setupwizard] WARNING: Could not find navigationbar block in step sequence class")

        with open(f_smali_path, 'w') as f:
            f.write(c)

    # 2. Patch SecSetupWizardActivity.smali
    act_path = os.path.join(target_dir, 'smali/com/sec/android/app/SecSetupWizard/SecSetupWizardActivity.smali')
    if os.path.isfile(act_path):
        with open(act_path, 'r') as f:
            ac = f.read()
        m_act = re.search(r'(const-string v0, "navigationbar_setting"[\s\S]*?move-result v0[\s\S]*?if-eqz v0, :cond_[a-zA-Z0-9_]+)', ac)
        if m_act:
            ac = ac[:m_act.end()] + '\n\n    const/4 p0, 0x1\n\n    return p0' + ac[m_act.end():]
            print("[setupwizard] Patched SecSetupWizardActivity navigationbar condition")
            with open(act_path, 'w') as f:
                f.write(ac)
        else:
            print("[setupwizard] WARNING: Could not find navigationbar check in SecSetupWizardActivity.smali")

    # 3. Patch DisclaimerActivity.smali
    da_path = os.path.join(target_dir, 'smali/com/sec/android/app/SecSetupWizard/UI/DisclaimerActivity.smali')
    if os.path.isfile(da_path):
        with open(da_path, 'r') as f:
            dc = f.read()
        m_da = re.search(r'(const p1, 0x7f0a0110[\s\S]*?check-cast p1, Landroid/widget/TextView;)', dc)
        if m_da:
            intro_smali = r'''

    const-string v0, "Welcome to OneROM 9!\n\nOneROM includes customized Exynos 9820 optimizations, OneKernel with KernelSU Next, flagship Galaxy S26 Ultra app spoofing, and advanced ROM Settings.\n\nConfigure your initial device preferences below. You can change these anytime in ROM Settings."

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void'''
            dc = dc[:m_da.end()] + intro_smali + dc[m_da.end():]
            print("[setupwizard] Injected OneROM welcome text and return in DisclaimerActivity")
        else:
            print("[setupwizard] WARNING: Could not find text view lookup in DisclaimerActivity.smali")

        # Append BixbySetupMethods.smali
        bixby_file = os.path.join(mod_dir, 'SecSetupWizard_Global.apk/smali/BixbySetupMethods.smali')
        if os.path.isfile(bixby_file):
            with open(bixby_file, 'r') as bf:
                bixby_code = bf.read()
            dc += '\n' + bixby_code
            print("[setupwizard] Appended Bixby setup methods to DisclaimerActivity")

        with open(da_path, 'w') as f:
            f.write(dc)

    # 4. Copy layout
    src_layout = os.path.join(mod_dir, 'SecSetupWizard_Global.apk/res/layout/disclaimer_activity.xml')
    dst_layout = os.path.join(target_dir, 'res/layout/disclaimer_activity.xml')
    if os.path.isfile(src_layout):
        os.makedirs(os.path.dirname(dst_layout), exist_ok=True)
        shutil.copyfile(src_layout, dst_layout)
        print("[setupwizard] Copied disclaimer_activity.xml layout")

    # 5. Manifest permission
    manifest_path = os.path.join(target_dir, 'AndroidManifest.xml')
    if os.path.isfile(manifest_path):
        with open(manifest_path, 'r') as f:
            mc = f.read()
        if 'android.permission.WRITE_SETTINGS' not in mc:
            mc = re.sub(r'<manifest\b([^>]*)>', r'<manifest\1>\n    <uses-permission android:name="android.permission.WRITE_SETTINGS" />', mc)
            with open(manifest_path, 'w') as f:
                f.write(mc)
            print("[setupwizard] Added WRITE_SETTINGS permission to AndroidManifest.xml")

    # 6. Strings & Arrays
    for root, dirs, files in os.walk(os.path.join(target_dir, 'res')):
        for fname in files:
            if fname == 'strings.xml':
                spath = os.path.join(root, fname)
                with open(spath, 'r') as sf:
                    sfc = sf.read()
                if 'special_edition_model_disclaimer_title' in sfc:
                    sfc = re.sub(r'<string name="special_edition_model_disclaimer_title">.*?</string>',
                                 '<string name="special_edition_model_disclaimer_title">Set up OneROM</string>',
                                 sfc)
                    with open(spath, 'w') as sf:
                        sf.write(sfc)

    arr_path = os.path.join(target_dir, 'res/values/arrays.xml')
    if os.path.isfile(arr_path):
        with open(arr_path, 'r') as af:
            afc = af.read()
        afc = re.sub(r'<item>omcagent</item>\s*', '', afc)
        with open(arr_path, 'w') as af:
            af.write(afc)

    print("[setupwizard] Patching completed successfully!")

if __name__ == '__main__':
    if len(sys.argv) < 3:
        print("Usage: patch_setupwizard.py <target_apktool_dir> <mod_dir>")
        sys.exit(1)
    patch_setupwizard(sys.argv[1], sys.argv[2])
