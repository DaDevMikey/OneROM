# Set 64-bit Zygote for 64-bit system base with 32-bit legacy HAL shims
SET_PROP "vendor" "ro.zygote" "zygote64"

# Display Density & Scaling
TARGET_MODEL_NAME="${TARGET_ASSERT_MODEL%%:*}"
TARGET_MODEL_NAME="${TARGET_MODEL_NAME:-SM-G973F}"
for part in system vendor product odm; do
    SET_PROP "$part" "ro.sf.lcd_density" "$TARGET_LCD_DENSITY"
    SET_PROP "$part" "ro.sf.init.lcd_density" "$TARGET_LCD_DENSITY"
    SET_PROP "$part" "ro.product.${part}.model" "$TARGET_MODEL_NAME"
    SET_PROP "$part" "ro.product.${part}.name" "${TARGET_CODENAME}xx"
    SET_PROP "$part" "ro.product.${part}.device" "$TARGET_CODENAME"
done
SET_PROP "system" "ro.product.model" "$TARGET_MODEL_NAME"
SET_PROP "system" "ro.product.name" "${TARGET_CODENAME}xx"
SET_PROP "system" "ro.product.device" "$TARGET_CODENAME"
SET_PROP "system" "ro.build.product" "$TARGET_CODENAME"

ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "system" "system/bin/prepare_param.sh"

SOURCE_BUILD_ID="$(GET_PROP "$WORK_DIR/system/system/build.prop" "ro.build.version.incremental")"
[[ -z "$SOURCE_BUILD_ID" ]] && SOURCE_BUILD_ID="S948BXXU6ZZKN"
BUILD_DISPLAY_ID="OneROM Zeta 9.5 ($TARGET_CODENAME) ($SOURCE_BUILD_ID) [UNTESTED] $(date +%Y%m%d)"
SET_PROP "system" "ro.onerom.official" "false"
SET_PROP "system" "ro.onerom.version" "$ROM_VERSION"
SET_PROP "system" "ro.onerom.build" "$BUILD_DISPLAY_ID"
SET_PROP "system" "ro.onerom.codename" "Zeta"
SET_PROP "system" "ro.onerom.device" "$TARGET_CODENAME"
SET_PROP "system" "ro.onerom.build_date" "$(date +%Y-%m-%d)"
SET_PROP "system" "ro.onerom.build.date" "$(date +%Y-%m-%d)"
SET_PROP "system" "ro.onerom.untested" "true"
SET_PROP "system" "ro.onerom.boot_guarantee" "false"
SET_PROP "system" "ro.build.display.id" "$BUILD_DISPLAY_ID"
SET_PROP "product" "ro.build.display.id" "$BUILD_DISPLAY_ID"

for part in system vendor product odm; do
    SET_PROP "$part" "ro.vendor.nfc.info.antpos" "4"
done
SET_PROP "system" "fw.max_users" "4"
SET_PROP "system" "fw.show_multiuserui" "1"

# USB Debugging & ADB Configuration based on build mode
if [[ "${DEBUG:-false}" == "true" ]]; then
    echo "  -> Configuring early ADB and USB debugging for debug build"
    SET_PROP "system" "ro.debuggable" "1"
    SET_PROP "system" "ro.adb.secure" "0"
    SET_PROP "system" "persist.service.adb.enable" "1"
    SET_PROP "system" "persist.service.debuggable" "1"
    SET_PROP "system" "persist.sys.usb.config" "mtp,adb"
    SET_PROP "vendor" "ro.debuggable" "1"
    SET_PROP "product" "ro.debuggable" "1"
    cp -a "$MODPATH/init.s10-debug.rc" "$WORK_DIR/system/system/etc/init/init.s10-debug.rc"
    SET_METADATA "system" "system/etc/init/init.s10-debug.rc" 0 0 644 "u:object_r:system_file:s0"
