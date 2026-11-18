#!/usr/bin/env python3
#
# Copyright (C) 2026 OneROM Delta contributors
#
# Patch libbluetooth_jni.so inside com.android.bt.apex to bypass missing
# Exynos 9820 vendor.samsung.hardware.bluetooth.a2dp HIDL offload HAL and
# prevent btif_a2dp_audio_interface assertion crash (Check failed: btAudio != nullptr).
#

import sys
import struct
import zlib
import zipfile

def patch_apex(apex_path):
    print(f"[*] Patching Bluetooth APEX: {apex_path}")
    with open(apex_path, "r+b") as f:
        # 1. Local file header check for apex_payload.img
        sig = f.read(4)
        if sig != b"\x50\x4b\x03\x04":
            print("[-] Error: Not a valid ZIP file")
            return False

        f.seek(26)
        fn_len, extra_len = struct.unpack("<HH", f.read(4))
        payload_offset = 30 + fn_len + extra_len

        # 2. Patch sites
        # Site 1: btif_a2dp_audio_interface_start_session (0x679060)
        p1_offset = payload_offset + 0xb86000 + 0x679060
        f.seek(p1_offset)
        cur1 = f.read(16)
        orig1 = bytes.fromhex("3f2303d55e8600f8fd7bbba9fc0b00f9")
        patch1 = bytes.fromhex("3f2303d5bf2303d5c0035fd61f2003d5")

        if cur1 == patch1:
            print("[+] Site 1 already patched.")
        elif cur1 == orig1:
            f.seek(p1_offset)
            f.write(patch1)
            print("[+] Successfully patched Site 1 (btif_a2dp_audio_interface_start_session -> return).")
        else:
            print(f"[-] Warning: Site 1 bytes unexpected: {cur1.hex()}")

        # Site 2: btif_a2dp_source_start_session_delayed (0x6887fc)
        p2_offset = payload_offset + 0xb86000 + 0x6887fc
        f.seek(p2_offset)
        cur2 = f.read(4)
        orig2 = bytes.fromhex("81000054")
        patch2 = bytes.fromhex("04000014")

        if cur2 == patch2:
            print("[+] Site 2 already patched.")
        elif cur2 == orig2:
            f.seek(p2_offset)
            f.write(patch2)
            print("[+] Successfully patched Site 2 (b.ne -> unconditional branch over offload start).")
        else:
            print(f"[-] Warning: Site 2 bytes unexpected: {cur2.hex()}")

        # 3. Recalculate CRC32
        payload_len = 28180480
        f.seek(payload_offset)
        payload_data = f.read(payload_len)
        if len(payload_data) != payload_len:
            print(f"[-] Error: Failed to read full payload ({len(payload_data)} vs {payload_len})")
            return False

        new_crc = zlib.crc32(payload_data)
        print(f"[+] Computed new payload CRC32: {hex(new_crc)}")

        # 4. Write CRC32 into local header
        f.seek(14)
        f.write(struct.pack("<I", new_crc))

        # 5. Locate central directory header for apex_payload.img
        f.seek(0, 2)
        file_size = f.tell()

        # Search from start_dir
        f.seek(0)
        zf = zipfile.ZipFile(f, "r")
        cd_offset = zf.start_dir

        f.seek(cd_offset)
        cd_sig = f.read(4)
        if cd_sig == b"\x50\x4b\x01\x02":
            f.seek(cd_offset + 16)
            f.write(struct.pack("<I", new_crc))
            print(f"[+] Updated central directory CRC32 at {hex(cd_offset + 16)}")
        else:
            print(f"[-] Warning: Central directory header signature mismatch at {hex(cd_offset)}")

    # 6. Verify zip integrity
    with zipfile.ZipFile(apex_path, "r") as zf:
        bad = zf.testzip()
        if bad is not None:
            print(f"[-] Error: ZIP validation failed on file: {bad}")
            return False
        print("[+] ZIP archive validation PASSED.")

    return True

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: patch_bluetooth_apex.py <path_to_com.android.bt.apex>")
        sys.exit(1)

    success = patch_apex(sys.argv[1])
    sys.exit(0 if success else 1)
