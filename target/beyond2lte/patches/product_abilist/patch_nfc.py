#!/usr/bin/env python3
"""
Patch Samsung NFC antenna position assertion crash in SecSettings.
Prevents IllegalArgumentException when SEC_PRODUCT_FEATURE_NFC_CONFIG_ANTENNA_POSITION
does not match ro.vendor.nfc.info.antpos.
"""
import os
import re
import sys

def patch_smali(file_path, goto_label):
    if not os.path.exists(file_path):
        print(f"Warning: {file_path} not found")
        return False
    with open(file_path, "r", encoding="utf-8") as f:
        content = f.read()

    pattern = r"invoke-static \{p0\}, Lokio/Buffer\$\$ExternalSyntheticBUOutline0;->m\(Ljava/lang/String;\)V\s+return-void"
    replacement = f"goto {goto_label}"
    new_content, count = re.subn(pattern, replacement, content)
    if count > 0:
        with open(file_path, "w", encoding="utf-8") as f:
            f.write(new_content)
        print(f"Patched {count} throw assertion(s) in {os.path.basename(file_path)}")
        return True
    print(f"No throw assertion found in {os.path.basename(file_path)}")
    return False

def main():
    if len(sys.argv) < 2:
        print("Usage: patch_nfc.py <SecSettings_apktool_dir>")
        sys.exit(1)

    apk_dir = sys.argv[1]
    nfc_settings = None
    antenna_guide = None

    for root, _, files in os.walk(apk_dir):
        for f in files:
            if f == "NfcSettings.smali":
                nfc_settings = os.path.join(root, f)
            elif f == "NfcAntennaGuideDialog.smali":
                antenna_guide = os.path.join(root, f)

    if nfc_settings:
        patch_smali(nfc_settings, ":goto_4")
    if antenna_guide:
        patch_smali(antenna_guide, ":goto_0")

if __name__ == "__main__":
    main()