else
    echo "  -> Configuring release build (USB debugging disabled by default)"
    SET_PROP "system" "ro.debuggable" "0"
    SET_PROP "system" "ro.adb.secure" "1"
    SET_PROP "system" "persist.service.adb.enable" "0"
    SET_PROP "system" "persist.service.debuggable" "0"
    SET_PROP "system" "persist.sys.usb.config" "mtp"
    SET_PROP "vendor" "ro.debuggable" "0"
    SET_PROP "product" "ro.debuggable" "0"
    DELETE_FROM_WORK_DIR "system" "system/etc/init/init.s10-debug.rc"
fi

for keylayout in Generic Generic_internal Vendor_0075_Product_0100 Vendor_04e8; do
    keylayout_path="$WORK_DIR/system/system/usr/keylayout/$keylayout.kl"
    [[ -f "$keylayout_path" ]] || continue
    if grep -qE '^[[:space:]]*key[[:space:]]+703[[:space:]]' "$keylayout_path"; then
        sed -Ei 's/^[[:space:]]*key[[:space:]]+703[[:space:]]+.*/key 703   USER   WAKE/' "$keylayout_path"
    else
        printf '\nkey 703   USER   WAKE\n' >> "$keylayout_path"
    fi
done

if [[ -f "$WORK_DIR/system/system/lib64/libvkmanager.so" ]]; then
    patchelf --set-rpath /system/lib64 "$WORK_DIR/system/system/lib64/libvkmanager.so" || true
fi

IFS=/ read -r legacy_model legacy_region legacy_build <<< "$TARGET_FIRMWARE"
legacy_source="$FW_DIR/${legacy_model}_${legacy_region}"
legacy_output="$(mktemp -d)"
bash "$MODPATH/legacy32/stage-runtime.sh" "$legacy_source/system/system" "$legacy_source/vendor" "$legacy_output" || exit 1
mkdir -p "$legacy_output/vendor/lib" "$legacy_output/vendor/bin/hw"
mv "$legacy_output/lib" "$legacy_output/vendor/lib/s10-runtime32"
mv "$legacy_output/bin/s10-linker32" "$legacy_output/vendor/bin/s10-linker32"
mv "$legacy_output/bin/android.hardware.audio.service" "$legacy_output/vendor/bin/hw/android.hardware.audio.service"
mv "$legacy_output/bin/s10-soundtrigger32" "$legacy_output/vendor/bin/hw/s10-soundtrigger32"
mv "$legacy_output/bin/s10-bluetooth-audio64" "$legacy_output/vendor/bin/hw/s10-bluetooth-audio64"
mv "$legacy_output/bin/android.hardware.media.omx@1.0-service" "$legacy_output/vendor/bin/hw/android.hardware.media.omx@1.0-service"
mv "$legacy_output/bin/vendor.samsung.hardware.camera.provider@4.0-service" "$legacy_output/vendor/bin/hw/vendor.samsung.hardware.camera.provider@4.0-service"
ADD_TO_WORK_DIR "$legacy_output" "vendor" "lib/s10-runtime32" 0 0 755 "u:object_r:vendor_file:s0"
for legacy_library in "$WORK_DIR/vendor/lib/s10-runtime32/"*; do
    SET_METADATA "vendor" "lib/s10-runtime32/${legacy_library##*/}" 0 0 644 "u:object_r:vendor_file:s0"
