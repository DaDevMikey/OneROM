LOG "- Disabling encryption"
LINE=$(sed -n "/^\/dev\/block\/by-name\/userdata/=" "$WORK_DIR/vendor/etc/fstab.exynos9820")
sed -i "${LINE}s/,fileencryption=ice//g" "$WORK_DIR/vendor/etc/fstab.exynos9820"

# ODE
sed -i -e "/ODE/d" -e "/keydata/d" -e "/keyrefuge/d" "$WORK_DIR/vendor/etc/fstab.exynos9820"

LOG_STEP_IN "- Enabling updateable APEX images"
SET_PROP "vendor" "ro.apex.updatable" "true"
LOG_STEP_OUT

LOG_STEP_IN "- Enabling IncrementalFS"
SET_PROP "vendor" "ro.incremental.enable" "yes"
LOG_STEP_OUT

LOG_STEP_IN "- Enabling FS Verity"
SET_PROP "vendor" "ro.apk_verity.mode" "2"
LOG_STEP_OUT

LOG_STEP_IN "- Setting /data to F2FS"
FROM="noatime,nosuid,nodev,noauto_da_alloc,discard,journal_checksum,data=ordered,errors=panic"
TO="noatime,nosuid,nodev,discard,usrquota,grpquota,fsync_mode=nobarrier,reserve_root=32768,resgid=5678"
sed -i -e "${LINE}s/ext4/f2fs/g" -e "${LINE}s/$FROM/$TO/g" "$WORK_DIR/vendor/etc/fstab.exynos9820"
LOG_STEP_OUT

LOG_STEP_IN "- Disabling A2DP Offload"
SET_PROP "system" "persist.bluetooth.a2dp_offload.disabled" "true"
SET_PROP "system" "ro.bluetooth.a2dp_offload.supported" "false"
SET_PROP "product" "persist.bluetooth.a2dp_offload.disabled" "true"
SET_PROP "product" "ro.bluetooth.a2dp_offload.supported" "false"
SET_PROP "product" "persist.bluetooth.samsung.a2dp_offload.cap" "none"
LOG_STEP_OUT

LOG_STEP_IN "- Patching Bluetooth APEX for Exynos 9820 software A2DP"
if [ -f "$WORK_DIR/system/system/apex/com.android.bt.apex" ]; then
    python3 "$SRC_DIR/scripts/patch_bluetooth_apex.py" "$WORK_DIR/system/system/apex/com.android.bt.apex"
elif [ -f "$WORK_DIR/system/apex/com.android.bt.apex" ]; then
    python3 "$SRC_DIR/scripts/patch_bluetooth_apex.py" "$WORK_DIR/system/apex/com.android.bt.apex"
fi
LOG_STEP_OUT

LOG_STEP_IN "- Setting SF flags and UI performance optimizations"
SET_PROP "vendor" "debug.sf.latch_unsignaled" "1"
SET_PROP "vendor" "debug.sf.enable_gl_backpressure" "0"
SET_PROP "vendor" "debug.sf.disable_backpressure" "1"
SET_PROP "vendor" "renderthread.skia.reduceopstasksplitting" "true"
SET_PROP "vendor" "debug.hwui.render_dirty_regions" "false"
SET_PROP "vendor" "debug.hwui.skia_tracing_enabled" "false"
SET_PROP "vendor" "debug.hwui.skia_use_perfetto_track_events" "false"
SET_PROP "vendor" "debug.sf.high_fps_late_app_phase_offset_ns" "0"
SET_PROP "vendor" "debug.sf.high_fps_late_sf_phase_offset_ns" "0"
SET_PROP "system" "persist.sys.scrollingcache" "3"
SET_PROP "system" "windowsmgr.max_events_per_sec" "240"
SET_PROP "system" "dalvik.vm.dex2oat-threads" "8"
SET_PROP "system" "dalvik.vm.boot-dex2oat-threads" "8"
SET_PROP "system" "dalvik.vm.image-dex2oat-threads" "8"
LOG_STEP_OUT

