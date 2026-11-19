LOG "- Applying custom platform signature normalization for SecSettings.apk on One UI 9.5"
python3 "$MODPATH/patch_services_signature.py" "$WORK_DIR/system/system/framework/services.jar" || exit 1
SET_METADATA "system" "system/framework/services.jar" 0 0 644 "u:object_r:system_file:s0"
