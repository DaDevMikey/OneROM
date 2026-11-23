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
    python3 "$SRC_DIR/scripts/patch_bluetooth_apex.py" "$WORK_DIR/system/system/apex/com.android.bt.apex" || ABORT "Bluetooth APEX patch failed"
elif [ -f "$WORK_DIR/system/apex/com.android.bt.apex" ]; then
    python3 "$SRC_DIR/scripts/patch_bluetooth_apex.py" "$WORK_DIR/system/apex/com.android.bt.apex" || ABORT "Bluetooth APEX patch failed"
else
    ABORT "Bluetooth APEX not found in work directory"
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
SET_PROP "vendor" "ro.surface_flinger.use_content_detection_for_refresh_rate" "false"
SET_PROP "vendor" "ro.surface_flinger.set_idle_timer_ms" "0"
SET_PROP "vendor" "ro.surface_flinger.set_touch_timer_ms" "0"
SET_PROP "vendor" "ro.surface_flinger.set_display_power_timer_ms" "0"
LOG_STEP_OUT

# Remove sead to avoid crash loop due to missing panel RGB calibration on Exynos 9820
LOG_STEP_IN "- Removing sead (EnvironmentAdaptiveDisplay) to prevent crash loop"
DELETE_FROM_WORK_DIR "system" "system/priv-app/EnvironmentAdaptiveDisplay"
DELETE_FROM_WORK_DIR "system" "system/etc/permissions/privapp-permissions-com.samsung.android.sead.xml"
LOG_STEP_OUT

# Fix GPIS cpuset pin for SurfaceFlinger
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

LOG_STEP_IN "- Enabling HWC virtual display and /dev/jsqz access"
SET_PROP "vendor" "debug.sf.enable_hwc_vds" "1"
if [ -f "$WORK_DIR/vendor/ueventd.rc" ]; then
    grep -q '^/dev/jsqz' "$WORK_DIR/vendor/ueventd.rc" || \
        echo "/dev/jsqz                 0660   mediacodec     camera" >> "$WORK_DIR/vendor/ueventd.rc"
fi
LOG_STEP_OUT

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
SET_PROP "product" "pm.dexopt.first-boot" "verify"
SET_PROP "product" "pm.dexopt.boot-after-ota" "verify"
SET_PROP "product" "pm.dexopt.boot-after-mainline-update" "verify"
LOG_STEP_OUT

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
