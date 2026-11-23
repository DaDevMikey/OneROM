#!/usr/bin/env python3
import hashlib
import sys
from pathlib import Path


ZYGOTE_SYS_ORIG_SHA256 = "f7b77443a5375c799145af6d773fbdb70f4452d13c3e67fcddfbe799fdc235dc"
ZYGOTE_SYS_PATCHED_SHA256 = "082390a0fe44da7151c8d05d0c4b995bd2e4800aa68ef61a6cd046126a0a6182"
ZYGOTE_SYS_OFFSET = 0xB218
ZYGOTE_SYS_OLD = bytes.fromhex("12130094")
ZYGOTE_SYS_NEW = bytes.fromhex("ee120094")

CAP_RUST_ORIG_SHA256 = "8f6c2a03e916d3fb84352a6b1a0026ed2b7e16a98720fb33693ea373a1580d3f"
CAP_RUST_PATCHED_SHA256 = "ffe1e62740ef7e98333dfa7803ed505db86f8417c30e1c47295c60050f8bcbcc"
CAP_RUST_OFFSET = 0x319C
CAP_RUST_OLD = bytes.fromhex("608200aa f30b40f9 fd7bc2a8 bf2303d5 c0035fd6")
CAP_RUST_NEW = bytes.fromhex("1f580071 608200aa e8008052 0001809a f6ffff17")


def patch_file(path, orig_sha, patched_sha, offset, old, new, label):
    data = bytearray(path.read_bytes())
    digest = hashlib.sha256(data).hexdigest()
    if digest == patched_sha:
        return
    if digest != orig_sha:
        raise ValueError(f"Unexpected {label} SHA-256: {digest}")
    if data[offset:offset + len(old)] != old:
        raise ValueError(f"Unexpected {label} instructions at {offset:#x}")
    data[offset:offset + len(old)] = new
    if hashlib.sha256(data).hexdigest() != patched_sha:
        raise ValueError(f"Unexpected patched {label} SHA-256")
    path.write_bytes(data)


def main():
    if len(sys.argv) != 3:
        raise SystemExit(f"Usage: {sys.argv[0]} <libzygote_sys.dylib.so> <libcap_rust.dylib.so>")
    patch_file(
        Path(sys.argv[1]),
        ZYGOTE_SYS_ORIG_SHA256,
        ZYGOTE_SYS_PATCHED_SHA256,
        ZYGOTE_SYS_OFFSET,
        ZYGOTE_SYS_OLD,
        ZYGOTE_SYS_NEW,
        "libzygote_sys.dylib.so",
    )
    patch_file(
        Path(sys.argv[2]),
        CAP_RUST_ORIG_SHA256,
        CAP_RUST_PATCHED_SHA256,
        CAP_RUST_OFFSET,
        CAP_RUST_OLD,
        CAP_RUST_NEW,
        "libcap_rust.dylib.so",
    )


if __name__ == "__main__":
    main()
