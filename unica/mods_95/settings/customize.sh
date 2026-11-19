LOG_STEP_IN "- Customizing SecSettings for OneROM Zeta 9.5"
DECODE_APK "system" "system/priv-app/SecSettings/SecSettings.apk"

# 1. Unica OneROM features, banners, drawables, strings, IMEI privacy, and fragment validation
python3 "$MODPATH/prepare.py" "$MODPATH" "$APKTOOL_DIR/system/priv-app/SecSettings/SecSettings.apk" || exit 1

# 2. Map Bixby key actions through BixbyKeyActionActivity
if [ -d "$APKTOOL_DIR/system/priv-app/SecSettings/SecSettings.apk/smali_classes5" ]; then
    python3 "$MODPATH/patch_bixby.py" "$APKTOOL_DIR/system/priv-app/SecSettings/SecSettings.apk/smali_classes5" || exit 1
fi

# 3. Patch NFC antenna validation crash
python3 "$MODPATH/patch_nfc.py" "$APKTOOL_DIR/system/priv-app/SecSettings/SecSettings.apk" || exit 1

# 4. Patch screen resolution scaling to lock 19:9 width/height/density
python3 "$MODPATH/patch_resolution.py" "$APKTOOL_DIR/system/priv-app/SecSettings/SecSettings.apk/smali_classes3" || exit 1

# 5. Rune.smali patching (S Pen, Private Display, High Refresh Rate) now handled inside prepare.py (step 15/16)

# 6. Stage OneROM wallpaper and logo media assets
if [ -f "$MODPATH/SecSettings.apk/res/drawable/logo.png" ]; then
    cp -fa "$MODPATH/SecSettings.apk/res/drawable/logo.png" "$WORK_DIR/system/system/media/rom_logo.png"
    SET_METADATA "system" "system/media/rom_logo.png" 0 0 644 "u:object_r:system_file:s0"
fi
if [ -f "$MODPATH/SecSettings.apk/res/drawable-nodpi/onerom_s10_wallpaper.png" ]; then
    cp -fa "$MODPATH/SecSettings.apk/res/drawable-nodpi/onerom_s10_wallpaper.png" "$WORK_DIR/system/system/media/onerom_wallpaper.png"
    SET_METADATA "system" "system/media/onerom_wallpaper.png" 0 0 644 "u:object_r:system_file:s0"
fi
if [ -f "$MODPATH/SecSettings.apk/res/drawable-nodpi/unica_logo.webp" ]; then
    cp -fa "$MODPATH/SecSettings.apk/res/drawable-nodpi/unica_logo.webp" "$WORK_DIR/system/system/media/unica_logo.webp"
    SET_METADATA "system" "system/media/unica_logo.webp" 0 0 644 "u:object_r:system_file:s0"
fi
LOG_STEP_OUT

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
