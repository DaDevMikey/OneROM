#!/usr/bin/env python3
import os
import re
import sys
from pathlib import Path

apk_dir = Path(sys.argv[1]) if len(sys.argv) > 1 else Path(".")

print(f"- Applying OneROM Zeta 9.5 SecSettings smali patches to {apk_dir}")

# 1. OneROMHelper.smali & OneROMHelper$1.smali
target_smali = apk_dir / "smali_classes3"
if not target_smali.is_dir():
    target_smali = apk_dir / "smali"
helper_dir = target_smali / "com/android/settings"
helper_dir.mkdir(parents=True, exist_ok=True)

(helper_dir / "OneROMHelper.smali").write_text("""
.class public Lcom/android/settings/OneROMHelper;
.super Ljava/lang/Object;

.method public constructor <init>()V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static initBanner(Landroidx/preference/PreferenceFragmentCompat;)V
    .locals 5

    if-nez p0, :cond_0
    return-void

    :cond_0
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;
    move-result-object v0
    if-nez v0, :cond_1
    return-void

    :cond_1
    const-string v1, "onerom_banner"
    invoke-virtual {v0, v1}, Landroidx/preference/PreferenceGroup;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;
    move-result-object v2
    if-eqz v2, :cond_2
    return-void

    :cond_2
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;
    move-result-object v2
    if-nez v2, :cond_3
    return-void

    :cond_3
    new-instance v3, Landroidx/preference/Preference;
    invoke-direct {v3, v2}, Landroidx/preference/Preference;-><init>(Landroid/content/Context;)V
    invoke-virtual {v3, v1}, Landroidx/preference/Preference;->setKey(Ljava/lang/String;)V
    const-string v1, "OneROM Zeta 9.5"
    invoke-virtual {v3, v1}, Landroidx/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V
    const-string v1, "Android 17 QPR2 \u2022 Exynos 9820 \u2022 OneKernel-9.5+"
    invoke-virtual {v3, v1}, Landroidx/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V
    const/16 v1, -0x3e8
    invoke-virtual {v3, v1}, Landroidx/preference/Preference;->setOrder(I)V
    new-instance v1, Lcom/android/settings/OneROMHelper$1;
    invoke-direct {v1, v2}, Lcom/android/settings/OneROMHelper$1;-><init>(Landroid/content/Context;)V
    invoke-virtual {v3, v1}, Landroidx/preference/Preference;->setOnPreferenceClickListener(Landroidx/preference/Preference$OnPreferenceClickListener;)V
    invoke-virtual {v0, v3}, Landroidx/preference/PreferenceGroup;->addPreference(Landroidx/preference/Preference;)Z
    return-void
.end method

.method public static showDialog(Landroid/content/Context;)V
    .locals 3

    if-nez p0, :cond_0
    return-void

    :cond_0
    new-instance v0, Landroid/app/AlertDialog$Builder;
    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V
    const-string v1, "OneROM Zeta 9.5"
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;
    const-string v1, "Version: 9.5.0.1 (Zeta)\\nAndroid: 17 QPR2\\nOne UI: 9.5\\nKernel: OneKernel-9.5+ (4.14.356)\\nMaintainer: Mikey\\nStatus: Official Beta Release\\nHardware: Samsung Exynos 9820"
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;
    const-string v1, "OK"
    const/4 v2, 0x0
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;
    return-void
.end method
""")

(helper_dir / "OneROMHelper$1.smali").write_text("""
.class public final Lcom/android/settings/OneROMHelper$1;
.super Ljava/lang/Object;
.implements Landroidx/preference/Preference$OnPreferenceClickListener;

.field public final synthetic val$context:Landroid/content/Context;

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/android/settings/OneROMHelper$1;->val$context:Landroid/content/Context;
    return-void
.end method

.method public onPreferenceClick(Landroidx/preference/Preference;)Z
    .locals 0
    iget-object p1, p0, Lcom/android/settings/OneROMHelper$1;->val$context:Landroid/content/Context;
    invoke-static {p1}, Lcom/android/settings/OneROMHelper;->showDialog(Landroid/content/Context;)V
    const/4 p0, 0x1
    return p0
.end method
""")
print("  + Injected OneROMHelper and dialog controller")

# 2. BatteryRegulatoryPreferenceController & BatteryInfoUtils
for bat_file in apk_dir.glob("**/BatteryRegulatoryPreferenceController.smali"):
    bat_txt = bat_file.read_text(encoding="utf-8")
    bat_txt = re.sub(
        r"\.method public getAvailabilityStatus\(\)I.*?\n\.end method",
        ".method public getAvailabilityStatus()I\n    .locals 0\n\n    const/4 p0, 0x0\n\n    return p0\n.end method",
        bat_txt, flags=re.S
    )
    bat_file.write_text(bat_txt, encoding="utf-8")
    print(f"  + Patched BatteryRegulatoryPreferenceController in {bat_file.parent.name}")

for util_file in apk_dir.glob("**/BatteryInfoUtils.smali"):
    util_txt = util_file.read_text(encoding="utf-8")
    util_txt = re.sub(
        r"\.method public static isAvailableBatteryRegulatory\(Landroid/content/Context;\)Z.*?\n\.end method",
        ".method public static isAvailableBatteryRegulatory(Landroid/content/Context;)Z\n    .locals 1\n\n    const/4 v0, 0x1\n\n    return v0\n.end method",
        util_txt, flags=re.S
    )
    util_file.write_text(util_txt, encoding="utf-8")
    print(f"  + Patched BatteryInfoUtils in {util_file.parent.name}")

