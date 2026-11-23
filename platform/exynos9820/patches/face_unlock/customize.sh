if [ -f "$WORK_DIR/system/system/priv-app/BiometricSetting/BiometricSetting.apk" ]; then
    LOG_STEP_IN "- Installing S10 punch-hole assets for BiometricSetting.apk"
    for asset in punch_hole_ic_b1.json punch_hole_ic_b1_whitebg.json; do
        if [ ! -f "$MODPATH/files/$asset" ]; then
            LOGE "Required BiometricSetting asset is missing: $asset"
            exit 1
        fi
    done
    OVERRIDE_DIR="$WORK_DIR/system/system/framework/s10-app-overrides/BiometricSetting.apk"
    mkdir -p "$OVERRIDE_DIR/assets"
    cp -f "$MODPATH/files/punch_hole_ic_b1.json" "$OVERRIDE_DIR/assets/punch_hole_ic_b1.json"
    cp -f "$MODPATH/files/punch_hole_ic_b1_whitebg.json" "$OVERRIDE_DIR/assets/punch_hole_ic_b1_whitebg.json"
    SET_METADATA "system" "system/framework/s10-app-overrides" 0 0 755 "u:object_r:system_file:s0"
    SET_METADATA "system" "system/framework/s10-app-overrides/BiometricSetting.apk" 0 0 755 "u:object_r:system_file:s0"
    SET_METADATA "system" "system/framework/s10-app-overrides/BiometricSetting.apk/assets" 0 0 755 "u:object_r:system_file:s0"
    SET_METADATA "system" "system/framework/s10-app-overrides/BiometricSetting.apk/assets/punch_hole_ic_b1.json" 0 0 644 "u:object_r:system_file:s0"
    SET_METADATA "system" "system/framework/s10-app-overrides/BiometricSetting.apk/assets/punch_hole_ic_b1_whitebg.json" 0 0 644 "u:object_r:system_file:s0"
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

FACE_SEPOLICY="$WORK_DIR/vendor/etc/selinux/vendor_sepolicy.cil"
FACE_TA_ALLOW='(allow faced_31_0 tee_file (file (read getattr map open)))'
if [ ! -f "$FACE_SEPOLICY" ]; then
    LOGE "Required vendor SELinux policy is missing: $FACE_SEPOLICY"
    exit 1
fi
if ! grep -Fxq "$FACE_TA_ALLOW" "$FACE_SEPOLICY"; then
    LOG "- Allowing faced to read its TrustZone TA images"
    printf '%s\n' "$FACE_TA_ALLOW" >> "$FACE_SEPOLICY"
fi
