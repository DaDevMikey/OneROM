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


PAYLOAD_ENTRY = "apex_payload.img"
# Raw ext4 payload offset of libbluetooth_jni.so in the current donor APEX.
LIBRARY_OFFSET = 0xC71000
PATCH_SITES = (
    (
        "btif_a2dp_audio_interface_start_session",
        LIBRARY_OFFSET + 0x7AB8A8,
        bytes.fromhex("3f2303d55e8600f8fd7bbba9fc0b00f9"),
        bytes.fromhex("3f2303d5bf2303d5c0035fd61f2003d5"),
    ),
    (
        "btif_a2dp_source_start_session_delayed",
        LIBRARY_OFFSET + 0x7BB044,
        bytes.fromhex("81000054"),
        bytes.fromhex("04000014"),
    ),
)


def _find_payload_data_offset(file, info):
    file.seek(info.header_offset)
    header = file.read(30)
    if len(header) != 30 or header[:4] != b"\x50\x4b\x03\x04":
        raise ValueError("Invalid apex_payload.img local file header")

    flags, method = struct.unpack_from("<HH", header, 6)
    name_len, extra_len = struct.unpack_from("<HH", header, 26)
    name = file.read(name_len)
    if name != info.filename.encode("utf-8"):
        raise ValueError("APEX local and central directory names do not match")
    if (
        flags & 0x1
        or method != zipfile.ZIP_STORED
        or info.compress_type != zipfile.ZIP_STORED
    ):
        raise ValueError("apex_payload.img must be an unencrypted, uncompressed ZIP entry")

    return info.header_offset + 30 + name_len + extra_len


def _find_central_crc_offset(file, zip_file, info):
    file.seek(zip_file.start_dir)
    while True:
        record_offset = file.tell()
        signature = file.read(4)
        if signature != b"\x50\x4b\x01\x02":
            raise ValueError("Could not locate apex_payload.img central directory record")

        header = file.read(42)
        if len(header) != 42:
            raise ValueError("Truncated APEX central directory record")
        name_len, extra_len, comment_len = struct.unpack_from("<HHH", header, 24)
        name = file.read(name_len)
        if name == info.filename.encode("utf-8"):
            return record_offset + 16
        file.seek(extra_len + comment_len, 1)


def patch_apex(apex_path):
    print(f"[*] Patching Bluetooth APEX: {apex_path}")
    with open(apex_path, "r+b") as file, zipfile.ZipFile(apex_path, "r") as zip_file:
        try:
            info = zip_file.getinfo(PAYLOAD_ENTRY)
        except KeyError as error:
            raise ValueError(f"APEX is missing {PAYLOAD_ENTRY}") from error

        payload_offset = _find_payload_data_offset(file, info)
        if info.file_size < max(offset + len(original) for _, offset, original, _ in PATCH_SITES):
            raise ValueError("apex_payload.img is too small for the supported Bluetooth APEX")

        current_sites = []
        for name, offset, original, patched in PATCH_SITES:
            file.seek(payload_offset + offset)
            current = file.read(len(original))
            if current == original:
                current_sites.append((name, offset, patched, False))
            elif current == patched:
                current_sites.append((name, offset, patched, True))
            else:
                raise ValueError(
                    f"Unexpected bytes at {name} payload offset {offset:#x}: {current.hex()}"
                )

        for name, offset, patched, already_patched in current_sites:
            if not already_patched:
                file.seek(payload_offset + offset)
                file.write(patched)
            status = "already patched" if already_patched else "patched"
            print(f"[+] {name}: {status}")

        crc = 0
        file.seek(payload_offset)
        remaining = info.file_size
        while remaining:
            chunk = file.read(min(1024 * 1024, remaining))
            if not chunk:
                raise ValueError("Failed to read the complete apex_payload.img")
            crc = zlib.crc32(chunk, crc)
            remaining -= len(chunk)

        file.seek(info.header_offset + 14)
        file.write(struct.pack("<I", crc))
        central_crc_offset = _find_central_crc_offset(file, zip_file, info)
        file.seek(central_crc_offset)
        file.write(struct.pack("<I", crc))
        print(f"[+] Updated full payload CRC32: {crc:#x}")

    with zipfile.ZipFile(apex_path, "r") as zf:
        bad = zf.testzip()
        if bad is not None:
            raise ValueError(f"ZIP validation failed on file: {bad}")
        print("[+] ZIP archive validation PASSED.")

    return 0

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: patch_bluetooth_apex.py <path_to_com.android.bt.apex>")
        sys.exit(1)

    try:
        sys.exit(patch_apex(sys.argv[1]))
    except (OSError, ValueError, zipfile.BadZipFile) as error:
        print(f"[-] Bluetooth APEX patch failed: {error}", file=sys.stderr)
        sys.exit(1)