LOG_STEP_IN "- Disabling HFR"
SET_PROP "vendor" "debug.sf.show_refresh_rate_overlay_render_rate" "true"
SET_PROP "vendor" "ro.surface_flinger.game_default_frame_rate_override" "60"
SET_PROP "vendor" "ro.surface_flinger.enable_frame_rate_override" "false"
SET_PROP "vendor" "ro.surface_flinger.use_content_detection_for_refresh_rate" "false"
LOG_STEP_OUT

LOG_STEP_IN "- Enabling Vulkan"
SET_PROP "vendor" "ro.hwui.use_vulkan" "true"
SET_PROP "vendor" "debug.hwui.use_hint_manager" "true"
LOG_STEP_OUT

# For some reason we are missing 2 permissions here: android.hardware.security.model.compatible and android.software.controls
# First one is related to encryption and second one to SmartThings Device Control
LOG "- Patching vendor permissions"
sed -i '$d' "$WORK_DIR/vendor/etc/permissions/handheld_core_hardware.xml"
{
    echo ""
    echo "    <!-- Indicate support for the Android security model per the CDD. -->"
    echo "    <feature name=\"android.hardware.security.model.compatible\"/>"
    echo ""
    echo "    <!--  Feature to specify if the device supports controls.  -->"
    echo "    <feature name=\"android.software.controls\"/>"
    echo "</permissions>"
} >> "$WORK_DIR/vendor/etc/permissions/handheld_core_hardware.xml"

LOG_STEP_IN "- Setting stock Bluetooth profiles" # from M625F 13
SET_PROP "product" "bluetooth.profile.asha.central.enabled" "true"
SET_PROP "product" "bluetooth.profile.a2dp.source.enabled" "true"
SET_PROP "product" "bluetooth.profile.avrcp.target.enabled" "true"
SET_PROP "product" "bluetooth.profile.bap.broadcast.assist.enabled" "false"
SET_PROP "product" "bluetooth.profile.bap.broadcast.source.enabled" "false"
SET_PROP "product" "bluetooth.profile.bap.unicast.client.enabled" "false"
SET_PROP "product" "bluetooth.profile.bas.client.enabled" "false"
SET_PROP "product" "bluetooth.profile.csip.set_coordinator.enabled" "false"
SET_PROP "product" "bluetooth.profile.gatt.enabled" "true"
SET_PROP "product" "bluetooth.profile.hap.client.enabled" "false"
SET_PROP "product" "bluetooth.profile.hfp.ag.enabled" "true"
SET_PROP "product" "bluetooth.profile.hid.device.enabled" "true"
SET_PROP "product" "bluetooth.profile.hid.host.enabled" "true"
SET_PROP "product" "bluetooth.profile.map.server.enabled" "true"
SET_PROP "product" "bluetooth.profile.mcp.server.enabled" "false"
SET_PROP "product" "bluetooth.profile.opp.enabled" "false"
SET_PROP "product" "bluetooth.profile.pan.nap.enabled" "true"
SET_PROP "product" "bluetooth.profile.pan.panu.enabled" "true"
SET_PROP "product" "bluetooth.profile.pbap.server.enabled" "true"
SET_PROP "product" "bluetooth.profile.sap.server.enabled" "true"
SET_PROP "product" "bluetooth.profile.ccp.server.enabled" "false"
SET_PROP "product" "bluetooth.profile.vcp.controller.enabled" "false"

if [[ "$SOURCE_API_LEVEL" -lt 37 ]]; then
    ADD_TO_WORK_DIR "b0sxxx" "system" "system/apex/com.android.bt.apex" 0 0 644 "u:object_r:system_file:s0"
fi
LOG_STEP_OUT