done
cp "$legacy_source/system/system/lib/libGLESv1_CM.so" "$WORK_DIR/vendor/lib/libGLESv1_CM.so" || exit 1
SET_METADATA "vendor" "lib/libGLESv1_CM.so" 0 0 644 "u:object_r:vendor_file:s0"
ADD_TO_WORK_DIR "$legacy_output" "vendor" "bin/s10-linker32" 0 2000 755 "u:object_r:system_linker_exec:s0"
ADD_TO_WORK_DIR "$legacy_output" "vendor" "bin/hw/android.hardware.audio.service" 0 2000 755 "u:object_r:hal_audio_default_exec:s0"
ADD_TO_WORK_DIR "$legacy_output" "vendor" "bin/hw/s10-soundtrigger32" 0 2000 755 "u:object_r:hal_audio_default_exec:s0"
ADD_TO_WORK_DIR "$legacy_output" "vendor" "bin/hw/s10-bluetooth-audio64" 0 2000 755 "u:object_r:hal_audio_default_exec:s0"
ADD_TO_WORK_DIR "$legacy_output" "vendor" "bin/hw/android.hardware.media.omx@1.0-service" 0 2000 755 "u:object_r:mediacodec_exec:s0"
ADD_TO_WORK_DIR "$legacy_output" "vendor" "bin/hw/vendor.samsung.hardware.camera.provider@4.0-service" 0 2000 755 "u:object_r:hal_camera_default_exec:s0"
ADD_TO_WORK_DIR "$MODPATH" "vendor" "etc/init/android.hardware.media.omx@1.0-service.rc" 0 0 644 "u:object_r:vendor_configs_file:s0"
if [[ -f "$WORK_DIR/vendor/etc/init/android.hardware.audio.service.rc" ]]; then
    if ! grep -q 'setenv LD_LIBRARY_PATH' "$WORK_DIR/vendor/etc/init/android.hardware.audio.service.rc"; then
        sed -i '/service vendor.audio-hal/a\    setenv LD_LIBRARY_PATH /vendor/lib/s10-runtime32:/vendor/lib:/vendor/lib/hw' \
            "$WORK_DIR/vendor/etc/init/android.hardware.audio.service.rc"
    fi
fi
for codec_library in "$WORK_DIR"/vendor/lib/omx/*.so "$WORK_DIR/vendor/lib/libstagefright_softomx_plugin.so" "$WORK_DIR"/vendor/lib/hw/camera.*.so "$WORK_DIR/vendor/lib/hw/gralloc.exynos9820.so" "$WORK_DIR"/vendor/lib/hw/*audio*.so "$WORK_DIR"/vendor/lib/hw/audio.*.so; do
    [[ -f "$codec_library" ]] || continue
    patchelf --set-rpath /vendor/lib/s10-runtime32 "$codec_library" || true
done
rm -rf "$legacy_output"

# S10 Stock Wallpapers
if [[ -f "$MODPATH/wallpaper-res/wallpaper-res.apk" ]]; then
    mkdir -p "$WORK_DIR/system/system/priv-app/wallpaper-res"
    cp -f "$MODPATH/wallpaper-res/wallpaper-res.apk" "$WORK_DIR/system/system/priv-app/wallpaper-res/wallpaper-res.apk"
    SET_METADATA "system" "system/priv-app/wallpaper-res/wallpaper-res.apk" 0 0 644 "u:object_r:system_file:s0"
fi

# Ensure stale donor oat files for BiometricSetting are removed
DELETE_FROM_WORK_DIR "system" "system/priv-app/BiometricSetting/oat"

# Ensure OpenCL and GLES_mali vendor symlinks are valid and relative
for vlib in "$WORK_DIR/vendor/lib" "$WORK_DIR/vendor/lib64"; do
    [[ -d "$vlib" ]] || continue
    for link_name in libGLES_mali.so libOpenCL.so libOpenCL.so.1 libOpenCL.so.1.1; do
        target_path="$vlib/$link_name"
        if [[ -L "$target_path" ]]; then
            link_target="$(readlink "$target_path")"
            if [[ "$link_target" == *"/tmp/"* || ! -e "$target_path" ]]; then
                ln -sf "egl/libGLES_mali.so" "$target_path"
            fi
        fi
    done
done

IFS=/ read -r sdhms_model sdhms_region sdhms_build <<< "$SOURCE_FIRMWARE"
sdhms_output="$(mktemp -d)"
python3 "$MODPATH/sdhms/prepare-policies.py" \
    "$WORK_DIR/system/system/priv-app/SamsungDeviceHealthManagerService/SamsungDeviceHealthManagerService.apk" \
    "$FW_DIR/${sdhms_model}_${sdhms_region}/system/system/etc/floating_feature.xml" \
    "$(GET_FLOATING_FEATURE_CONFIG "SEC_FLOATING_FEATURE_SYSTEM_CONFIG_SIOP_POLICY_FILENAME")" \
    "$SRC_DIR/target/$TARGET_CODENAME/dvfs/siop_model.xml" \
    "$sdhms_output/system/system/etc/s10-sdhms" || true
if [[ -d "$sdhms_output/system/system/etc/s10-sdhms" ]]; then
    ADD_TO_WORK_DIR "$sdhms_output" "system" "system/etc/s10-sdhms" 0 0 755 "u:object_r:system_file:s0"
    for sdhms_policy in "$WORK_DIR/system/system/etc/s10-sdhms/"*; do
        SET_METADATA "system" "system/etc/s10-sdhms/${sdhms_policy##*/}" 0 0 644 "u:object_r:system_file:s0"
    done
