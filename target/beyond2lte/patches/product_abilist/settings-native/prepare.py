from copy import deepcopy
from pathlib import Path
import re
import shutil
import sys
import xml.etree.ElementTree as ET


ANDROID = "{http://schemas.android.com/apk/res/android}"
SETTINGS = "{http://schemas.android.com/apk/res-auto}"
ET.register_namespace("android", ANDROID[1:-1])
ET.register_namespace("settings", SETTINGS[1:-1])


def write_xml(root, path):
    path.parent.mkdir(parents=True, exist_ok=True)
    ET.ElementTree(root).write(path, encoding="utf-8", xml_declaration=True)


def prepare(module, decoded):
    assets = module / "SecSettings.apk"

    # 1. Clear any old reflection hooks
    for path in (
        decoded / "smali/com/android/settings/SettingsActivity.smali",
        decoded / "smali_classes3/com/samsung/android/settings/deviceinfo/aboutphone/SecMyDeviceInfoFragment.smali",
        decoded / "smali_classes3/com/samsung/android/settings/deviceinfo/softwareinfo/SoftwareInfoSettings.smali",
        decoded / "smali_classes3/com/samsung/android/settings/deviceinfo/SecDeviceInfoUtils.smali",
    ):
        if not path.exists():
            continue
        source = path.read_text(encoding="utf-8")
        source = re.sub(
            r"    invoke-static \{p1\}, Lio/mesalabs/unica/settings/OneRomSettings;->isOneRomFragment.*?:onerom_existing_fragment_validation\n",
            "", source, flags=re.S,
        )
        source = re.sub(r"    invoke-static \{p0\}, Lio/mesalabs/unica/settings/OneRomSettings;->attach[^\n]+\n", "", source)
        source = re.sub(
            r'    const-string v0, "onerom_show_(imei|serial)"\n    invoke-static \{p0, v0\}, Lio/mesalabs/unica/settings/OneRomSettings;->showIdentifier.*?    :onerom_show_\1\n',
            "", source, flags=re.S,
        )
        path.write_text(source, encoding="utf-8")

    # 2. Copy and merge all XML and drawables from assets
    for source in (assets / "res").rglob("*"):
        if not source.is_file():
            continue
        relative = source.relative_to(assets)
        destination = decoded / relative
        destination.parent.mkdir(parents=True, exist_ok=True)
        if relative.parts[1].startswith("values") and source.suffix == ".xml":
            target = ET.parse(destination).getroot() if destination.exists() else ET.Element("resources")
            keys = {(item.tag, item.get("name")) for item in target}
            for item in ET.parse(source).getroot():
                if (item.tag, item.get("name")) not in keys:
                    target.append(deepcopy(item))
                    keys.add((item.tag, item.get("name")))
            write_xml(target, destination)
        else:
            shutil.copy2(source, destination)

    # 3. Copy all smali trees from assets
    for smali_dir in assets.glob("smali*"):
        if smali_dir.is_dir():
            shutil.copytree(smali_dir, decoded / smali_dir.name, dirs_exist_ok=True)

    # 4. Replace version references with OneROM Zeta 9.5 in smali
    if (decoded / "smali_classes5").is_dir():
        for path in (decoded / "smali_classes5").rglob("*.smali"):
            source = path.read_text(encoding="utf-8")
            source = source.replace("OneROM 8.0", "OneROM Zeta 9.5")
            source = source.replace("OneROM 8.5", "OneROM Zeta 9.5")
            source = source.replace("OneROM 9.0", "OneROM Zeta 9.5")
            source = source.replace("OneROM Native", "OneROM Zeta")
            source = source.replace("OneROM Delta", "OneROM Zeta")
            path.write_text(source, encoding="utf-8")

    # 5. Fix logo layout text
    logo_layout = decoded / "res/layout/unica_settings_logo_layout.xml"
    if logo_layout.exists():
        src = logo_layout.read_text(encoding="utf-8")
        src = re.sub(r'android:text="OneROM[^"]*"', 'android:text="OneROM Zeta 9.5"', src)
        logo_layout.write_text(src, encoding="utf-8")

    # 6. Update strings
    for strings_path in decoded.glob("res/values*/strings.xml"):
        try:
            strings = ET.parse(strings_path).getroot()
            modified = False
            for item in strings:
                if item.get("name") == "onerom_banner_default":
                    item.text = "OneROM Zeta 9.5"
                    modified = True
            for name, value in {
                "onerom_delta_title": "OneROM features",
                "onerom_delta_summary": "9.5",
                "onerom_show_imei_title": "Show IMEI",
                "onerom_show_serial_title": "Show serial number",
            }.items():
                item = next((entry for entry in strings if entry.get("name") == name), None)
                if item is None:
                    item = ET.SubElement(strings, "string", {"name": name})
                item.text = value
                modified = True
            if modified:
                write_xml(strings, strings_path)
        except Exception:
            pass

    # 7. Main Settings Homepage: Restore About phone parity and remove OneROM card
    homepage_candidates = list((decoded / "res/xml").glob("*.xml"))
    for h_path in homepage_candidates:
        try:
            tree = ET.parse(h_path)
            homepage = tree.getroot()
            if any(item.get(ANDROID + "key") in {"top_level_about_phone", "top_level_about_device"} for item in homepage):
                changed = False
                for item in list(homepage):
                    key = item.get(ANDROID + "key")
                    if key in {"top_level_onerom", "top_level_user_manual"}:
                        homepage.remove(item)
                        changed = True
                    elif key in {"top_level_about_device", "top_level_about_phone"}:
                        item.tag = "io.mesalabs.unica.settings.AboutHomepagePreference"
                        item.set(SETTINGS + "controller", "io.mesalabs.unica.settings.DoubleTapAboutPreferenceController")
                        changed = True
                    elif key == "top_level_remote_support":
                        item.set(ANDROID + "title", "OneROM Guide")
                        item.set(ANDROID + "summary", "Learn about OneROM features and tips")
                        item.set(ANDROID + "fragment", "io.mesalabs.unica.settings.OneRomGuideFragment")
                        item.set(ANDROID + "icon", "@drawable/sec_ic_settings_help")
                        changed = True
                if not any(item.get(ANDROID + "key") == "top_level_remote_support" for item in homepage):
                    guide = ET.Element("com.android.settings.widget.HomepagePreference", {
                        ANDROID + "icon": "@drawable/sec_ic_settings_help",
                        ANDROID + "title": "OneROM Guide",
                        ANDROID + "key": "top_level_remote_support",
                        ANDROID + "summary": "Learn about OneROM features and tips",
                        ANDROID + "order": "360000",
                        ANDROID + "fragment": "io.mesalabs.unica.settings.OneRomGuideFragment",
                    })
                    homepage.append(guide)
                    changed = True
                if changed:
                    write_xml(homepage, h_path)
                break
        except Exception:
            pass

    # 8. Ensure Software Info Settings has banner and OneROM settings shortcut
    software_xml_path = decoded / "res/xml/sec_software_info_settings.xml"
    if software_xml_path.exists():
        software = ET.parse(software_xml_path).getroot()
        # Ensure banner is present
        if not any(item.get(ANDROID + "key") == "onerom_software_banner" for item in software):
            banner = ET.Element("com.android.settingslib.widget.LayoutPreference", {
                ANDROID + "layout": "@layout/onerom_software_banner",
                ANDROID + "selectable": "true",
                ANDROID + "key": "onerom_software_banner",
                ANDROID + "order": "-999",
                ANDROID + "fragment": "io.mesalabs.unica.settings.UnicaSettingsFragment",
                SETTINGS + "controller": "io.mesalabs.unica.settings.SoftwareInfoBannerPreferenceController",
                SETTINGS + "searchable": "false",
            })
            software.insert(0, banner)
            write_xml(software, software_xml_path)

    # 9. Also add banner to About phone if desired
    about_fragment = decoded / "smali_classes3/com/samsung/android/settings/deviceinfo/aboutphone/SecMyDeviceInfoFragment.smali"
    if about_fragment.exists():
        match = re.search(r"\.method public final getPreferenceScreenResId\(\)I.*?const p0, (0x[0-9a-f]+)",
                          about_fragment.read_text(encoding="utf-8"), re.S)
        if match:
            public_path = decoded / "res/values/public.xml"
            if public_path.exists():
                public = ET.parse(public_path).getroot()
                resource = next((item.get("name") for item in public
                                if item.get("type") == "xml" and item.get("id") == match.group(1)), None)
                if resource:
                    about_path = decoded / f"res/xml/{resource}.xml"
                    if about_path.exists() and software_xml_path.exists():
                        about = ET.parse(about_path).getroot()
                        if not any(item.get(ANDROID + "key") == "onerom_software_banner" for item in about):
                            software = ET.parse(software_xml_path).getroot()
                            banner_item = next((item for item in software if item.get(ANDROID + "key") == "onerom_software_banner"), None)
                            if banner_item is not None:
                                about.insert(0, deepcopy(banner_item))
                                write_xml(about, about_path)

    # 10. Battery Regulatory & Health: FORCE AVAILABLE
    for path in decoded.glob("smali*/com/samsung/android/settings/deviceinfo/batteryinfo/BatteryInfoUtils.smali"):
        source = path.read_text(encoding="utf-8")
        pat = r"(\.method public static isAvailableBatteryRegulatory\(Landroid/content/Context;\)Z\n)(.*?)(\.end method)"
        rep = r"\1    .locals 1\n    const/4 v0, 0x1\n    return v0\n\3"
        source = re.sub(pat, rep, source, flags=re.S)
        path.write_text(source, encoding="utf-8")

    for name in ("BatteryRegulatoryPreferenceController", "SecBatteryInfoFragment", "BatteryHealthPreferenceController"):
        for path in decoded.glob(f"smali*/com/samsung/android/settings/deviceinfo/batteryinfo/{name}.smali"):
            source = path.read_text(encoding="utf-8")
            source = source.replace('"SM-A236B"', '"SM-S948B"')
            path.write_text(source, encoding="utf-8")

    # 11. Build Number Branding: Ensure it always displays custom OneROM Zeta 9.5 branding
    for path in decoded.glob("smali*/com/android/settings/deviceinfo/BuildNumberPreferenceController.smali"):
        source = path.read_text(encoding="utf-8")
        pat = r"(\.method public getSummary\(\)Ljava/lang/CharSequence;\n)(.*?)(\.end method)"
        rep = (
            r"\1    .locals 2\n"
            r'    const-string v0, "ro.build.display.id"\n'
            r'    const-string v1, "OneROM Zeta 9.5 (S948BXXU6ZZKN)"\n'
            r"    invoke-static {v0, v1}, Landroid/os/SemSystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;\n"
            r"    move-result-object v0\n"
            r"    return-object v0\n\3"
        )
        source = re.sub(pat, rep, source, flags=re.S)
        path.write_text(source, encoding="utf-8")

    # 12. Register activities in AndroidManifest.xml
    manifest_path = decoded / "AndroidManifest.xml"
    if manifest_path.exists():
        manifest = ET.parse(manifest_path).getroot()
        application = manifest.find("application")
        activity = "io.mesalabs.unica.BixbyKeyActionActivity"
        if application is not None and not any(item.get(ANDROID + "name") == activity for item in application.findall("activity")):
            ET.SubElement(application, "activity", {
                ANDROID + "name": activity, ANDROID + "exported": "false",
                ANDROID + "excludeFromRecents": "true", ANDROID + "noHistory": "true",
                ANDROID + "taskAffinity": "", ANDROID + "showWhenLocked": "true",
                ANDROID + "theme": "@android:style/Theme.Translucent.NoTitleBar",
            })
            write_xml(manifest, manifest_path)

    # 13. SettingsActivity: Validate all Unica / OneROM fragments
    activity_path = decoded / "smali/com/android/settings/SettingsActivity.smali"
    if activity_path.exists():
        source = activity_path.read_text(encoding="utf-8")
        if ":onerom_native_fragment" not in source:
            pattern = r"(\.method public isValidFragment\(Ljava/lang/String;\)Z\s*\.locals \d+)"
            checks = (
                r"\1\n"
                r"    if-eqz p1, :onerom_standard_fragment\n"
                r'    const-string v0, "io.mesalabs.unica.settings."\n'
                r"    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z\n"
                r"    move-result v0\n"
                r"    if-eqz v0, :onerom_native_fragment\n"
                r"    goto :onerom_standard_fragment\n"
                r"    :onerom_native_fragment\n"
                r"    const/4 v0, 0x1\n"
                r"    return v0\n"
                r"    :onerom_standard_fragment\n"
            )
            source = re.sub(pattern, checks, source, count=1)
            activity_path.write_text(source, encoding="utf-8")

    # 14. IMEI and Serial privacy masking in SecDeviceInfoUtils.smali
    utils_path = decoded / "smali_classes3/com/samsung/android/settings/deviceinfo/SecDeviceInfoUtils.smali"
    if utils_path.exists():
        source = utils_path.read_text(encoding="utf-8")
        for identity, pattern_str in (
            ("imei", r"(\.method public static getImei\(Landroid/content/Context;I[^\n]*\n\s*\.locals )(\d+)"),
            ("serial", r"(\.method public static getSerialNumber\(Landroid/content/Context;\)Ljava/lang/String;\n\s*\.locals )(\d+)"),
        ):
            if f":onerom_show_{identity}" in source:
                continue
            def inject(match):
                return match.group(1) + str(max(3, int(match.group(2)))) + f'''

    if-eqz p0, :onerom_show_{identity}
    invoke-virtual {{p0}}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;
    move-result-object v0
    const-string v1, "onerom_show_{identity}"
    const/4 v2, 0x0
    invoke-static {{v0, v1, v2}}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I
    move-result v0
    if-nez v0, :onerom_show_{identity}
    const-string v0, "********"
    return-object v0
    :onerom_show_{identity}'''
            source, count = re.subn(pattern_str, inject, source)
        utils_path.write_text(source, encoding="utf-8")

    # 15. Rune.smali: disable S Pen, Private Display, and High Refresh Rate for exynos9820 devices
    for rune_path in decoded.glob("smali*/com/samsung/android/settings/Rune.smali"):
        source = rune_path.read_text(encoding="utf-8")
        changed = False
        for method_sig, stub in (
            (
                r"\.method public static supportPDSettings\(Landroid/content/Context;\)Z\n(.*?)\.end method",
                ".method public static supportPDSettings(Landroid/content/Context;)Z\n    .locals 1\n\n    const/4 p0, 0x0\n\n    return p0\n.end method",
            ),
            (
                r"\.method public static supportHighRefreshRate\(Landroid/content/Context;I\)Z\n(.*?)\.end method",
                ".method public static supportHighRefreshRate(Landroid/content/Context;I)Z\n    .locals 0\n\n    const/4 p0, 0x0\n\n    return p0\n.end method",
            ),
            (
                r"\.method public static isSupportSpen\(\)Z\n(.*?)\.end method",
                ".method public static isSupportSpen()Z\n    .locals 1\n\n    const/4 v0, 0x0\n\n    return v0\n.end method",
            ),
        ):
            new_source, count = re.subn(method_sig, stub, source, flags=re.S)
            if count:
                source = new_source
                changed = True
        if changed:
            rune_path.write_text(source, encoding="utf-8")
            print(f"  + Patched Rune.smali (disabled S Pen, PD, HighRefreshRate)")

    # 16. Remove S Pen entry from Advanced Features XML
    for xml_path in decoded.glob("res/xml/APKTOOL_DUMMYVAL_*.xml"):
        try:
            tree = ET.parse(xml_path)
            root = tree.getroot()
            removed = False
            for child in list(root):
                key = child.get(ANDROID + "key", "")
                if "spen" in key.lower() or "block_gestures_with_spen" in key.lower():
                    root.remove(child)
                    removed = True
            if removed:
                write_xml(root, xml_path)
                print(f"  + Removed S Pen entry from {xml_path.name}")
        except Exception:
            pass

    # 17. Patch AbstractLogpersistPreferenceController.smali to prevent Developer Settings crash
    for controller_path in decoded.glob("smali*/com/android/settingslib/development/AbstractLogpersistPreferenceController.smali"):
        source = controller_path.read_text(encoding="utf-8")
        if ":catch_off" not in source:
            pat1 = r"(\.method public final setLogpersistOff\(Z\)V\n)(.*?)(\.end method)"
            def rep1(m):
                body = m.group(2)
                return m.group(1) + "    :try_start_off\n" + body + "\n    :try_end_off\n    .catch Ljava/lang/Throwable; {:try_start_off .. :try_end_off} :catch_off\n\n    :catch_off\n    return-void\n" + m.group(3)
            source, _ = re.subn(pat1, rep1, source, flags=re.S)

            pat2 = r"(\.method public final writeLogpersistOption\(Ljava/lang/Object;Z\)V\n)(.*?)(\.end method)"
            def rep2(m):
                body = m.group(2)
                return m.group(1) + "    :try_start_write\n" + body + "\n    :try_end_write\n    .catch Ljava/lang/Throwable; {:try_start_write .. :try_end_write} :catch_write\n\n    :catch_write\n    return-void\n" + m.group(3)
            source, _ = re.subn(pat2, rep2, source, flags=re.S)
            controller_path.write_text(source, encoding="utf-8")
            print("  + Patched AbstractLogpersistPreferenceController.smali (Developer Settings crash fix)")

    
    # 18. Patch Utils.getResourceId to return 0 instead of throwing NotFoundException
    for utils_path in decoded.glob("smali*/io/mesalabs/unica/utils/Utils.smali"):
        source = utils_path.read_text(encoding="utf-8")
        pat = r"(:cond_0\s*\n\s*)new-instance v0, Landroid/content/res/Resources;.*?throw v0"
        rep = r"\1const/4 v0, 0x0\n    return v0"
        new_source, count = re.subn(pat, rep, source, flags=re.S)
        if count:
            utils_path.write_text(new_source, encoding="utf-8")
            print("  + Patched Utils.getResourceId (prevent NotFoundException)")

    print("[+] prepare.py: OneROM Zeta 9.5 SecSettings customization completed successfully")


if __name__ == "__main__":
    prepare(Path(sys.argv[1]), Path(sys.argv[2]))
