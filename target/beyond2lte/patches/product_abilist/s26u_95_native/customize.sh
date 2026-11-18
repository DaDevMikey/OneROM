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