fi
rm -rf "$sdhms_output"

# Gralloc2 shim
ADD_TO_WORK_DIR "$MODPATH/gralloc2" "system" "system/lib64/libui.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "$MODPATH/gralloc2" "system" "system/lib64/libui_shim.so" 0 0 644 "u:object_r:system_lib_file:s0"

STAGEFRIGHT_PATH="$WORK_DIR/system/system/lib64/libstagefright.so"
if [[ -f "$STAGEFRIGHT_PATH" ]]; then
    stagefright_off="0x$(nm -D "$STAGEFRIGHT_PATH" 2>/dev/null | grep 'reconfigEncoder4OtherApps' | awk '{print $1}')"
    if [[ "$stagefright_off" != "0x" && -n "$stagefright_off" ]]; then
        python3 -c "import sys; f=open(sys.argv[1], 'r+b'); f.seek(int(sys.argv[2], 16)); f.write(bytes.fromhex('00008052c0035fd6'))" "$STAGEFRIGHT_PATH" "$stagefright_off" 2>/dev/null || true
    fi
fi
SET_PROP "vendor" "service.sf.prime_shader_cache" "0"

if ! grep -qxF '/dev/ion u:object_r:ion_device:s0' "$WORK_DIR/system/system/etc/selinux/plat_file_contexts"; then
    printf '\n/dev/ion u:object_r:ion_device:s0\n' >> "$WORK_DIR/system/system/etc/selinux/plat_file_contexts"
fi

if ! grep -qF 'mount tmpfs tmpfs /metadata' "$WORK_DIR/system/system/etc/init/hw/init.rc"; then
    sed -i '/^on early-init$/a\    mkdir /metadata 0755 root root\n    mount tmpfs tmpfs /metadata mode=0755,uid=0,gid=0\n    restorecon_recursive /metadata' \
        "$WORK_DIR/system/system/etc/init/hw/init.rc"
fi

if ! grep -qxF 'import /vendor/ueventd.rc' "$WORK_DIR/system/system/etc/ueventd.rc"; then
	printf '\nimport /vendor/ueventd.rc\n' >> "$WORK_DIR/system/system/etc/ueventd.rc"
fi

DELETE_FROM_WORK_DIR "system" "system/bin/fabric_crypto"
DELETE_FROM_WORK_DIR "system" "system/etc/init/fabric_crypto.rc"
DELETE_FROM_WORK_DIR "system" "system/etc/vintf/manifest/fabric_crypto_manifest.xml"
DELETE_FROM_WORK_DIR "system" "system/lib64/vendor.samsung.hardware.security.fkeymaster-V1-cpp.so"
DELETE_FROM_WORK_DIR "system" "system/lib64/vendor.samsung.hardware.security.fkeymaster-V1-ndk.so"

# Purge Qualcomm Snapdragon 8 Gen 5 ODM blobs on Exynos 9820 to fit in 4 MB ODM partition
if [[ -d "$WORK_DIR/odm/lib64" ]]; then
    DELETE_FROM_WORK_DIR "odm" "lib64"
fi

# Ensure product fits in 1500 MB physical product partition
for bloat in "app/Chrome" "app/Chrome64" "app/SpeechRecognitionAndSynthesisFromGoogle"; do
    if [[ -d "$WORK_DIR/product/$bloat" ]]; then
        DELETE_FROM_WORK_DIR "product" "$bloat"
    fi
