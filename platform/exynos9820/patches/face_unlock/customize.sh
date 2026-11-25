if [ -f "$WORK_DIR/system/system/priv-app/BiometricSetting/BiometricSetting.apk" ]; then
    LOG_STEP_IN "- Adding S10 punch-hole assets to BiometricSetting.apk"
    DECODE_APK "system" "system/priv-app/BiometricSetting/BiometricSetting.apk"
    mkdir -p "$APKTOOL_DIR/system/priv-app/BiometricSetting/BiometricSetting.apk/assets"
    cp -f "$MODPATH/files/punch_hole_ic_b1.json" "$APKTOOL_DIR/system/priv-app/BiometricSetting/BiometricSetting.apk/assets/punch_hole_ic_b1.json"
    cp -f "$MODPATH/files/punch_hole_ic_b1_whitebg.json" "$APKTOOL_DIR/system/priv-app/BiometricSetting/BiometricSetting.apk/assets/punch_hole_ic_b1_whitebg.json"
    LOG_STEP_OUT
fi

ALLOWLIST="$WORK_DIR/system/system/etc/sysconfig/allowed-system-preload-apps.xml"
if [ -f "$ALLOWLIST" ] && ! grep -q 'com.samsung.android.bio.face.service' "$ALLOWLIST"; then
    LOG "- Adding com.samsung.android.bio.face.service to allowed-system-preload-apps.xml"
    sed -i 's|</config>|    <allowed-system-preload package="com.samsung.android.bio.face.service"/>\n</config>|' "$ALLOWLIST"
fi

if [ -f "$WORK_DIR/system/system/priv-app/BioFaceService/BioFaceService.apk" ] && [ -f "$MODPATH/files/BioFaceService_classes.jar" ]; then
    LOG "- Installing s10-app-overrides for BioFaceService.apk"
    mkdir -p "$WORK_DIR/system/system/framework/s10-app-overrides/BioFaceService.apk"
    cp -f "$MODPATH/files/BioFaceService_classes.jar" "$WORK_DIR/system/system/framework/s10-app-overrides/BioFaceService.apk/classes.jar"
    sha256sum "$WORK_DIR/system/system/priv-app/BioFaceService/BioFaceService.apk" | cut -d ' ' -f1 > "$WORK_DIR/system/system/framework/s10-app-overrides/BioFaceService.apk/apk.sha256"
    SET_METADATA "system" "system/framework/s10-app-overrides" 0 0 755 "u:object_r:system_file:s0"
    SET_METADATA "system" "system/framework/s10-app-overrides/BioFaceService.apk" 0 0 755 "u:object_r:system_file:s0"
    SET_METADATA "system" "system/framework/s10-app-overrides/BioFaceService.apk/classes.jar" 0 0 644 "u:object_r:system_file:s0"
    SET_METADATA "system" "system/framework/s10-app-overrides/BioFaceService.apk/apk.sha256" 0 0 644 "u:object_r:system_file:s0"
fi