# BT-lib-patch
if [[ "$SOURCE_API_LEVEL" -lt 37 ]]; then
    if [ ! -f "$WORK_DIR/system/system/lib64/libbluetooth_jni.so" ]; then
        LOG_STEP_IN "- Extracting libbluetooth_jni.so from com.android.bt.apex"

        [ -d "$TMP_DIR" ] && EVAL "rm -rf \"$TMP_DIR\""
        mkdir -p "$TMP_DIR"

        EVAL "unzip -j \"$WORK_DIR/system/system/apex/com.android.bt.apex\" \"apex_payload.img\" -d \"$TMP_DIR\""

        if 7z e "$TMP_DIR/apex_payload.img" lib64/libbluetooth_jni.so -o"$WORK_DIR/system/system/lib64" -y &> /dev/null; then
            LOG "- Extracted libbluetooth_jni.so using 7z"
        elif debugfs -R "dump lib64/libbluetooth_jni.so $WORK_DIR/system/system/lib64/libbluetooth_jni.so" "$TMP_DIR/apex_payload.img" &> /dev/null; then
            LOG "- Extracted libbluetooth_jni.so using debugfs"
        else
            ABORT "Failed to extract libbluetooth_jni.so from apex_payload.img"
        fi

        rm -rf "$TMP_DIR"

        SET_METADATA "system" "system/lib64/libbluetooth_jni.so" 0 0 644 "u:object_r:system_lib_file:s0"

        LOG_STEP_OUT
    fi

    # https://github.com/duhansysl/Bluetooth-Library-Patcher/blob/67e598ad142ed296b487a7a4585927c993d4f35d/hexpatcher.sh#L43
    HEX_PATCH "$WORK_DIR/system/system/lib64/libbluetooth_jni.so" \
        "289765394805003736008052" "289765392a00001436008052"
fi

# Disable sead (Environment Adaptive Display) to avoid crash loop (~10/s) due to missing panel RGB calibration on Exynos 9820
LOG_STEP_IN "- Disabling sead (EAD crash loop)"
CREW_SM=""
if [ -d "$APKTOOL_DIR" ]; then
    CREW_SM="$(grep -rl 'package="com.samsung.android.sead"' "$APKTOOL_DIR" --include=AndroidManifest.xml 2> /dev/null | head -n 1 || true)"
fi
if [ -z "$CREW_SM" ] && type DECODE_APK > /dev/null 2>&1; then
    CREW_SA="$(find "$WORK_DIR/system/system/priv-app" "$WORK_DIR/system/system/app" -name '*.apk' 2> /dev/null | while read -r a; do
        if unzip -p "$a" AndroidManifest.xml 2> /dev/null | grep -a -q 'com.samsung.android.sead'; then
            echo "$a"
            break
        fi
    done || true)"
    if [ -n "$CREW_SA" ]; then
        DECODE_APK "system" "${CREW_SA#"$WORK_DIR"/system/}" || true
        CREW_SM="$(grep -rl 'package="com.samsung.android.sead"' "$APKTOOL_DIR" --include=AndroidManifest.xml 2> /dev/null | head -n 1 || true)"
    fi
fi
if [ -n "$CREW_SM" ]; then
    python3 -I - "$CREW_SM" <<'PYEOF' || LOGW "sead manifest edit failed"
import re, sys
f = sys.argv[1]; s = open(f).read()
m = re.search(r'<application\b[^>]*>', s)
if not m: sys.exit("no <application>")
tag = m.group(0); new = tag
new = re.sub(r'android:persistent="true"', 'android:persistent="false"', new)
if 'android:enabled=' in new: new = re.sub(r'android:enabled="[^"]*"', 'android:enabled="false"', new)
else: new = new.replace('<application', '<application android:enabled="false"', 1)
s = s.replace(tag, new, 1); open(f, 'w').write(s)
print("  sead: application enabled=false, persistent=false")
PYEOF
else
    LOG "sead package not present in ROM - skipping"
fi
unset CREW_SM CREW_SA
LOG_STEP_OUT