done

sed -i '/^[[:space:]]*wait_for_prop bpf\.progs_loaded 1[[:space:]]*$/d' \
    "$WORK_DIR/system/system/etc/init/netbpfload.rc"

# Tethering netbpfload refuses the 5.4-reporting kernel (25Q4 needs 5.10); run a gate-patched copy from /system
NBL_TMP="$(mktemp -d)"
unzip -p "$WORK_DIR/system/system/apex/com.google.android.tethering_compressed.apex" original_apex > "$NBL_TMP/original.apex" || exit 1
unzip -p "$NBL_TMP/original.apex" apex_payload.img > "$NBL_TMP/payload.img" || exit 1
7z e -y "$NBL_TMP/payload.img" bin/netbpfload -o"$NBL_TMP" > /dev/null || exit 1
python3 - "$NBL_TMP/netbpfload" "$WORK_DIR/system/system/bin/netbpfload_s10" <<'EOF' || exit 1
import struct, sys
data = bytearray(open(sys.argv[1], "rb").read())
def words(*w): return struct.pack("<%dI" % len(w), *w)
patches = [
    # 25Q4 requires 5.10 / kernel gate jump at 0x9280: cmp w11, #0x140 -> b 0x9334
    (words(0x7105017f, 0x54000168), words(0x1400002d, 0x54000168)),
    # BPF objects stay in the APEX; drop the object-vs-executable same-device check at 0xaf48: b.ne -> nop
    (words(0xeb05009f, 0x54006fa1), words(0xeb05009f, 0xd503201f)),
]
for old, new in patches:
    if data.count(old) != 1:
        sys.exit("netbpfload gate not found exactly once: " + old.hex())
    i = data.find(old)
    data[i:i + len(old)] = new
open(sys.argv[2], "wb").write(data)
EOF

# Tethering libservice-connectivity aborts on missing BPF ringbuf on 4.14; run a patched lib64 overlay from /system
mkdir -p "$NBL_TMP/system/framework/s10-connectivity-lib64"
7z e -y "$NBL_TMP/payload.img" lib64/* -o"$NBL_TMP/system/framework/s10-connectivity-lib64" > /dev/null || exit 1
python3 - "$NBL_TMP/system/framework/s10-connectivity-lib64/libservice-connectivity.so" <<'LIB_PATCH_EOF' || exit 1
import struct, sys
path = sys.argv[1]
data = bytearray(open(path, "rb").read())
def words(*w): return struct.pack("<%dI" % len(w), *w)

NOP = 0xd503201f
MOV_W0_WZR = 0x2a1f03e0
MOV_X0_XZR = 0xaa1f03e0
RET = 0xd65f03c0
MOV_W1_800 = 0x52810001
MOVK_W1_8 = 0x72a00101

# Calculate BL to eventfd@plt (0x14f80) from 0xdf14
bl_eventfd = 0x94000000 | (((0x14f80 - 0xdf14) // 4) & 0x3ffffff)

patches = [
    # Site 1: df08..df18 -> call eventfd(0, 0x80800) instead of GetRingbuf()
    (words(0x94001b8a, 0xb9401800, 0x528080c1, 0x2a1f03e2, 0x94001b8a),
     words(MOV_W0_WZR, MOV_W1_800, MOVK_W1_8, bl_eventfd, NOP)),
    # Site 2: f340 (cbnz w8, f37c) -> nop
    (words(0x350001e8), words(NOP)),
    # Site 3: f3ac (bl abort) -> nop
    (words(0x94001555), words(NOP)),
    # Site 4: e2a0 (bl ConsumeAllEv) -> nop
    (words(0x94001ac0), words(NOP)),
    # Site 5: 11dbc (LoopbackEventHandler::GetPoller) -> mov x0, xzr; ret
    (words(0xd503233f, 0xa9bf7bfd, 0x910003fd, 0xd503201f, 0x10052da8),
     words(MOV_X0_XZR, RET, NOP, NOP, NOP)),
    # Site 6: 12018..12020 (LoopbackEventHandler bl abort) -> nop
    (words(0x528000c0, 0x94000abd, 0x94000a38),
     words(0x528000c0, 0x94000abd, NOP)),
    # Site 7: 12028 (LoopbackEventHandler::Start) -> mov w0, wzr; ret
    (words(0xd503233f, 0xd10143ff, 0xa9027bfd, 0xf9001bf5, 0xa9044ff4, 0x910083fd, 0xd53bd055, 0xd0000053),
     words(MOV_W0_WZR, RET, NOP, NOP, NOP, NOP, NOP, NOP)),
    # Site 8: 122ac (LoopbackEventHandler::Stop) -> mov w0, wzr; ret
    (words(0xd503233f, 0xa9bf7bfd, 0x910003fd, 0xd503201f, 0x10050628),
     words(MOV_W0_WZR, RET, NOP, NOP, NOP)),
]
for old, new in patches:
    if data.count(old) != 1:
        sys.exit("libservice-connectivity patch site not found: " + old.hex())
    i = data.find(old)
    data[i:i + len(old)] = new
open(path, "wb").write(data)
LIB_PATCH_EOF
ADD_TO_WORK_DIR "$NBL_TMP" "system" "system/framework/s10-connectivity-lib64" 0 0 755 "u:object_r:system_file:s0"
for lib_file in "$WORK_DIR/system/system/framework/s10-connectivity-lib64/"*; do
    SET_METADATA "system" "system/framework/s10-connectivity-lib64/${lib_file##*/}" 0 0 644 "u:object_r:system_file:s0"
