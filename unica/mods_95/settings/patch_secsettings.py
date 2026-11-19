#!/usr/bin/env python3
import os
import re
import sys
from pathlib import Path

apk_dir = Path(sys.argv[1]) if len(sys.argv) > 1 else Path(".")

print(f"- Applying OneROM Zeta 9.5 SecSettings smali patches to {apk_dir}")

# 1. OneROMHelper & listeners
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

.method public static addCategory(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;)Landroidx/preference/PreferenceCategory;
    .locals 1

    new-instance v0, Landroidx/preference/PreferenceCategory;
    invoke-direct {v0, p1}, Landroidx/preference/PreferenceCategory;-><init>(Landroid/content/Context;)V
    invoke-virtual {v0, p2}, Landroidx/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V
    invoke-virtual {p0, v0}, Landroidx/preference/PreferenceGroup;->addPreference(Landroidx/preference/Preference;)Z
    return-object v0
.end method

.method public static addPreference(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroidx/preference/Preference$OnPreferenceClickListener;)Landroidx/preference/Preference;
    .locals 1

    new-instance v0, Landroidx/preference/Preference;
    invoke-direct {v0, p1}, Landroidx/preference/Preference;-><init>(Landroid/content/Context;)V
    invoke-virtual {v0, p2}, Landroidx/preference/Preference;->setKey(Ljava/lang/String;)V
    invoke-virtual {v0, p3}, Landroidx/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V
    invoke-virtual {v0, p4}, Landroidx/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V
    if-eqz p5, :cond_0
    invoke-virtual {v0, p5}, Landroidx/preference/Preference;->setOnPreferenceClickListener(Landroidx/preference/Preference$OnPreferenceClickListener;)V
    :cond_0
    invoke-virtual {p0, v0}, Landroidx/preference/PreferenceGroup;->addPreference(Landroidx/preference/Preference;)Z
    return-object v0
.end method