# Fix GPIS cpuset pin for SurfaceFlinger (keep on 0-7 instead of 4-7 during blur to avoid stutter)
if [ -f "$WORK_DIR/system/system/etc/task_profiles.json" ]; then
python3 - "$WORK_DIR/system/system/etc/task_profiles.json" <<'GPIS_EOF'
import json, sys
p = sys.argv[1]
try:
    d = json.load(open(p))
    n = 0
    for pr in d.get("Profiles", []):
        if pr.get("Name") == "GpisSfCpusetEnable":
            for a in pr.get("Actions", []):
                if a.get("Params", {}).get("Name") == "GpisSfCpuset":
                    a["Params"]["Value"] = "0-7"
                    n += 1
    json.dump(d, open(p, "w"), indent=2)
    print("  GpisSfCpusetEnable -> 0-7:", n)
except Exception as e:
    print("  Failed to patch task_profiles.json:", e)
GPIS_EOF
fi

# HWC virtual display for smoother screen recording + /dev/jsqz permissions for camera JPEG squeezer
LOG_STEP_IN "- Enabling HWC virtual display and /dev/jsqz access"
SET_PROP "vendor" "debug.sf.enable_hwc_vds" "1"
if [ -f "$WORK_DIR/vendor/ueventd.rc" ]; then
    grep -q '^/dev/jsqz' "$WORK_DIR/vendor/ueventd.rc" || \
        echo "/dev/jsqz                 0660   mediacodec     camera" >> "$WORK_DIR/vendor/ueventd.rc"
fi
LOG_STEP_OUT

# Anti-thrash LMKD tuning for 8 GB RAM and dex2oat cpu-set pinning
LOG_STEP_IN "- Applying LMKD anti-thrash and background dex2oat pinning"
SET_PROP "product" "ro.lmk.use_psi" "true"
SET_PROP "product" "ro.lmk.thrashing_limit" "30"
SET_PROP "product" "ro.lmk.thrashing_limit_decay" "50"
SET_PROP "product" "ro.lmk.swap_free_low_percentage" "15"
SET_PROP "product" "ro.lmk.psi_partial_stall_ms" "70"
SET_PROP "product" "ro.lmk.psi_complete_stall_ms" "500"
SET_PROP "system" "persist.sys.fflag.override.settings_enable_monitor_phantom_procs" "false"
SET_PROP "system" "dalvik.vm.background-dex2oat-threads" "2"
SET_PROP "system" "dalvik.vm.background-dex2oat-cpu-set" "0,1,2,3"
SET_PROP "system" "dalvik.vm.dex2oat-cpu-set" "0,1,2,3,4,5,6,7"
SET_PROP "product" "pm.dexopt.first-boot" "speed-profile"
SET_PROP "product" "pm.dexopt.boot-after-ota" "speed-profile"
SET_PROP "product" "pm.dexopt.boot-after-mainline-update" "speed-profile"
LOG_STEP_OUT

# Performance optimizations for Exynos 9820 (compiler, storage I/O, zygote usap, freezer)
LOG_STEP_IN "- Exynos 9820 CPU compiler tuning & smoothness optimizations"
SET_PROP "system" "dalvik.vm.dex2oat64.enabled" "true"
SET_PROP "system" "dalvik.vm.systemuicompilerfilter" "speed"
SET_PROP "system" "dalvik.vm.systemservercompilerfilter" "speed"
SET_PROP "system" "dalvik.vm.dex2oat-threads" "6"
SET_PROP "system" "dalvik.vm.boot-dex2oat-threads" "8"
SET_PROP "system" "dalvik.vm.image-dex2oat-threads" "8"
SET_PROP "system" "persist.device_config.runtime_native.usap_pool_enabled" "true"
SET_PROP "system" "persist.device_config.activity_manager_native_boot.use_freezer" "true"
SET_PROP "system" "debug.hwui.skia_atrace_enabled" "false"
SET_PROP "vendor" "renderthread.skia.reduceopstasksplitting" "true"
SET_PROP "product" "debug.hwui.use_hint_manager" "true"
SET_PROP "product" "debug.sf.latch_unsignaled" "1"
SET_PROP "product" "debug.sf.disable_backpressure" "1"
SET_PROP "product" "debug.sf.enable_gl_backpressure" "0"
SET_PROP "product" "debug.sf.high_fps_late_app_phase_offset_ns" "0"
SET_PROP "product" "debug.sf.high_fps_late_sf_phase_offset_ns" "0"

