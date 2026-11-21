LOG_STEP_IN "- Restoring S10 wallpaper tilt effect for One UI 9.5"
DECODE_APK "system_ext" "priv-app/SystemUI/SystemUI.apk" || exit 1
cp -rf "$MODPATH/files/smali_classes4" "$APKTOOL_DIR/system_ext/priv-app/SystemUI/SystemUI.apk/"
LOG_STEP_OUT
