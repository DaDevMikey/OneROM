AS_DIR="$APKTOOL_DIR/system/framework/framework.jar"
AS_MARK="$APKTOOL_DIR/system/framework/.framework.jar.dex_autoallow"
rm -f "$AS_MARK"
DECODE_APK "system" "system/framework/framework.jar"
LOG_STEP_IN "- Per-app Galaxy S26 Ultra spoof (Galaxy Store, Good Lock, Home Up, Theme Park)"
if python3 "$MODPATH/port_appspoof.py" "$AS_DIR" "$AS_MARK" "$WORK_DIR/system/system/framework/framework.jar"; then
    LOG "- Preinstalled and always-on Galaxy S26 Ultra spoofer applied to framework.jar"
else
    rm -f "$AS_MARK"
    LOGW "App spoof port failed, framework.jar unchanged"
fi
LOG_STEP_OUT
unset AS_DIR AS_MARK