for PF_P in persist.logd.logpersistd persist.logd.logpersistd.buffer persist.logd.logpersistd.size persist.logd.size; do
    SET_PROP "system" "$PF_P" --delete
done
unset PF_P
LOG_STEP_OUT

# Safeguard Galaxy AI feature version and enable screenshot key combination
LOG_STEP_IN "- Verifying Galaxy AI feature version 20263 & screenshot chord"
FF_PATH="$WORK_DIR/system/system/etc/floating_feature.xml"
if [ -f "$FF_PATH" ]; then
    if grep -q "SEC_FLOATING_FEATURE_COMMON_CONFIG_AI_VERSION" "$FF_PATH"; then
        sed -i 's|<SEC_FLOATING_FEATURE_COMMON_CONFIG_AI_VERSION>.*</SEC_FLOATING_FEATURE_COMMON_CONFIG_AI_VERSION>|<SEC_FLOATING_FEATURE_COMMON_CONFIG_AI_VERSION>20263</SEC_FLOATING_FEATURE_COMMON_CONFIG_AI_VERSION>|g' "$FF_PATH"
    else
        sed -i 's|</SecFloatingFeatureSet>|    <SEC_FLOATING_FEATURE_COMMON_CONFIG_AI_VERSION>20263</SEC_FLOATING_FEATURE_COMMON_CONFIG_AI_VERSION>\n</SecFloatingFeatureSet>|' "$FF_PATH"
    fi
    if grep -q "SEC_FLOATING_FEATURE_SETTINGS_SUPPORT_FUNCTION_KEY_MENU" "$FF_PATH"; then
        sed -i 's|<SEC_FLOATING_FEATURE_SETTINGS_SUPPORT_FUNCTION_KEY_MENU>.*</SEC_FLOATING_FEATURE_SETTINGS_SUPPORT_FUNCTION_KEY_MENU>|<SEC_FLOATING_FEATURE_SETTINGS_SUPPORT_FUNCTION_KEY_MENU>TRUE</SEC_FLOATING_FEATURE_SETTINGS_SUPPORT_FUNCTION_KEY_MENU>|g' "$FF_PATH"
    else
        sed -i 's|</SecFloatingFeatureSet>|    <SEC_FLOATING_FEATURE_SETTINGS_SUPPORT_FUNCTION_KEY_MENU>TRUE</SEC_FLOATING_FEATURE_SETTINGS_SUPPORT_FUNCTION_KEY_MENU>\n</SecFloatingFeatureSet>|' "$FF_PATH"
    fi
    if grep -q "SEC_FLOATING_FEATURE_BIXBY_SUPPORT_LONG_KEY_SERVICE" "$FF_PATH"; then
        sed -i 's|<SEC_FLOATING_FEATURE_BIXBY_SUPPORT_LONG_KEY_SERVICE>.*</SEC_FLOATING_FEATURE_BIXBY_SUPPORT_LONG_KEY_SERVICE>|<SEC_FLOATING_FEATURE_BIXBY_SUPPORT_LONG_KEY_SERVICE>FALSE</SEC_FLOATING_FEATURE_BIXBY_SUPPORT_LONG_KEY_SERVICE>|g' "$FF_PATH"
    else
        sed -i 's|</SecFloatingFeatureSet>|    <SEC_FLOATING_FEATURE_BIXBY_SUPPORT_LONG_KEY_SERVICE>FALSE</SEC_FLOATING_FEATURE_BIXBY_SUPPORT_LONG_KEY_SERVICE>\n</SecFloatingFeatureSet>|' "$FF_PATH"
    fi
fi
LOG_STEP_OUT


