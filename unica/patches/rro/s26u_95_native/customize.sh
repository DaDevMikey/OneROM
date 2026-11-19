OVERLAY_APK="$(find "$WORK_DIR/product/overlay" -maxdepth 1 -name "framework-res__*__auto_generated_rro_product.apk" -printf "%f\n" | head -n 1)"
if [[ -n "$OVERLAY_APK" && -d "$SRC_DIR/target/$TARGET_CODENAME/overlay" ]]; then
    LOG "- Applying stock cutout and display overlays to $OVERLAY_APK"
    DECODE_APK "product" "overlay/$OVERLAY_APK"
    rm -rf "$APKTOOL_DIR/product/overlay/$OVERLAY_APK/res"
    cp -fa "$SRC_DIR/target/$TARGET_CODENAME/overlay" "$APKTOOL_DIR/product/overlay/$OVERLAY_APK/res"
fi
