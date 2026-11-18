MODEL=$(echo -n "$TARGET_FIRMWARE" | cut -d "/" -f 1)
REGION=$(echo -n "$TARGET_FIRMWARE" | cut -d "/" -f 2)

# Set build ID & OneROM Zeta 9.5 branding with explicit untested marks
SET_PROP "system" "ro.build.display.id" "OneROM Zeta 9.5 ($TARGET_CODENAME) [UNTESTED - REQUIRES MORE PATCHES TO BOOT]"
SET_PROP "system" "ro.onerom.version" "$ROM_VERSION"
SET_PROP "system" "ro.onerom.channel" "testing"
SET_PROP "system" "ro.onerom.version.status" "testing"
SET_PROP "system" "ro.onerom.codename" "Zeta"
SET_PROP "system" "ro.onerom.device" "$TARGET_CODENAME"
SET_PROP "system" "ro.onerom.build_date" "$(date +%Y-%m-%d)"
SET_PROP "system" "ro.onerom.build.date" "$(date +%Y-%m-%d)"
SET_PROP "system" "ro.onerom.untested" "true"
SET_PROP "system" "ro.onerom.boot_guarantee" "false"
SET_PROP "system" "ro.onerom.warning" "THIS EXPERIMENTAL BUILD IS NOT TESTED ON HARDWARE, DOES NOT GUARANTEE BOOT, AND REQUIRES MORE PATCHES TO BOOT"
SET_PROP "system" "ro.build.version.oneui" "90500"
SET_PROP "system" "fw.max_users" "4"
SET_PROP "system" "fw.show_multiuserui" "1"

# Disable FRP
SET_PROP "vendor" "ro.frp.pst" ""
SET_PROP "product" "ro.frp.pst" ""

python3 - "$WORK_DIR/system/system/bin/netd" <<'PY'
import sys

path = sys.argv[1]
nop = bytes.fromhex("1f2003d5")
patches = {
    0x9e7c0: bytes.fromhex("e00313aa"),
    0x9e7e0: bytes.fromhex("280000b9"),
    0x9ec98: bytes.fromhex("6182813c"),
    0x9ed30: bytes.fromhex("b4450194"),
    0xb716c: bytes.fromhex("fd7b41a9"),
    0xb7194: bytes.fromhex("37062310"),
    0xb71d8: bytes.fromhex("85060e33"),
    0x9ec3c: bytes.fromhex("fd7b03a9"),
}

with open(path, "rb") as source:
    data = bytearray(source.read())

unexpected = {
    offset: bytes(data[offset:offset + 4])
    for offset, expected in patches.items()
    if bytes(data[offset:offset + 4]) not in (expected, nop)
}

if unexpected:
    details = ", ".join(f"0x{offset:x}={actual.hex()}" for offset, actual in unexpected.items())
    print(f"Skipping legacy netd BPF patch for this donor: {details}")
else:
    for offset in patches:
        data[offset:offset + 4] = nop

    with open(path, "wb") as target:
        target.write(data)

PY

python3 - "$WORK_DIR/system/system/bin/init" <<'PY'
import sys

path = sys.argv[1]
with open(path, "rb") as source:
    data = source.read()

if b"reboot_on_failure" in data:
    data = data.replace(b"reboot_on_failure", b"xeboot_on_failure")
elif b"xeboot_on_failure" not in data:
    print("Warning: reboot_on_failure token was not found in init")

with open(path, "wb") as target:
    target.write(data)
PY

if [[ -f "$WORK_DIR/system/system/lib64/libprocessgroup_setup.so" ]]; then
    python3 - "$WORK_DIR/system/system/lib64/libprocessgroup_setup.so" <<'PY'
import sys

path = sys.argv[1]
with open(path, "rb") as source:
    data = bytearray(source.read())

# Kernel 4.14 lacks cgroup2 memory_recursiveprot mount option (introduced in Linux 5.7+).
# Replace:
#   adrp x4, 1000
#   add  x4, x4, #0xd9e  (pointer to "memory_recursiveprot")
# with:
#   mov  x4, xzr
#   nop                  (pass NULL data pointer to mount())
target = bytes.fromhex("e4ffffb084783691")
replacement = bytes.fromhex("e4031faa1f2003d5")

if target in data:
    data = data.replace(target, replacement)
    with open(path, "wb") as target_file:
        target_file.write(data)
    print("Patched libprocessgroup_setup.so for legacy kernel cgroup2 support")
elif replacement in data:
    print("libprocessgroup_setup.so already patched")
else:
    print("Warning: target instruction sequence not found in libprocessgroup_setup.so")
PY
fi

# Set Edge Lighting model
MODEL=$(echo "$TARGET_FIRMWARE" | sed -E 's/^([^/]+)\/.*/\1/')
SET_PROP "system" "ro.factory.model" "$MODEL"

# Fix portrait mode
SET_PROP "system" "ro.build.flavor" "$(GET_PROP "$FW_DIR/${MODEL}_${REGION}/system/system/build.prop" "ro.build.flavor")"

if [[ -f "$FW_DIR/${MODEL}_${REGION}/vendor/lib64/liblivefocus_capture_engine.so" ]]; then
    if grep -q "ro.product.name" "$FW_DIR/${MODEL}_${REGION}/vendor/lib64/liblivefocus_capture_engine.so"; then
        if [[ -f "$FW_DIR/${MODEL}_${REGION}/vendor/lib64/libDualCamBokehCapture.camera.samsung.so" ]]; then
            sed -i "s/ro.product.name/ro.unica.camera/g" "$WORK_DIR/vendor/lib/libDualCamBokehCapture.camera.samsung.so"
            sed -i "s/ro.product.name/ro.unica.camera/g" "$WORK_DIR/vendor/lib64/libDualCamBokehCapture.camera.samsung.so"
        fi
        sed -i "s/ro.product.name/ro.unica.camera/g" "$WORK_DIR/vendor/lib/liblivefocus_capture_engine.so"
        sed -i "s/ro.product.name/ro.unica.camera/g" "$WORK_DIR/vendor/lib/liblivefocus_preview_engine.so"
        sed -i "s/ro.product.name/ro.unica.camera/g" "$WORK_DIR/vendor/lib64/liblivefocus_capture_engine.so"
        sed -i "s/ro.product.name/ro.unica.camera/g" "$WORK_DIR/vendor/lib64/liblivefocus_preview_engine.so"
        echo -e "\nro.unica.camera u:object_r:build_prop:s0 exact string" >> "$WORK_DIR/system/system/etc/selinux/plat_property_contexts"
        SET_PROP "system" "ro.unica.camera" "$(GET_PROP "$FW_DIR/${MODEL}_${REGION}/system/system/build.prop" "ro.product.system.name")"
    fi
fi

if ! grep -q '^ro\.telephony\.sim_slots\.count[[:space:]]' "$WORK_DIR/system/system/etc/selinux/plat_property_contexts"; then
    echo "ro.telephony.sim_slots.count      u:object_r:telephony_config_prop:s0 exact int" >> "$WORK_DIR/system/system/etc/selinux/plat_property_contexts"
fi

{
    echo ""
    echo ""
    echo "on property:ro.vendor.multisim.simslotcount=*"
    echo "    setprop ro.telephony.sim_slots.count \${ro.vendor.multisim.simslotcount}"
    echo ""
} >> "$WORK_DIR/vendor/etc/init/init.vendor.rilcommon.rc"

sed -i '/init\.svc\.vendor\.wvkprov_server_hal/d' "$WORK_DIR/vendor/etc/selinux/vendor_property_contexts"