done

# Provide libcom.android.tethering.connectivity_native.so in /system/lib64 for native clients (e.g. gpsd)
cp -f "$NBL_TMP/system/framework/s10-connectivity-lib64/libcom.android.tethering.connectivity_native.so" "$WORK_DIR/system/system/lib64/libcom.android.tethering.connectivity_native.so"
SET_METADATA "system" "system/lib64/libcom.android.tethering.connectivity_native.so" 0 0 644 "u:object_r:system_lib_file:s0"

mkdir -p "$WORK_DIR/system/system/etc/init"
cat > "$WORK_DIR/system/system/etc/init/init.s10-connectivity-overlay.rc" <<'RC_EOF'
on post-fs-data
    mount none /system/framework/s10-connectivity-lib64 /apex/com.android.tethering/lib64 bind ro
    mount none /system/framework/s10-connectivity-lib64/libservice-connectivity.so /apex/com.android.tethering/lib64/libservice-connectivity.so bind ro

on property:apexd.status=activated
    mount none /system/framework/s10-connectivity-lib64 /apex/com.android.tethering/lib64 bind ro
    mount none /system/framework/s10-connectivity-lib64/libservice-connectivity.so /apex/com.android.tethering/lib64/libservice-connectivity.so bind ro
RC_EOF
SET_METADATA "system" "system/etc/init/init.s10-connectivity-overlay.rc" 0 0 644 "u:object_r:system_file:s0"

rm -rf "$NBL_TMP"
SET_METADATA "system" "system/bin/netbpfload_s10" 0 2000 750 "u:object_r:bpfloader_exec:s0"

if ! grep -q '^service bpfloader_s10 ' "$WORK_DIR/system/system/etc/init/netbpfload.rc"; then
    sed -i 's/^\([[:space:]]*\)exec_start bpfloader$/\1exec_start bpfloader_s10\n\1setprop bpf.progs_loaded 1/' "$WORK_DIR/system/system/etc/init/netbpfload.rc"
    cat >> "$WORK_DIR/system/system/etc/init/netbpfload.rc" <<'EOF'

service bpfloader_s10 /system/bin/netbpfload_s10
    disabled
    capabilities CHOWN SYS_ADMIN NET_ADMIN SYSLOG
    group root graphics network_stack net_admin net_bw_acct net_bw_stats net_raw system
    user root
    file /dev/kmsg w
    rlimit memlock 1073741824 1073741824
    oneshot