# 3. Rune.smali
for rune_file in apk_dir.glob("**/com/samsung/android/settings/Rune.smali"):
    rune_txt = rune_file.read_text(encoding="utf-8")
    rune_txt = re.sub(
        r"\.method public static supportPDSettings\(Landroid/content/Context;\)Z.*?\n\.end method",
        ".method public static supportPDSettings(Landroid/content/Context;)Z\n    .locals 1\n\n    const/4 p0, 0x0\n\n    return p0\n.end method",
        rune_txt, flags=re.S
    )
    rune_txt = re.sub(
        r"\.method public static supportHighRefreshRate\(Landroid/content/Context;I\)Z.*?\n\.end method",
        ".method public static supportHighRefreshRate(Landroid/content/Context;I)Z\n    .locals 0\n\n    const/4 p0, 0x0\n\n    return p0\n.end method",
        rune_txt, flags=re.S
    )
    rune_file.write_text(rune_txt, encoding="utf-8")
    print(f"  + Patched Rune.smali (disabled PD and HighRefreshRate) in {rune_file.parent.name}")

# 4. SecTopLevelAboutDevicePreferenceController
for about_file in apk_dir.glob("**/SecTopLevelAboutDevicePreferenceController.smali"):
    about_txt = about_file.read_text(encoding="utf-8")
    if "handlePreferenceTreeClick" not in about_txt:
        about_patch = """
.field private static mLastClickTime:J
.field private static mClickCount:I

.method public handlePreferenceTreeClick(Landroidx/preference/Preference;)Z
    .locals 7

    invoke-virtual {p1}, Landroidx/preference/Preference;->getKey()Ljava/lang/String;
    move-result-object v0
    invoke-virtual {p0}, Lcom/android/settings/core/BasePreferenceController;->getPreferenceKey()Ljava/lang/String;
    move-result-object v1
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z
    move-result v0
    if-eqz v0, :cond_normal

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    sget-wide v3, Lcom/samsung/android/settings/deviceinfo/aboutphone/SecTopLevelAboutDevicePreferenceController;->mLastClickTime:J
    sub-long v3, v1, v3
    const-wide/16 v5, 0x258
    cmp-long v3, v3, v5
    if-gez v3, :cond_reset

    sget v3, Lcom/samsung/android/settings/deviceinfo/aboutphone/SecTopLevelAboutDevicePreferenceController;->mClickCount:I
    const/4 v4, 0x1
    add-int/2addr v3, v4
    sput v3, Lcom/samsung/android/settings/deviceinfo/aboutphone/SecTopLevelAboutDevicePreferenceController;->mClickCount:I
    const/4 v4, 0x2
    if-lt v3, v4, :cond_done

    const/4 v3, 0x0
    sput v3, Lcom/samsung/android/settings/deviceinfo/aboutphone/SecTopLevelAboutDevicePreferenceController;->mClickCount:I
    iget-object v0, p0, Lcom/android/settingslib/core/AbstractPreferenceController;->mContext:Landroid/content/Context;
    invoke-static {v0}, Lcom/android/settings/OneROMHelper;->showDialog(Landroid/content/Context;)V
    const/4 p0, 0x1
    return p0

    :cond_reset
    const/4 v3, 0x1
    sput v3, Lcom/samsung/android/settings/deviceinfo/aboutphone/SecTopLevelAboutDevicePreferenceController;->mClickCount:I

    :cond_done
    sput-wide v1, Lcom/samsung/android/settings/deviceinfo/aboutphone/SecTopLevelAboutDevicePreferenceController;->mLastClickTime:J

    :cond_normal
    invoke-super {p0, p1}, Lcom/android/settings/core/BasePreferenceController;->handlePreferenceTreeClick(Landroidx/preference/Preference;)Z
    move-result p0
    return p0
.end method
"""
        about_txt = about_txt.rstrip() + "\n" + about_patch + "\n"
        about_file.write_text(about_txt, encoding="utf-8")
        print(f"  + Added handlePreferenceTreeClick to {about_file.name}")

# 5. SoftwareInfoSettings
for soft_file in apk_dir.glob("**/SoftwareInfoSettings.smali"):
    soft_txt = soft_file.read_text(encoding="utf-8")
    if "OneROMHelper" not in soft_txt:
        soft_txt = soft_txt.replace(
            "invoke-super {p0}, Lcom/android/settings/dashboard/DashboardFragment;->onStart()V",
            "invoke-super {p0}, Lcom/android/settings/dashboard/DashboardFragment;->onStart()V\n\n    invoke-static {p0}, Lcom/android/settings/OneROMHelper;->initBanner(Landroidx/preference/PreferenceFragmentCompat;)V"
        )
        soft_file.write_text(soft_txt, encoding="utf-8")
        print(f"  + Added OneROM banner hook to {soft_file.name}")

# 6. ScreenResolutionFragment (ensure 1520x720, 2280x1080, 3040x1440 dimension labels)
for res_file in apk_dir.glob("**/ScreenResolutionFragment.smali"):
    res_txt = res_file.read_text(encoding="utf-8")
    old_code = "iget p1, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mScreenResolution:I\n\n    const/4 v3, 0x3\n\n    const/4 v4, 0x2\n\n    if-eq p1, v1, :cond_6"
    new_code = "const/4 p1, 0x2\n\n    const/4 v3, 0x3\n\n    const/4 v4, 0x2\n\n    if-eq p1, v1, :cond_6"
    if old_code in res_txt:
        res_txt = res_txt.replace(old_code, new_code)
        res_file.write_text(res_txt, encoding="utf-8")
        print(f"  + Patched ScreenResolutionFragment (enforced WQHD+ dimension calculation) in {res_file.name}")

print("- OneROM Zeta 9.5 SecSettings smali patches completed successfully")
