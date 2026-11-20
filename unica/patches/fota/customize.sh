if [ -f "$WORK_DIR/system/system/priv-app/FotaAgent/FotaAgent.apk" ]; then
    DECODE_APK "system" "system/priv-app/FotaAgent/FotaAgent.apk"
    python3 "$MODPATH/patch_fota.py" "$APKTOOL_DIR/system/priv-app/FotaAgent/FotaAgent.apk" || exit 1
else
    LOGW "FotaAgent.apk not present (debloated), skipping FOTA patch"
fi
