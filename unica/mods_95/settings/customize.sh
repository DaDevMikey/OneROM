LOG_STEP_IN "- Adding OneROM Zeta 9.5 logo and branding"
DECODE_APK "system" "system/priv-app/SecSettings/SecSettings.apk"

cp -fa "$MODPATH/SecSettings.apk/"* "$APKTOOL_DIR/system/priv-app/SecSettings/SecSettings.apk"

python3 - << 'PYEOF'
import os
import re
from pathlib import Path

apktool_dir = Path(os.environ.get("APKTOOL_DIR", ""))
secsettings = apktool_dir / "system/priv-app/SecSettings/SecSettings.apk"
if not secsettings.is_dir():
    print("SecSettings dir not found:", secsettings)
    exit(0)

xml_dir = secsettings / "res/xml"
if not xml_dir.is_dir():
    print("res/xml dir not found in SecSettings")
    exit(0)

# 1. Add rom_logo banner to software info settings
for f in xml_dir.glob("*.xml"):
    try:
        txt = f.read_text(encoding="utf-8")
        if 'android:key="one_ui_version"' in txt and 'android:key="rom_logo"' not in txt:
            banner_tag = '<com.android.settingslib.widget.LayoutPreference android:layout="@layout/logo" android:selectable="false" android:key="rom_logo" />\n    '
            txt = re.sub(r'(<Preference[^>]*android:key="one_ui_version")', banner_tag + r'\1', txt)
            f.write_text(txt, encoding="utf-8")
            print(f"  + Added rom_logo banner to {f.name}")
    except Exception as e:
        pass

# 2. Strip privacy_display and sec_high_refresh_rate from all display settings
for f in xml_dir.glob("*.xml"):
    try:
        txt = f.read_text(encoding="utf-8")
        orig = txt
        if 'android:key="privacy_display"' in txt:
            txt = re.sub(r'<[^>]*android:key="privacy_display"[^>]*/>\s*', '', txt)
            print(f"  - Removed privacy_display from {f.name}")
        if 'android:key="pd_inset"' in txt:
            txt = re.sub(r'<[^>]*android:key="pd_inset"[^>]*/>\s*', '', txt)
            print(f"  - Removed pd_inset from {f.name}")
        if 'android:key="sec_high_refresh_rate"' in txt:
            txt = re.sub(r'<[^>]*android:key="sec_high_refresh_rate"[^>]*/>\s*', '', txt)
            print(f"  - Removed sec_high_refresh_rate from {f.name}")
        if txt != orig:
            f.write_text(txt, encoding="utf-8")
    except Exception as e:
        pass

print("SecSettings OneROM Zeta customisations applied successfully")
PYEOF

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

