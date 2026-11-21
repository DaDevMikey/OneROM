LOG_STEP_IN "- Installing One UI 9.5 optional emoji font (/system/fonts_95)"
rm -rf "$WORK_DIR/system/system/fonts_95"
mkdir -p "$WORK_DIR/system/system/fonts_95"
cp -al "$WORK_DIR/system/system/fonts/." "$WORK_DIR/system/system/fonts_95/"
cp -f "$MODPATH/files/SamsungColorEmoji_95.ttf" "$WORK_DIR/system/system/fonts_95/SamsungColorEmoji.ttf"
SET_METADATA "system" "system/fonts_95" 0 0 755 "u:object_r:system_file:s0"
while IFS= read -r f; do
    rel="${f#$WORK_DIR/system/}"
    SET_METADATA "system" "$rel" 0 0 644 "u:object_r:system_file:s0"
done < <(find "$WORK_DIR/system/system/fonts_95" -type f)
LOG_STEP_OUT
