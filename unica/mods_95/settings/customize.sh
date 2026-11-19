LOG_STEP_IN "- Enabling Cached App Freezer"
SET_PROP "system" "persist.device_config.activity_manager_native_boot.use_freezer" "true"
LOG_STEP_OUT

LOG_STEP_IN "- Mapping physical Bixby key to USER WAKE"
if [ -f "$WORK_DIR/system/system/usr/keylayout/Generic.kl" ]; then
    sed -i '/^key 703[[:space:]]/d' "$WORK_DIR/system/system/usr/keylayout/Generic.kl" 2>/dev/null || true
    echo 'key 703   USER   WAKE' >> "$WORK_DIR/system/system/usr/keylayout/Generic.kl"
fi
for kl in "$WORK_DIR/system/system/usr/keylayout/Generic_internal.kl" \
          "$WORK_DIR/system/system/usr/keylayout/Vendor_0075_Product_0100.kl" \
          "$WORK_DIR/system/system/usr/keylayout/Vendor_04e8.kl" \
          "$WORK_DIR/system/system/usr/keylayout/gpio_keys.kl" \
          "$WORK_DIR/vendor/usr/keylayout/gpio_keys.kl"; do
    if [ -f "$kl" ]; then
        sed -Ei 's/^key 703[[:space:]]+[^[:space:]]+.*/key 703   USER   WAKE/' "$kl"
    fi
done
LOG_STEP_OUT
