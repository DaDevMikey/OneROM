#!/usr/bin/env python3
"""
Patch Samsung NFC antenna position assertion crash in SecSettings.
Prevents VerifyError and IllegalArgumentException by cleanly jumping over
the antenna position validation blocks before any registers are overwritten.
"""
import os
import re
import sys

def patch_nfc_settings(file_path):
    if not os.path.exists(file_path):
        return False
    with open(file_path, "r", encoding="utf-8") as f:
        content = f.read()

    # In NfcSettings.smali, jump directly to :goto_4 before checking antpos
    # This prevents p0 from being clobbered with a String (which caused ART VerifyError)
    target = "if-nez v1, :cond_c"
    replacement = "goto :goto_4"
    if target in content:
        content = content.replace(target, replacement, 1)

    # In the error blocks cond_9, cond_a, cond_b, terminate with return-void so no clobbered register merges with :goto_4
    pattern_err = r"(invoke-static \{[pv]\d+\}, Lokio/Buffer\$\$ExternalSyntheticBUOutline0;->m\(Ljava/lang/String;\)V\s+return-void|goto :goto_4)"
    # Replace any leftover jump from cond_9/cond_a/cond_b with return-void
    content = re.sub(r"(:cond_9\s+const-string p0, [^\n]+\s+invoke-static \{v7, p0\}, Lcom/samsung/android/util/SemLog;->d\(Ljava/lang/String;Ljava/lang/String;\)I\s+)(goto :goto_4|return-void)", r"\1return-void", content)
    content = re.sub(r"(invoke-static \{v8, p1\}, Landroidx/appcompat/util/SeslRoundedCorner\$\$ExternalSyntheticOutline0;->m\(ILjava/lang/String;\)Ljava/lang/String;\s+move-result-object p0\s+)(goto :goto_4|return-void)", r"\1return-void", content)
    content = re.sub(r"(invoke-static \{v1, v8, p0, p1\}, Landroidx/compose/foundation/text/input/TextFieldBuffer\$\$ExternalSyntheticOutline0;->m\(IILjava/lang/String;Ljava/lang/String;\)Ljava/lang/String;\s+move-result-object p0\s+)(goto :goto_4|return-void)", r"\1return-void", content)

    with open(file_path, "w", encoding="utf-8") as f:
        f.write(content)
    print("Patched NfcSettings.smali cleanly")
    return True

def patch_antenna_guide(file_path):
    if not os.path.exists(file_path):
        return False
    with open(file_path, "r", encoding="utf-8") as f:
        content = f.read()

    # In NfcAntennaGuideDialog.smali, jump directly to :goto_0 before checking antpos
    target = "if-nez v1, :cond_3"
    replacement = "goto :goto_0"
    if target in content:
        content = content.replace(target, replacement, 1)

    # In error blocks, terminate with return-void
    content = re.sub(r"(invoke-static \{v3, p1\}, Landroidx/appcompat/util/SeslRoundedCorner\$\$ExternalSyntheticOutline0;->m\(ILjava/lang/String;\)Ljava/lang/String;\s+move-result-object p0\s+)(goto :goto_0|return-void)", r"\1return-void", content)
    content = re.sub(r"(:cond_0\s+const-string p0, [^\n]+\s+invoke-static \{v0, p0\}, Landroid/util/Log;->d\(Ljava/lang/String;Ljava/lang/String;\)I\s+)(goto :goto_0|return-void)", r"\1return-void", content)
    content = re.sub(r"(invoke-static \{v1, v3, p0, p1\}, Landroidx/compose/foundation/text/input/TextFieldBuffer\$\$ExternalSyntheticOutline0;->m\(IILjava/lang/String;Ljava/lang/String;\)Ljava/lang/String;\s+move-result-object p0\s+)(goto :goto_0|return-void)", r"\1return-void", content)

    with open(file_path, "w", encoding="utf-8") as f:
        f.write(content)
    print("Patched NfcAntennaGuideDialog.smali cleanly")
    return True

def main():
    if len(sys.argv) < 2:
        print("Usage: patch_nfc.py <SecSettings_apktool_dir>")
        sys.exit(1)

    apk_dir = sys.argv[1]
    for root, _, files in os.walk(apk_dir):
        for f in files:
            if f == "NfcSettings.smali":
                patch_nfc_settings(os.path.join(root, f))
            elif f == "NfcAntennaGuideDialog.smali":
                patch_antenna_guide(os.path.join(root, f))

if __name__ == "__main__":
    main()
