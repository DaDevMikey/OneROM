LOG "- Setting b2 punch hole floating features without decoding SystemUI DEX container"
SET_FLOATING_FEATURE_CONFIG "SEC_FLOATING_FEATURE_LOCKSCREEN_CONFIG_PUNCHHOLE_VI" \
    "face,pos:0.862:0.0286,size:0.2084:0.0571,type:b2"

CUTOUT_CORNER="$(grep -o -P '(?<=<SEC_FLOATING_FEATURE_SYSTEMUI_CONFIG_CORNER_ROUND>)[^<]+' \
    "$FW_DIR/$TARGET_FIRMWARE_PATH/system/system/etc/floating_feature.xml" 2> /dev/null || true)"
if [ -n "$CUTOUT_CORNER" ]; then
    SET_FLOATING_FEATURE_CONFIG "SEC_FLOATING_FEATURE_SYSTEMUI_CONFIG_CORNER_ROUND" "$CUTOUT_CORNER"
fi
unset CUTOUT_CORNER
