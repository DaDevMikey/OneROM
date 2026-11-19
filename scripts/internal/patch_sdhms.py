#!/usr/bin/env python3
"""
patch_sdhms.py

Patches SamsungDeviceHealthManagerService.apk to suppress the 'SSRM Warning' popup.
Finds method Lo5/b1;->M dynamically, replaces its bytecode with return-void followed by nops,
recomputes Adler-32 and SHA-1 DEX headers, and writes classes.jar into
/system/framework/s10-app-overrides/SamsungDeviceHealthManagerService.apk along with apk.sha256.
"""

import sys
import zlib
import struct
import hashlib
import zipfile
from pathlib import Path

def read_uleb128(data: bytearray, off: int):
    res = 0
    shift = 0
    while True:
        b = data[off]
        off += 1
        res |= (b & 0x7f) << shift
        if (b & 0x80) == 0:
            break
        shift += 7
    return res, off

def find_method_code_off(dex: bytearray, class_descriptor: str, method_name: str):
    string_ids_size, string_ids_off = struct.unpack_from("<II", dex, 56)
    type_ids_size, type_ids_off = struct.unpack_from("<II", dex, 64)
    method_ids_size, method_ids_off = struct.unpack_from("<II", dex, 88)
    class_defs_size, class_defs_off = struct.unpack_from("<II", dex, 96)

    strings = []
    for i in range(string_ids_size):
        str_off, = struct.unpack_from("<I", dex, string_ids_off + i * 4)
        idx = str_off
        while dex[idx] & 0x80:
            idx += 1
        idx += 1
        end = dex.find(b"\x00", idx)
        strings.append(dex[idx:end].decode("utf-8", errors="replace"))

    types = [strings[struct.unpack_from("<I", dex, type_ids_off + i * 4)[0]] for i in range(type_ids_size)]
    if class_descriptor not in types:
        return None
    target_class_idx = types.index(class_descriptor)

    for i in range(class_defs_size):
        class_idx, _, _, _, _, _, class_data_off, _ = struct.unpack_from("<IIIIIIII", dex, class_defs_off + i * 32)
        if class_idx == target_class_idx:
            off = class_data_off
            sf_sz, off = read_uleb128(dex, off)
            if_sz, off = read_uleb128(dex, off)
            dm_sz, off = read_uleb128(dex, off)
            vm_sz, off = read_uleb128(dex, off)
            for _ in range(sf_sz + if_sz):
                _, off = read_uleb128(dex, off)
                _, off = read_uleb128(dex, off)
            m_idx = 0
            for _ in range(dm_sz):
                diff, off = read_uleb128(dex, off)
                m_idx += diff
                _, off = read_uleb128(dex, off)
                c_off, off = read_uleb128(dex, off)
                _, _, n_idx = struct.unpack_from("<HHI", dex, method_ids_off + m_idx * 8)
                if strings[n_idx] == method_name:
                    return c_off
    return None

def patch_sdhms(apk_path: Path, work_dir: Path):
    if not apk_path.is_file():
        print(f"[!] SDHMS APK not found at {apk_path}, skipping SDHMS patch")
        return

    print(f"[*] Patching SDHMS to suppress SSRM Warning: {apk_path}")
    raw_apk = apk_path.read_bytes()
    apk_sha256 = hashlib.sha256(raw_apk).hexdigest()

    with zipfile.ZipFile(apk_path, "r") as z:
        dex = bytearray(z.read("classes.dex"))

    code_off = find_method_code_off(dex, "Lo5/b1;", "M")
    if code_off is None:
        print("[*] Falling back to default offset 0x1719c8 for Lo5/b1;->M")
        code_off = 0x1719c8

    registers_size, ins_size, outs_size, tries_size, debug_info_off, insns_size = struct.unpack_from("<HHHHII", dex, code_off)
    print(f"[*] Method M code_off=0x{code_off:x}, insns_size={insns_size}, registers_size={registers_size}")

    # Fill all instructions with return-void followed by nops
    # 0x0e 0x00 = return-void
    # 0x00 0x00 = nop
    insns_start = code_off + 16
    insns_bytes = b"\x0e\x00" + (b"\x00\x00" * (insns_size - 1))
    dex[insns_start : insns_start + len(insns_bytes)] = insns_bytes

    # Recompute SHA-1 (bytes 12..32) and Adler-32 (bytes 8..12)
    new_sha1 = hashlib.sha1(dex[32:]).digest()
    dex[12:32] = new_sha1
    new_adler = zlib.adler32(dex[12:]) & 0xffffffff
    struct.pack_into("<I", dex, 8, new_adler)

    # Destination directory
    dest_dir = work_dir / "system/system/framework/s10-app-overrides/SamsungDeviceHealthManagerService.apk"
    dest_dir.mkdir(parents=True, exist_ok=True)

    # Write classes.jar containing patched classes.dex
    jar_path = dest_dir / "classes.jar"
    with zipfile.ZipFile(jar_path, "w", compression=zipfile.ZIP_DEFLATED) as zout:
        zout.writestr("classes.dex", dex)

    # Write apk.sha256
    sha_path = dest_dir / "apk.sha256"
    sha_path.write_text(apk_sha256 + "\n")

    # Also update the APK directly in-place with the patched classes.dex
    tmp_apk = apk_path.with_suffix(".tmp")
    with zipfile.ZipFile(apk_path, "r") as zin, zipfile.ZipFile(tmp_apk, "w") as zout:
        for item in zin.infolist():
            if item.filename == "classes.dex":
                continue
            zout.writestr(item, zin.read(item.filename))
        zout.writestr("classes.dex", dex, compress_type=zipfile.ZIP_DEFLATED)
    tmp_apk.replace(apk_path)
    print(f"[+] Successfully patched SDHMS in-place at {apk_path}")

    print(f"[+] Successfully generated SDHMS override jar at {jar_path} (sha256: {apk_sha256[:16]}...)")

if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: patch_sdhms.py <sdhms_apk> <work_dir>", file=sys.stderr)
        sys.exit(1)
    patch_sdhms(Path(sys.argv[1]), Path(sys.argv[2]))
