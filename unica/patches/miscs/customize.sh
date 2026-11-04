MODEL=$(echo -n "$TARGET_FIRMWARE" | cut -d "/" -f 1)
REGION=$(echo -n "$TARGET_FIRMWARE" | cut -d "/" -f 2)

# Set build ID & OneROM branding
SET_PROP "system" "ro.build.display.id" "OneROM Delta 9.0 ($TARGET_CODENAME)"
SET_PROP "system" "ro.onerom.version" "9.0.0.1"
SET_PROP "system" "ro.onerom.codename" "Delta"
SET_PROP "system" "ro.onerom.device" "$TARGET_CODENAME"
SET_PROP "system" "ro.onerom.build_date" "$(date +%Y-%m-%d)"
SET_PROP "system" "ro.onerom.build.date" "$(date +%Y-%m-%d)"
SET_PROP "system" "ro.build.version.oneui" "90000"
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
    raise SystemExit("reboot_on_failure token was not found in init")

with open(path, "wb") as target:
    target.write(data)
PY

# Set Edge Lighting model
MODEL=$(echo "$TARGET_FIRMWARE" | sed -E 's/^([^/]+)\/.*/\1/')
SET_PROP "system" "ro.factory.model" "$MODEL"

# Fix portrait mode
SET_PROP "system" "ro.build.flavor" "$(GET_PROP "$FW_DIR/${MODEL}_${REGION}/system/system/build.prop" "ro.build.flavor")"

if [[ -f "$FW_DIR/${MODEL}_${REGION}/vendor/lib64/liblivefocus_capture_engine.so" ]]; then
    if grep -q "ro.product.name" "$FW_DIR/${MODEL}_${REGION}/vendor/lib64/liblivefocus_capture_engine.so"; then
        # For devices with this lib in system instead of vendor (e.g. S22 and up)
        # we will need to sed this in system lib after replacing with stock blob
        # in a platform patch.
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
