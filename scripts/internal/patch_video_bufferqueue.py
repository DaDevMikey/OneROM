#!/usr/bin/env python3
import hashlib
import sys
from pathlib import Path


ORIGINAL_SHA256 = "260cf7098ab15e44ee98b26fc4051f9e9ae47d0a509f757eab8f8c95ed82ca93"
PATCHED_SHA256 = "47076020766979fc841199f77d2071d0fe4b025b18b78c030b2279f64183501a"
PATCHES = (
    (0x1A5CF8, bytes.fromhex("1fb500f1"), bytes.fromhex("1fb900f1")),
    (0x1A5E14, bytes.fromhex("08050091"), bytes.fromhex("08090091")),
    (0x1A5E20, bytes.fromhex("080500d1"), bytes.fromhex("080900d1")),
)


def patch(path):
    data = bytearray(path.read_bytes())
    digest = hashlib.sha256(data).hexdigest()
    if digest == PATCHED_SHA256:
        return
    if digest != ORIGINAL_SHA256:
        raise ValueError(f"Unexpected libgui.so SHA-256: {digest}")

    # The HIDL 1.0 adapter must skip the second boolean added to the flattened
    # QueueBufferInput before reading the fence and surface damage.
    for offset, old, new in PATCHES:
        if data[offset:offset + len(old)] != old:
            raise ValueError(f"Unexpected instruction at {offset:#x}")
        data[offset:offset + len(old)] = new

    if hashlib.sha256(data).hexdigest() != PATCHED_SHA256:
        raise ValueError("Unexpected patched libgui.so SHA-256")
    path.write_bytes(data)


if __name__ == "__main__":
    if len(sys.argv) != 2:
        raise SystemExit(f"Usage: {sys.argv[0]} <libgui.so>")
    patch(Path(sys.argv[1]))
