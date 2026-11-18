if [ -f "$WORK_DIR/system/system/priv-app/FotaAgent/FotaAgent.apk" ]; then
    DECODE_APK "system" "system/priv-app/FotaAgent/FotaAgent.apk"
    python3 "$SRC_DIR/unica/patches/fota/patch_fota.py" "$APKTOOL_DIR/system/priv-app/FotaAgent/FotaAgent.apk" || LOGW "FOTA patch failed, keeping stock FotaAgent"
fi
