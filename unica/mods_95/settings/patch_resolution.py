#!/usr/bin/env python3
"""
patch_resolution.py

Patches SecDisplayUtils in SecSettings so resolution changes (HD+, FHD+, WQHD+)
invoke IWindowManager.setForcedDisplaySizeDensity with fixed 19:9 width/height/density,
preventing display scaling from getting stuck on QHD+ or shrinking DPI.
"""

import re
import sys
from pathlib import Path

METHOD = r""".method public static setDisplayMode(Landroid/content/Context;Ljava/lang/String;Landroid/view/Display;)V
    .registers 16

    if-eqz p1, :s10_resolution_done

    :s10_resolution_try
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    move-result v0

    const/16 v1, 0x5a0
    const/16 v2, 0x230
    if-eqz v0, :s10_resolution_hd
    const/4 v4, 0x1
    if-eq v0, v4, :s10_resolution_fhd
    const/4 v4, 0x2
    if-ne v0, v4, :s10_resolution_done
    goto :s10_resolution_size

    :s10_resolution_fhd
    const/16 v1, 0x438
    const/16 v2, 0x1a4
    goto :s10_resolution_size

    :s10_resolution_hd
    const/16 v1, 0x2d0
    const/16 v2, 0x118

    :s10_resolution_size
    mul-int/lit8 v3, v1, 0x13
    div-int/lit8 v3, v3, 0x9
    invoke-static {}, Landroid/view/WindowManagerGlobal;->getWindowManagerService()Landroid/view/IWindowManager;
    move-result-object v6
    const/4 v7, 0x0
    move v8, v1
    move v9, v3
    move v10, v2
    const/4 v11, 0x1
    const/4 v12, -0x1
    invoke-interface/range {v6 .. v12}, Landroid/view/IWindowManager;->setForcedDisplaySizeDensity(IIIIZI)V
    :s10_resolution_try_end
    .catch Ljava/lang/Exception; {:s10_resolution_try .. :s10_resolution_try_end} :s10_resolution_error

    :s10_resolution_done
    return-void

    :s10_resolution_error
    move-exception v0
    const-string v1, "S10Resolution"
    const-string v2, "Unable to apply resolution"
    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    return-void
.end method"""

def main():
    if len(sys.argv) < 2:
        print("Usage: patch_resolution.py <smali_dir>", file=sys.stderr)
        sys.exit(1)

    smali_dir = Path(sys.argv[1])
    target_file = None
    for f in smali_dir.rglob("SecDisplayUtils.smali"):
        target_file = f
        break

    if not target_file or not target_file.is_file():
        print(f"Error: SecDisplayUtils.smali not found in {smali_dir}", file=sys.stderr)
        sys.exit(1)

    source = target_file.read_text(encoding="utf-8")
    pat = r"\.method public static setDisplayMode\(Landroid/content/Context;Ljava/lang/String;Landroid/view/Display;\)V.*?\.end method"
    source, count = re.subn(pat, lambda m: METHOD, source, flags=re.S)
    if count != 1:
        # Fallback to 2-arg setDisplayMode if 3-arg isn't present
        pat2 = r"\.method public static setDisplayMode\(Ljava/lang/String;Landroid/view/Display;\)V.*?\.end method"
        source, count = re.subn(pat2, lambda m: METHOD, source, flags=re.S)

    if count != 1:
        print(f"Error: Expected exactly 1 match for setDisplayMode, got {count}", file=sys.stderr)
        sys.exit(1)

    target_file.write_text(source, encoding="utf-8")
    print(f"Successfully patched setDisplayMode in {target_file}")

if __name__ == "__main__":
    main()