EOF
fi

# 4.14 lacks Android 17 netd BPF support; skip libnetd_updatable_init and tolerate BandwidthController failure
python3 - "$WORK_DIR/system/system/bin/netd" <<'EOF' || exit 1
import struct, sys
path = sys.argv[1]
data = bytearray(open(path, "rb").read())
def words(*w): return struct.pack("<%dI" % len(w), *w)
NOP = 0xd503201f
MOV_W0_WZR = 0x2a1f03e0
RET = 0xd65f03c0
patches = [
    # Site 1: main bl libnetd_updatable_init -> mov w0, wzr
    (words(0x9a931520, 0x9401d886, 0x35000320),
     words(0x9a931520, MOV_W0_WZR, 0x35000320)),
    # Site 2: oneshot main tail call -> return 0
    (words(0xb0fffbc0, 0x912d7800, 0x910e03ff, 0xa9434ff4, 0xf9400bfc, 0xa94257f6, 0xa8c47bfd, 0xd50323bf, 0x1401d8b0),
     words(MOV_W0_WZR, NOP, 0x910e03ff, 0xa9434ff4, 0xf9400bfc, 0xa94257f6, 0xa8c47bfd, 0xd50323bf, RET)),
    # Site 3: Controllers::init BandwidthController check -> nop
    (words(0x97ffc585, 0x350040a0, 0x940172fb),
     words(0x97ffc585, NOP, 0x940172fb)),
]
for old, new in patches:
    if data.count(new) == 1 and data.count(old) == 0:
        continue
    if data.count(old) != 1:
        sys.exit("netd patch site not found exactly once: " + old.hex())
    i = data.find(old)
    data[i:i + len(old)] = new
open(path, "wb").write(data)
EOF

# CameraService addListenerHelper fails with -ENOSYS on legacy binder linkToDeath; bypass abort in cameraserver
if [[ -f "$WORK_DIR/system/system/bin/cameraserver" ]]; then
    python3 - "$WORK_DIR/system/system/bin/cameraserver" <<'CAM_EOF' || exit 1
import struct, sys
path = sys.argv[1]
data = bytearray(open(path, "rb").read())
def words(*w): return struct.pack("<%dI" % len(w), *w)

pat1 = (words(0x2a0003fc, 0x340013c0), words(0x2a1f03fc, 0x1400009e))
pat2 = (words(0xd63f0100, 0xf9400bf5, 0x2a0003f4, 0xb4000255),
        words(0xd63f0100, 0xf9400bf5, 0x2a1f03f4, 0xb4000255))

for old, new in [pat1, pat2]:
    if data.count(new) == 1 and data.count(old) == 0:
        continue
    if data.count(old) != 1:
        sys.exit("cameraserver patch site not found exactly once: " + old.hex())
    i = data.find(old)
    data[i:i + len(old)] = new
open(path, "wb").write(data)
CAM_EOF
fi

# Exynos RIL and TEEGRIS rc replacements for Snapdragon base
if [[ -f "$MODPATH/init.rilchip.slsi.rc" ]]; then
    DELETE_FROM_WORK_DIR "system" "system/etc/init/init.rilchip.qcom.rc"
    cp -f "$MODPATH/init.rilchip.slsi.rc" "$WORK_DIR/system/system/etc/init/init.rilchip.slsi.rc"
    SET_METADATA "system" "system/etc/init/init.rilchip.slsi.rc" 0 0 644 "u:object_r:system_file:s0"
fi

if [[ -f "$MODPATH/insthk_teegris.rc" ]]; then
    DELETE_FROM_WORK_DIR "system" "system/etc/init/insthk_qsee.rc"
    cp -f "$MODPATH/insthk_teegris.rc" "$WORK_DIR/system/system/etc/init/insthk_teegris.rc"
    SET_METADATA "system" "system/etc/init/insthk_teegris.rc" 0 0 644 "u:object_r:system_file:s0"
fi