.method public static addSwitch(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 3

    new-instance v0, Landroidx/preference/SecSwitchPreference;
    invoke-direct {v0, p1}, Landroidx/preference/SecSwitchPreference;-><init>(Landroid/content/Context;)V
    invoke-virtual {v0, p2}, Landroidx/preference/Preference;->setKey(Ljava/lang/String;)V
    invoke-virtual {v0, p3}, Landroidx/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V
    invoke-virtual {v0, p4}, Landroidx/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;
    move-result-object p3
    invoke-static {p3, p2, p5}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I
    move-result p3
    if-eqz p3, :cond_0
    const/4 p3, 0x1
    goto :goto_chk
    :cond_0
    const/4 p3, 0x0
    :goto_chk
    invoke-virtual {v0, p3}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    new-instance p3, Lcom/android/settings/OneROMHelper$SwitchChangeListener;
    invoke-direct {p3, p1, p2}, Lcom/android/settings/OneROMHelper$SwitchChangeListener;-><init>(Landroid/content/Context;Ljava/lang/String;)V
    invoke-virtual {v0, p3}, Landroidx/preference/Preference;->setOnPreferenceChangeListener(Landroidx/preference/Preference$OnPreferenceChangeListener;)V

    invoke-virtual {p0, v0}, Landroidx/preference/PreferenceGroup;->addPreference(Landroidx/preference/Preference;)Z
    return-void
.end method

.method public static initBanner(Landroidx/preference/PreferenceFragmentCompat;)V
    .locals 2

    if-nez p0, :cond_0
    return-void

    :cond_0
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;
    move-result-object v0
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;
    move-result-object v1
    invoke-static {v0, v1}, Lcom/android/settings/OneROMHelper;->initSoftwareBanner(Landroidx/preference/PreferenceScreen;Landroid/content/Context;)V
    return-void
.end method

.method public static initSoftwareBanner(Landroidx/preference/PreferenceScreen;Landroid/content/Context;)V
    .locals 6

    if-eqz p0, :cond_0
    if-nez p1, :cond_1
    :cond_0
    return-void

    :cond_1
    const-string v2, "onerom_software_banner"
    invoke-virtual {p0, v2}, Landroidx/preference/PreferenceGroup;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;
    move-result-object v0
    if-eqz v0, :cond_2
    return-void

    :cond_2
    const-string v3, "OneROM Zeta 9.5"
    const-string v4, "Android 17 QPR2 \u2022 Exynos 9820 \u2022 OneKernel-9.5+"
    new-instance v5, Lcom/android/settings/OneROMHelper$TopLevelClickListener;
    invoke-direct {v5, p1}, Lcom/android/settings/OneROMHelper$TopLevelClickListener;-><init>(Landroid/content/Context;)V
    move-object v0, p0
    move-object v1, p1
    invoke-static/range {v0 .. v5}, Lcom/android/settings/OneROMHelper;->addPreference(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroidx/preference/Preference$OnPreferenceClickListener;)Landroidx/preference/Preference;
    move-result-object v0
    const/16 v1, -0x3e8
    invoke-virtual {v0, v1}, Landroidx/preference/Preference;->setOrder(I)V
    return-void
.end method

.method public static initTopLevel(Landroidx/preference/PreferenceFragmentCompat;)V
    .locals 5

    if-nez p0, :cond_0
    return-void

    :cond_0
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;
    move-result-object v0
    if-nez v0, :cond_1
    return-void

    :cond_1
    const-string v1, "top_level_onerom"
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
    new-instance v3, Lcom/android/settings/widget/HomepagePreference;
    invoke-direct {v3, v2}, Lcom/android/settings/widget/HomepagePreference;-><init>(Landroid/content/Context;)V
    invoke-virtual {v3, v1}, Landroidx/preference/Preference;->setKey(Ljava/lang/String;)V
    const-string v1, "OneROM features"
    invoke-virtual {v3, v1}, Landroidx/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V
    const-string v1, "OneROM Zeta 9.5"
    invoke-virtual {v3, v1}, Landroidx/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    const-string v1, "top_level_advanced_features"
    invoke-virtual {v0, v1}, Landroidx/preference/PreferenceGroup;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;
    move-result-object v1
    if-eqz v1, :cond_4
    invoke-virtual {v1}, Landroidx/preference/Preference;->getOrder()I
    move-result v4
    add-int/lit8 v4, v4, 0x1
    invoke-virtual {v3, v4}, Landroidx/preference/Preference;->setOrder(I)V
    invoke-virtual {v1}, Landroidx/preference/Preference;->getIcon()Landroid/graphics/drawable/Drawable;
    move-result-object v1
    if-eqz v1, :cond_5
    invoke-virtual {v3, v1}, Landroidx/preference/Preference;->setIcon(Landroid/graphics/drawable/Drawable;)V
    goto :goto_click

    :cond_4
    const v4, -0x9c3f
    invoke-virtual {v3, v4}, Landroidx/preference/Preference;->setOrder(I)V

    :goto_click
    :cond_5
    new-instance v1, Lcom/android/settings/OneROMHelper$TopLevelClickListener;
    invoke-direct {v1, v2}, Lcom/android/settings/OneROMHelper$TopLevelClickListener;-><init>(Landroid/content/Context;)V
    invoke-virtual {v3, v1}, Landroidx/preference/Preference;->setOnPreferenceClickListener(Landroidx/preference/Preference$OnPreferenceClickListener;)V

    invoke-virtual {v0, v3}, Landroidx/preference/PreferenceGroup;->addPreference(Landroidx/preference/Preference;)Z
    return-void
.end method

.method public static buildUnicaScreen(Landroidx/preference/PreferenceFragmentCompat;)V
    .locals 8

    if-nez p0, :cond_0
    return-void

    :cond_0
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;
    move-result-object v1
    if-nez v1, :cond_1
    return-void

    :cond_1
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;
    move-result-object v0
    if-nez v0, :cond_2
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceManager()Landroidx/preference/PreferenceManager;
    move-result-object v0
    invoke-virtual {v0, v1}, Landroidx/preference/PreferenceManager;->createPreferenceScreen(Landroid/content/Context;)Landroidx/preference/PreferenceScreen;
    move-result-object v0
    invoke-virtual {p0, v0}, Landroidx/preference/PreferenceFragmentCompat;->setPreferenceScreen(Landroidx/preference/PreferenceScreen;)V

    :cond_2
    invoke-virtual {v0}, Landroidx/preference/PreferenceGroup;->removeAll()V

    const-string v2, "onerom_banner_header"
    const-string v3, "OneROM Zeta 9.5"
    const-string v4, "Android 17 QPR2 \u2022 Exynos 9820 \u2022 OneKernel-9.5+"
    new-instance v5, Lcom/android/settings/OneROMHelper$DialogClickListener;
    invoke-direct {v5, v1}, Lcom/android/settings/OneROMHelper$DialogClickListener;-><init>(Landroid/content/Context;)V
    invoke-static/range {v0 .. v5}, Lcom/android/settings/OneROMHelper;->addPreference(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroidx/preference/Preference$OnPreferenceClickListener;)Landroidx/preference/Preference;
    move-result-object v2
    const/16 v3, -0x3e8
    invoke-virtual {v2, v3}, Landroidx/preference/Preference;->setOrder(I)V

    const-string v2, "Privacy & Identity"
    invoke-static {v0, v1, v2}, Lcom/android/settings/OneROMHelper;->addCategory(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;)Landroidx/preference/PreferenceCategory;
    move-result-object v6

    const-string v2, "onerom_show_imei"
    const-string v3, "Show IMEI"
    const-string v4, "Show real IMEI or mask with ********"
    const/4 v5, 0x0
    move-object v0, v6
    invoke-static/range {v0 .. v5}, Lcom/android/settings/OneROMHelper;->addSwitch(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v2, "onerom_show_serial"
    const-string v3, "Show serial number"
    const-string v4, "Show real serial or mask with ********"
    const/4 v5, 0x0
    invoke-static/range {v0 .. v5}, Lcom/android/settings/OneROMHelper;->addSwitch(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;
    move-result-object v0
    const-string v2, "System & UI"
    invoke-static {v0, v1, v2}, Lcom/android/settings/OneROMHelper;->addCategory(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;)Landroidx/preference/PreferenceCategory;
    move-result-object v6

    const-string v2, "onerom_live_blur"
    const-string v3, "Live blur"
    const-string v4, "Enable real-time background blur effects"
    const/4 v5, 0x1
    move-object v0, v6
    invoke-static/range {v0 .. v5}, Lcom/android/settings/OneROMHelper;->addSwitch(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v2, "onerom_boot_sound"
    const-string v3, "Boot sound"
    const-string v4, "Play startup chime when device powers on"
    const/4 v5, 0x0
    invoke-static/range {v0 .. v5}, Lcom/android/settings/OneROMHelper;->addSwitch(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v2, "onerom_aod_wallpaper"
    const-string v3, "AOD wallpaper"
    const-string v4, "Display wallpaper background on Always On Display"
    const/4 v5, 0x1
    invoke-static/range {v0 .. v5}, Lcom/android/settings/OneROMHelper;->addSwitch(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;
    move-result-object v0
    const-string v2, "Spoofing & Gaming"
    invoke-static {v0, v1, v2}, Lcom/android/settings/OneROMHelper;->addCategory(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;)Landroidx/preference/PreferenceCategory;
    move-result-object v6

    const-string v2, "onerom_gphotos_spoof"
    const-string v3, "Google Photos Unlimited"
    const-string v4, "Spoof Pixel XL for unlimited full-resolution photo backup"
    const/4 v5, 0x1
    move-object v0, v6
    invoke-static/range {v0 .. v5}, Lcom/android/settings/OneROMHelper;->addSwitch(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v2, "onerom_game_props"
    const-string v3, "Unlock high FPS in games"
    const-string v4, "Unlock 90/120 FPS options in supported gaming titles"
    const/4 v5, 0x1
    invoke-static/range {v0 .. v5}, Lcom/android/settings/OneROMHelper;->addSwitch(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v2, "onerom_hide_dev"
    const-string v3, "Hide developer status"
    const-string v4, "Prevent apps from detecting Developer Options or ADB"
    const/4 v5, 0x0
    invoke-static/range {v0 .. v5}, Lcom/android/settings/OneROMHelper;->addSwitch(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v2, "onerom_pif_info"
    const-string v3, "Play Integrity (PIF)"
    const-string v4, "Device spoofing active: BASIC + DEVICE verdicts passed"
    new-instance v5, Lcom/android/settings/OneROMHelper$ToastClickListener;
    const-string v7, "Play Integrity: Passed (Pixel 9 Pro Spoofing Active)"
    invoke-direct {v5, v1, v7}, Lcom/android/settings/OneROMHelper$ToastClickListener;-><init>(Landroid/content/Context;Ljava/lang/String;)V
    invoke-static/range {v0 .. v5}, Lcom/android/settings/OneROMHelper;->addPreference(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroidx/preference/Preference$OnPreferenceClickListener;)Landroidx/preference/Preference;

    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;
    move-result-object v0
    const-string v2, "Hardware & Buttons"
    invoke-static {v0, v1, v2}, Lcom/android/settings/OneROMHelper;->addCategory(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;)Landroidx/preference/PreferenceCategory;
    move-result-object v6

    const-string v2, "onerom_bixby_action"
    const-string v3, "Bixby key"
    const-string v4, "Hardware key 703 configured as USER WAKE"
    new-instance v5, Lcom/android/settings/OneROMHelper$ToastClickListener;
    const-string v7, "Bixby button is configured as wake key"
    invoke-direct {v5, v1, v7}, Lcom/android/settings/OneROMHelper$ToastClickListener;-><init>(Landroid/content/Context;Ljava/lang/String;)V
    move-object v0, v6
    invoke-static/range {v0 .. v5}, Lcom/android/settings/OneROMHelper;->addPreference(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroidx/preference/Preference$OnPreferenceClickListener;)Landroidx/preference/Preference;

    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;
    move-result-object v0
    const-string v2, "Advanced Reboot"
    invoke-static {v0, v1, v2}, Lcom/android/settings/OneROMHelper;->addCategory(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;)Landroidx/preference/PreferenceCategory;
    move-result-object v6

    const-string v2, "onerom_reboot_recovery"
    const-string v3, "Reboot to Recovery"
    const-string v4, "Reboot device directly into TWRP recovery"
    new-instance v5, Lcom/android/settings/OneROMHelper$RebootClickListener;
    const-string v7, "recovery"
    invoke-direct {v5, v1, v7}, Lcom/android/settings/OneROMHelper$RebootClickListener;-><init>(Landroid/content/Context;Ljava/lang/String;)V
    move-object v0, v6
    invoke-static/range {v0 .. v5}, Lcom/android/settings/OneROMHelper;->addPreference(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroidx/preference/Preference$OnPreferenceClickListener;)Landroidx/preference/Preference;

    const-string v2, "onerom_reboot_download"
    const-string v3, "Reboot to Download Mode"
    const-string v4, "Reboot device into Odin download mode"
    new-instance v5, Lcom/android/settings/OneROMHelper$RebootClickListener;
    const-string v7, "download"
    invoke-direct {v5, v1, v7}, Lcom/android/settings/OneROMHelper$RebootClickListener;-><init>(Landroid/content/Context;Ljava/lang/String;)V
    invoke-static/range {v0 .. v5}, Lcom/android/settings/OneROMHelper;->addPreference(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroidx/preference/Preference$OnPreferenceClickListener;)Landroidx/preference/Preference;

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

(helper_dir / "OneROMHelper$SwitchChangeListener.smali").write_text("""
.class public final Lcom/android/settings/OneROMHelper$SwitchChangeListener;
.super Ljava/lang/Object;
.implements Landroidx/preference/Preference$OnPreferenceChangeListener;

.field public final mContext:Landroid/content/Context;
.field public final mKey:Ljava/lang/String;

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/android/settings/OneROMHelper$SwitchChangeListener;->mContext:Landroid/content/Context;
    iput-object p2, p0, Lcom/android/settings/OneROMHelper$SwitchChangeListener;->mKey:Ljava/lang/String;
    return-void
.end method

.method public onPreferenceChange(Landroidx/preference/Preference;Ljava/lang/Object;)Z
    .locals 2

    instance-of p1, p2, Ljava/lang/Boolean;
    if-eqz p1, :cond_0

    check-cast p2, Ljava/lang/Boolean;
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z
    move-result p1
    goto :goto_val

    :cond_0
    const/4 p1, 0x0

    :goto_val
    iget-object p2, p0, Lcom/android/settings/OneROMHelper$SwitchChangeListener;->mContext:Landroid/content/Context;
    if-eqz p2, :cond_1
    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;
    move-result-object p2
    iget-object p0, p0, Lcom/android/settings/OneROMHelper$SwitchChangeListener;->mKey:Ljava/lang/String;
    invoke-static {p2, p0, p1}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    :cond_1
    const/4 p0, 0x1
    return p0
.end method
""")

(helper_dir / "OneROMHelper$TopLevelClickListener.smali").write_text("""
.class public final Lcom/android/settings/OneROMHelper$TopLevelClickListener;
.super Ljava/lang/Object;
.implements Landroidx/preference/Preference$OnPreferenceClickListener;

.field public final val$context:Landroid/content/Context;

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/android/settings/OneROMHelper$TopLevelClickListener;->val$context:Landroid/content/Context;
    return-void
.end method

.method public onPreferenceClick(Landroidx/preference/Preference;)Z
    .locals 3
    iget-object p1, p0, Lcom/android/settings/OneROMHelper$TopLevelClickListener;->val$context:Landroid/content/Context;
    if-eqz p1, :cond_0

    new-instance v0, Landroid/content/Intent;
    const-class v1, Lcom/android/settings/SubSettings;
    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, ":settings:show_fragment"
    const-string v2, "io.mesalabs.unica.settings.UnicaSettingsFragment"
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, ":settings:show_fragment_title"
    const-string v2, "OneROM features"
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/high16 v1, 0x10000000
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    :cond_0
    const/4 p0, 0x1
    return p0
.end method
""")

(helper_dir / "OneROMHelper$DialogClickListener.smali").write_text("""
.class public final Lcom/android/settings/OneROMHelper$DialogClickListener;
.super Ljava/lang/Object;
.implements Landroidx/preference/Preference$OnPreferenceClickListener;

.field public final val$context:Landroid/content/Context;

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/android/settings/OneROMHelper$DialogClickListener;->val$context:Landroid/content/Context;
    return-void
.end method

.method public onPreferenceClick(Landroidx/preference/Preference;)Z
    .locals 0
    iget-object p1, p0, Lcom/android/settings/OneROMHelper$DialogClickListener;->val$context:Landroid/content/Context;
    invoke-static {p1}, Lcom/android/settings/OneROMHelper;->showDialog(Landroid/content/Context;)V
    const/4 p0, 0x1
    return p0
.end method
""")

(helper_dir / "OneROMHelper$ToastClickListener.smali").write_text("""
.class public final Lcom/android/settings/OneROMHelper$ToastClickListener;
.super Ljava/lang/Object;
.implements Landroidx/preference/Preference$OnPreferenceClickListener;

.field public final mContext:Landroid/content/Context;
.field public final mMessage:Ljava/lang/String;

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/android/settings/OneROMHelper$ToastClickListener;->mContext:Landroid/content/Context;
    iput-object p2, p0, Lcom/android/settings/OneROMHelper$ToastClickListener;->mMessage:Ljava/lang/String;
    return-void
.end method

.method public onPreferenceClick(Landroidx/preference/Preference;)Z
    .locals 2
    iget-object p1, p0, Lcom/android/settings/OneROMHelper$ToastClickListener;->mContext:Landroid/content/Context;
    if-eqz p1, :cond_0
    iget-object p0, p0, Lcom/android/settings/OneROMHelper$ToastClickListener;->mMessage:Ljava/lang/String;
    const/4 v0, 0x0
    invoke-static {p1, p0, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    move-result-object p0
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V
    :cond_0
    const/4 p0, 0x1
    return p0
.end method
""")

(helper_dir / "OneROMHelper$RebootClickListener.smali").write_text("""
.class public final Lcom/android/settings/OneROMHelper$RebootClickListener;
.super Ljava/lang/Object;
.implements Landroidx/preference/Preference$OnPreferenceClickListener;

.field public final mContext:Landroid/content/Context;
.field public final mMode:Ljava/lang/String;

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/android/settings/OneROMHelper$RebootClickListener;->mContext:Landroid/content/Context;
    iput-object p2, p0, Lcom/android/settings/OneROMHelper$RebootClickListener;->mMode:Ljava/lang/String;
    return-void
.end method

.method public onPreferenceClick(Landroidx/preference/Preference;)Z
    .locals 2

    iget-object p1, p0, Lcom/android/settings/OneROMHelper$RebootClickListener;->mContext:Landroid/content/Context;
    if-nez p1, :cond_0
    const/4 p0, 0x1
    return p0

    :cond_0
    const-string/jumbo v0, "power"
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object p1
    check-cast p1, Landroid/os/PowerManager;
    if-eqz p1, :cond_1
    iget-object p0, p0, Lcom/android/settings/OneROMHelper$RebootClickListener;->mMode:Ljava/lang/String;
    invoke-virtual {p1, p0}, Landroid/os/PowerManager;->reboot(Ljava/lang/String;)V

    :cond_1
    const/4 p0, 0x1
    return p0
.end method
""")
print("  + Injected OneROMHelper and all preference listeners into SecSettings smali")

# 2. TopLevelSettings hook (adds OneROM features on main Settings home screen)
for top_file in apk_dir.glob("**/TopLevelSettings.smali"):
    top_txt = top_file.read_text(encoding="utf-8")
    if "initTopLevel" not in top_txt:
        pattern = r"(\.method public final onStart\(\)V.*?)(return-void\s*\n\.end method)"
        replacement = r"\1invoke-static/range {p0 .. p0}, Lcom/android/settings/OneROMHelper;->initTopLevel(Landroidx/preference/PreferenceFragmentCompat;)V\n\n    \2"
        top_txt, count = re.subn(pattern, replacement, top_txt, count=1, flags=re.S)
        if count > 0:
            top_file.write_text(top_txt, encoding="utf-8")
            print(f"  + Added OneROM features hook to {top_file.name}")
        else:
            print(f"  [!] Warning: onStart return-void not found in {top_file.name}")

# 3. OneUIVersionPreferenceController hook (adds OneROM banner at top of Software information)
for oneui_file in apk_dir.glob("**/OneUIVersionPreferenceController.smali"):
    oneui_txt = oneui_file.read_text(encoding="utf-8")
    if "initSoftwareBanner" not in oneui_txt:
        disp_method = """
.method public displayPreference(Landroidx/preference/PreferenceScreen;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/android/settings/core/BasePreferenceController;->displayPreference(Landroidx/preference/PreferenceScreen;)V

    iget-object v0, p0, Lcom/android/settingslib/core/AbstractPreferenceController;->mContext:Landroid/content/Context;

    invoke-static {p1, v0}, Lcom/android/settings/OneROMHelper;->initSoftwareBanner(Landroidx/preference/PreferenceScreen;Landroid/content/Context;)V

    return-void
.end method
"""
        oneui_txt = oneui_txt.rstrip() + "\n" + disp_method + "\n"
        oneui_file.write_text(oneui_txt, encoding="utf-8")
        print(f"  + Added initSoftwareBanner displayPreference hook to {oneui_file.name}")

# 4. SoftwareInfoSettings hook
for soft_file in apk_dir.glob("**/SoftwareInfoSettings.smali"):
    soft_txt = soft_file.read_text(encoding="utf-8")
    if "OneROMHelper" not in soft_txt:
        soft_txt = soft_txt.replace(
            "invoke-super {p0}, Lcom/android/settings/dashboard/DashboardFragment;->onStart()V",
            "invoke-super {p0}, Lcom/android/settings/dashboard/DashboardFragment;->onStart()V\n\n    invoke-static {p0}, Lcom/android/settings/OneROMHelper;->initBanner(Landroidx/preference/PreferenceFragmentCompat;)V"
        )
        soft_file.write_text(soft_txt, encoding="utf-8")
        print(f"  + Added OneROM banner hook to {soft_file.name}")

# 5. UnicaSettingsFragment hook (programmatic screen generation)
for unica_file in apk_dir.glob("**/UnicaSettingsFragment.smali"):
    unica_txt = unica_file.read_text(encoding="utf-8")
    # Return 0 for preference screen res ID to bypass XML inflation
    res_pat = r"\.method public getPreferenceScreenResId\(\)I.*?\n\.end method"
    res_rep = """.method public getPreferenceScreenResId()I
    .locals 1
    const/4 v0, 0x0
    return v0
.end method"""
    unica_txt = re.sub(res_pat, res_rep, unica_txt, flags=re.S)

    # Add onViewCreated calling buildUnicaScreen
    if "buildUnicaScreen" not in unica_txt:
        view_created = """
.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1, p2}, Lcom/android/settings/dashboard/DashboardFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    invoke-static {p0}, Lcom/android/settings/OneROMHelper;->buildUnicaScreen(Landroidx/preference/PreferenceFragmentCompat;)V

    return-void
.end method
"""
        unica_txt = unica_txt.rstrip() + "\n" + view_created + "\n"
    unica_file.write_text(unica_txt, encoding="utf-8")
    print(f"  + Configured programmatic UI generation in {unica_file.name}")

# 6. Rune.smali (disable S Pen, Private Display, and High Refresh Rate)
for rune_file in apk_dir.glob("**/Rune.smali"):
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
    rune_txt = re.sub(
        r"\.method public static isSupportSpen\(\)Z.*?\n\.end method",
        ".method public static isSupportSpen()Z\n    .locals 1\n\n    const/4 v0, 0x0\n\n    return v0\n.end method",
        rune_txt, flags=re.S
    )
    rune_file.write_text(rune_txt, encoding="utf-8")
    print(f"  + Patched Rune.smali (disabled S Pen, PD, and HighRefreshRate) in {rune_file.parent.name}")

# 7. SecTopLevelAboutDevicePreferenceController
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

# 8. ScreenResolutionFragment (ensure 1520x720, 2280x1080, 3040x1440 dimension labels)
for res_file in apk_dir.glob("**/ScreenResolutionFragment.smali"):
    res_txt = res_file.read_text(encoding="utf-8")
    old_code = "iget p1, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mScreenResolution:I\\n\\n    const/4 v3, 0x3\\n\\n    const/4 v4, 0x2\\n\\n    if-eq p1, v1, :cond_6"
    new_code = "const/4 p1, 0x2\\n\\n    const/4 v3, 0x3\\n\\n    const/4 v4, 0x2\\n\\n    if-eq p1, v1, :cond_6"
    if old_code in res_txt:
        res_txt = res_txt.replace(old_code, new_code)
        res_file.write_text(res_txt, encoding="utf-8")
        print(f"  + Patched ScreenResolutionFragment (enforced WQHD+ dimension calculation) in {res_file.name}")

print("- OneROM Zeta 9.5 SecSettings smali patches completed successfully")
