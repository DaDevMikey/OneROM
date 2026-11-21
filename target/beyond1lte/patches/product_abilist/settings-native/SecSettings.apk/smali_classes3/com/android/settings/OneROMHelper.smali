.class public final Lcom/android/settings/OneROMHelper;
.super Ljava/lang/Object;
.source "OneROMHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/settings/OneROMHelper$DialogCallback;
    }
.end annotation


# direct methods
.method static bridge synthetic -$$Nest$smlaunchAppOrToast(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    invoke-static {p0, p1, p2, p3}, Lcom/android/settings/OneROMHelper;->launchAppOrToast(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$smrebootDevice(Landroid/content/Context;Ljava/lang/String;)V
    .registers 2

    invoke-static {p0, p1}, Lcom/android/settings/OneROMHelper;->rebootDevice(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$smsetDeviceName(Landroid/content/Context;Ljava/lang/String;)V
    .registers 2

    invoke-static {p0, p1}, Lcom/android/settings/OneROMHelper;->setDeviceName(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$smshowChoiceDialog(Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;Lcom/android/settings/OneROMHelper$DialogCallback;)V
    .registers 4

    invoke-static {p0, p1, p2, p3}, Lcom/android/settings/OneROMHelper;->showChoiceDialog(Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;Lcom/android/settings/OneROMHelper$DialogCallback;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$smshowTextEditDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/android/settings/OneROMHelper$DialogCallback;)V
    .registers 4

    invoke-static {p0, p1, p2, p3}, Lcom/android/settings/OneROMHelper;->showTextEditDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/android/settings/OneROMHelper$DialogCallback;)V

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addCategory(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;)Landroidx/preference/PreferenceCategory;
    .registers 4

    .line 161
    new-instance v0, Landroidx/preference/PreferenceCategory;

    invoke-direct {v0, p1}, Landroidx/preference/PreferenceCategory;-><init>(Landroid/content/Context;)V

    .line 162
    invoke-virtual {v0, p2}, Landroidx/preference/PreferenceCategory;->setTitle(Ljava/lang/CharSequence;)V

    .line 163
    invoke-virtual {p0, v0}, Landroidx/preference/PreferenceGroup;->addPreference(Landroidx/preference/Preference;)Z

    .line 164
    return-object v0
.end method

.method public static addPreference(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroidx/preference/Preference$OnPreferenceClickListener;)Landroidx/preference/Preference;
    .registers 7

    .line 168
    new-instance v0, Landroidx/preference/Preference;

    invoke-direct {v0, p1}, Landroidx/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 169
    invoke-virtual {v0, p2}, Landroidx/preference/Preference;->setKey(Ljava/lang/String;)V

    .line 170
    invoke-virtual {v0, p3}, Landroidx/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    .line 171
    invoke-virtual {v0, p4}, Landroidx/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 172
    if-eqz p5, :cond_13

    .line 173
    invoke-virtual {v0, p5}, Landroidx/preference/Preference;->setOnPreferenceClickListener(Landroidx/preference/Preference$OnPreferenceClickListener;)V

    .line 175
    :cond_13
    invoke-virtual {p0, v0}, Landroidx/preference/PreferenceGroup;->addPreference(Landroidx/preference/Preference;)Z

    .line 176
    return-object v0
.end method

.method public static addSwitch(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Landroidx/preference/SecSwitchPreference;
    .registers 7

    .line 180
    new-instance v0, Landroidx/preference/SecSwitchPreference;

    invoke-direct {v0, p1}, Landroidx/preference/SecSwitchPreference;-><init>(Landroid/content/Context;)V

    .line 181
    invoke-virtual {v0, p2}, Landroidx/preference/SecSwitchPreference;->setKey(Ljava/lang/String;)V

    .line 182
    invoke-virtual {v0, p3}, Landroidx/preference/SecSwitchPreference;->setTitle(Ljava/lang/CharSequence;)V

    .line 183
    invoke-virtual {v0, p4}, Landroidx/preference/SecSwitchPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 184
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p3

    invoke-static {p3, p2, p5}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result p3

    .line 185
    if-eqz p3, :cond_1a

    const/4 p3, 0x1

    goto :goto_1b

    :cond_1a
    const/4 p3, 0x0

    :goto_1b
    invoke-virtual {v0, p3}, Landroidx/preference/SecSwitchPreference;->setChecked(Z)V

    .line 186
    new-instance p3, Lcom/android/settings/OneROMHelper$2;

    invoke-direct {p3, p1, p2}, Lcom/android/settings/OneROMHelper$2;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v0, p3}, Landroidx/preference/SecSwitchPreference;->setOnPreferenceChangeListener(Landroidx/preference/Preference$OnPreferenceChangeListener;)V

    .line 194
    invoke-virtual {p0, v0}, Landroidx/preference/PreferenceGroup;->addPreference(Landroidx/preference/Preference;)Z

    .line 195
    return-object v0
.end method

.method public static buildExtraScreen(Landroidx/preference/PreferenceFragmentCompat;)V
    .registers 7

    .line 574
    if-nez p0, :cond_3

    return-void

    .line 575
    :cond_3
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 576
    if-nez v1, :cond_a

    return-void

    .line 578
    :cond_a
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object v0

    .line 579
    if-nez v0, :cond_1d

    .line 580
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceManager()Landroidx/preference/PreferenceManager;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroidx/preference/PreferenceManager;->createPreferenceScreen(Landroid/content/Context;)Landroidx/preference/PreferenceScreen;

    move-result-object v0

    .line 581
    invoke-virtual {p0, v0}, Landroidx/preference/PreferenceFragmentCompat;->setPreferenceScreen(Landroidx/preference/PreferenceScreen;)V

    move-object p0, v0

    goto :goto_1e

    .line 579
    :cond_1d
    move-object p0, v0

    .line 583
    :goto_1e
    invoke-virtual {p0}, Landroidx/preference/PreferenceScreen;->removeAll()V

    .line 585
    const-string v0, "Security and privacy"

    invoke-static {p0, v1, v0}, Lcom/android/settings/OneROMHelper;->addCategory(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;)Landroidx/preference/PreferenceCategory;

    move-result-object v0

    .line 586
    const-string v4, "Allow screenshots in banking, DRM, and protected apps"

    const/4 v5, 0x1

    const-string v2, "unica_secure_ss"

    const-string v3, "Allow secure screenshots"

    invoke-static/range {v0 .. v5}, Lcom/android/settings/OneROMHelper;->addSwitch(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Landroidx/preference/SecSwitchPreference;

    .line 587
    const-string v4, "Prevent applications from detecting captured screenshots"

    const-string v2, "unica_ss_detection"

    const-string v3, "Screenshot detection bypass"

    invoke-static/range {v0 .. v5}, Lcom/android/settings/OneROMHelper;->addSwitch(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Landroidx/preference/SecSwitchPreference;

    .line 589
    const-string v0, "App modifications"

    invoke-static {p0, v1, v0}, Lcom/android/settings/OneROMHelper;->addCategory(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;)Landroidx/preference/PreferenceCategory;

    move-result-object v0

    .line 590
    const-string v4, "Allow installing older package versions over newer ones"

    const-string v2, "unica_allow_downgrade"

    const-string v3, "Allow app downgrade"

    invoke-static/range {v0 .. v5}, Lcom/android/settings/OneROMHelper;->addSwitch(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Landroidx/preference/SecSwitchPreference;

    .line 591
    const-string v4, "Allow installing apps targeting legacy Android SDK versions"

    const-string v2, "unica_allow_sdkbypass"

    const-string v3, "App target SDK bypass"

    invoke-static/range {v0 .. v5}, Lcom/android/settings/OneROMHelper;->addSwitch(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Landroidx/preference/SecSwitchPreference;

    .line 592
    const-string v4, "Bypass Samsung App Security verification checks"

    const-string v2, "unica_asks"

    const-string v3, "Bypass Samsung ASKS"

    invoke-static/range {v0 .. v5}, Lcom/android/settings/OneROMHelper;->addSwitch(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Landroidx/preference/SecSwitchPreference;

    .line 593
    const-string v4, "Spoof Pixel XL for unlimited full-resolution backup"

    const-string v2, "unica_gphotos"

    const-string v3, "Google Photos Unlimited"

    invoke-static/range {v0 .. v5}, Lcom/android/settings/OneROMHelper;->addSwitch(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Landroidx/preference/SecSwitchPreference;

    .line 594
    const-string v4, "Unlock 90/120 FPS options in supported gaming titles"

    const-string v2, "unica_games_spoof"

    const-string v3, "Unlock high FPS in games"

    invoke-static/range {v0 .. v5}, Lcom/android/settings/OneROMHelper;->addSwitch(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Landroidx/preference/SecSwitchPreference;

    .line 596
    const-string v0, "Bixby key actions"

    invoke-static {p0, v1, v0}, Lcom/android/settings/OneROMHelper;->addCategory(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;)Landroidx/preference/PreferenceCategory;

    move-result-object v0

    .line 597
    const/4 v2, 0x6

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "Voice assistant"

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-string v3, "Camera"

    const/4 v4, 0x1

    aput-object v3, v2, v4

    const-string v3, "Flashlight"

    const/4 v4, 0x2

    aput-object v3, v2, v4

    const-string v3, "Screenshot"

    const/4 v4, 0x3

    aput-object v3, v2, v4

    const-string v3, "Power menu"

    const/4 v4, 0x4

    aput-object v3, v2, v4

    const-string v3, "Do nothing"

    const/4 v4, 0x5

    aput-object v3, v2, v4

    .line 598
    const-string v3, "onerom_bixby_single_action"

    const-string v4, "Single press"

    invoke-static {v0, v1, v3, v4, v2}, Lcom/android/settings/OneROMHelper;->setupBixbyPref(Landroidx/preference/PreferenceCategory;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 599
    const-string v3, "onerom_bixby_double_action"

    const-string v4, "Double press"

    invoke-static {v0, v1, v3, v4, v2}, Lcom/android/settings/OneROMHelper;->setupBixbyPref(Landroidx/preference/PreferenceCategory;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 600
    const-string v3, "onerom_bixby_hold_action"

    const-string v4, "Long press"

    invoke-static {v0, v1, v3, v4, v2}, Lcom/android/settings/OneROMHelper;->setupBixbyPref(Landroidx/preference/PreferenceCategory;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 602
    const-string v0, "Advanced reboot"

    invoke-static {p0, v1, v0}, Lcom/android/settings/OneROMHelper;->addCategory(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;)Landroidx/preference/PreferenceCategory;

    move-result-object v0

    .line 603
    new-instance v5, Lcom/android/settings/OneROMHelper$25;

    invoke-direct {v5, v1}, Lcom/android/settings/OneROMHelper$25;-><init>(Landroid/content/Context;)V

    const-string v2, "reboot_normal"

    const-string v3, "Normal reboot"

    const-string v4, "Restart device"

    invoke-static/range {v0 .. v5}, Lcom/android/settings/OneROMHelper;->addPreference(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroidx/preference/Preference$OnPreferenceClickListener;)Landroidx/preference/Preference;

    .line 610
    new-instance v5, Lcom/android/settings/OneROMHelper$26;

    invoke-direct {v5, v1}, Lcom/android/settings/OneROMHelper$26;-><init>(Landroid/content/Context;)V

    const-string v2, "reboot_soft"

    const-string v3, "Soft reboot"

    const-string v4, "Restart Android userspace framework"

    invoke-static/range {v0 .. v5}, Lcom/android/settings/OneROMHelper;->addPreference(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroidx/preference/Preference$OnPreferenceClickListener;)Landroidx/preference/Preference;

    .line 617
    new-instance v5, Lcom/android/settings/OneROMHelper$27;

    invoke-direct {v5, v1}, Lcom/android/settings/OneROMHelper$27;-><init>(Landroid/content/Context;)V

    const-string v2, "reboot_recovery"

    const-string v3, "Reboot to Recovery"

    const-string v4, "Reboot device into TWRP recovery"

    invoke-static/range {v0 .. v5}, Lcom/android/settings/OneROMHelper;->addPreference(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroidx/preference/Preference$OnPreferenceClickListener;)Landroidx/preference/Preference;

    .line 624
    new-instance v5, Lcom/android/settings/OneROMHelper$28;

    invoke-direct {v5, v1}, Lcom/android/settings/OneROMHelper$28;-><init>(Landroid/content/Context;)V

    const-string v2, "reboot_download"

    const-string v3, "Reboot to Download Mode"

    const-string v4, "Reboot device into Odin download mode"

    invoke-static/range {v0 .. v5}, Lcom/android/settings/OneROMHelper;->addPreference(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroidx/preference/Preference$OnPreferenceClickListener;)Landroidx/preference/Preference;

    .line 631
    return-void
.end method

.method public static buildSoftwareInfoScreen(Landroidx/preference/PreferenceFragmentCompat;)V
    .registers 12

    .line 230
    if-nez p0, :cond_3

    return-void

    .line 231
    :cond_3
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 232
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object p0

    .line 233
    if-eqz v1, :cond_1c2

    if-nez p0, :cond_11

    goto/16 :goto_1c2

    .line 235
    :cond_11
    const-string v0, "onerom_software_banner"

    invoke-virtual {p0, v0}, Landroidx/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v2

    if-eqz v2, :cond_1a

    return-void

    .line 237
    :cond_1a
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 238
    invoke-virtual {p0}, Landroidx/preference/PreferenceScreen;->getPreferenceCount()I

    move-result v2

    .line 239
    const/4 v8, 0x0

    const/4 v3, 0x0

    :goto_25
    if-ge v3, v2, :cond_3d

    .line 240
    invoke-virtual {p0, v3}, Landroidx/preference/PreferenceScreen;->getPreference(I)Landroidx/preference/Preference;

    move-result-object v4

    .line 241
    if-eqz v4, :cond_3a

    invoke-virtual {v4}, Landroidx/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_3a

    .line 242
    invoke-virtual {v4}, Landroidx/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v7, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 239
    :cond_3a
    add-int/lit8 v3, v3, 0x1

    goto :goto_25

    .line 245
    :cond_3d
    invoke-virtual {p0}, Landroidx/preference/PreferenceScreen;->removeAll()V

    .line 248
    new-instance v6, Lcom/android/settings/OneROMHelper$5;

    invoke-direct {v6, v1}, Lcom/android/settings/OneROMHelper$5;-><init>(Landroid/content/Context;)V

    const/16 v2, 0x4a

    const-string v3, "OneROM Zeta 9.5"

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-static/range {v1 .. v6}, Lcom/android/settings/OneROMHelper;->createBannerView(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;ZLjava/lang/Runnable;)Landroid/view/View;

    move-result-object v2

    .line 254
    new-instance v3, Lcom/android/settingslib/widget/LayoutPreference;

    invoke-direct {v3, v1, v2}, Lcom/android/settingslib/widget/LayoutPreference;-><init>(Landroid/content/Context;Landroid/view/View;)V

    .line 255
    invoke-virtual {v3, v0}, Lcom/android/settingslib/widget/LayoutPreference;->setKey(Ljava/lang/String;)V

    .line 256
    const/16 v0, -0x2710

    invoke-virtual {v3, v0}, Lcom/android/settingslib/widget/LayoutPreference;->setOrder(I)V

    .line 257
    const/4 v9, 0x1

    invoke-virtual {v3, v9}, Lcom/android/settingslib/widget/LayoutPreference;->setSelectable(Z)V

    .line 258
    new-instance v0, Lcom/android/settings/OneROMHelper$6;

    invoke-direct {v0, v1}, Lcom/android/settings/OneROMHelper$6;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, v0}, Lcom/android/settingslib/widget/LayoutPreference;->setOnPreferenceClickListener(Landroidx/preference/Preference$OnPreferenceClickListener;)V

    .line 265
    invoke-virtual {p0, v3}, Landroidx/preference/PreferenceScreen;->addPreference(Landroidx/preference/Preference;)Z

    .line 268
    const-string v0, "About Your Galaxy"

    invoke-static {p0, v1, v0}, Lcom/android/settings/OneROMHelper;->addCategory(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;)Landroidx/preference/PreferenceCategory;

    move-result-object v0

    .line 269
    const-string v2, "one_ui_version"

    invoke-interface {v7, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_82

    invoke-interface {v7, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/preference/Preference;

    invoke-virtual {v0, v2}, Landroidx/preference/PreferenceCategory;->addPreference(Landroidx/preference/Preference;)Z

    .line 270
    :cond_82
    const-string v2, "android_firmware_version"

    invoke-interface {v7, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_93

    invoke-interface {v7, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/preference/Preference;

    invoke-virtual {v0, v2}, Landroidx/preference/PreferenceCategory;->addPreference(Landroidx/preference/Preference;)Z

    .line 271
    :cond_93
    const-string v2, "kernel_version"

    invoke-interface {v7, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_a4

    invoke-interface {v7, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/preference/Preference;

    invoke-virtual {v0, v2}, Landroidx/preference/PreferenceCategory;->addPreference(Landroidx/preference/Preference;)Z

    .line 272
    :cond_a4
    const-string v2, "build_number"

    invoke-interface {v7, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b5

    invoke-interface {v7, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/preference/Preference;

    invoke-virtual {v0, v2}, Landroidx/preference/PreferenceCategory;->addPreference(Landroidx/preference/Preference;)Z

    .line 275
    :cond_b5
    invoke-static {}, Lcom/android/settings/OneROMHelper;->getKernelSUVersion()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Lcom/android/settings/OneROMHelper$7;

    invoke-direct {v5, v1}, Lcom/android/settings/OneROMHelper$7;-><init>(Landroid/content/Context;)V

    const-string v2, "onerom_ksu_version"

    const-string v3, "KernelSU version"

    invoke-static/range {v0 .. v5}, Lcom/android/settings/OneROMHelper;->addPreference(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroidx/preference/Preference$OnPreferenceClickListener;)Landroidx/preference/Preference;

    .line 284
    const-string v0, "ROM Information"

    invoke-static {p0, v1, v0}, Lcom/android/settings/OneROMHelper;->addCategory(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;)Landroidx/preference/PreferenceCategory;

    move-result-object v2

    .line 285
    new-instance v6, Lcom/android/settings/OneROMHelper$8;

    invoke-direct {v6, v1}, Lcom/android/settings/OneROMHelper$8;-><init>(Landroid/content/Context;)V

    const-string v3, "onerom_rom_settings"

    const-string v4, "OneROM settings"

    const-string v5, "Customise ROM features"

    move-object v10, v2

    move-object v2, v1

    move-object v1, v10

    invoke-static/range {v1 .. v6}, Lcom/android/settings/OneROMHelper;->addPreference(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroidx/preference/Preference$OnPreferenceClickListener;)Landroidx/preference/Preference;

    move-result-object v0

    .line 292
    move-object v10, v2

    move-object v2, v1

    move-object v1, v10

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const-string v4, "drawable"

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "sec_ic_settings_gearshape"

    invoke-virtual {v3, v6, v4, v5}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    .line 293
    if-eqz v3, :cond_fb

    .line 294
    :try_start_f2
    invoke-virtual {v1, v3}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroidx/preference/Preference;->setIcon(Landroid/graphics/drawable/Drawable;)V
    :try_end_f9
    .catch Ljava/lang/Exception; {:try_start_f2 .. :try_end_f9} :catch_fa

    goto :goto_fb

    :catch_fa
    move-exception v0

    .line 297
    :cond_fb
    :goto_fb
    new-instance v6, Lcom/android/settings/OneROMHelper$9;

    invoke-direct {v6, v1}, Lcom/android/settings/OneROMHelper$9;-><init>(Landroid/content/Context;)V

    const-string v3, "onerom_developer"

    const-string v4, "Developer"

    const-string v5, "@DaManMikey"

    move-object v10, v2

    move-object v2, v1

    move-object v1, v10

    invoke-static/range {v1 .. v6}, Lcom/android/settings/OneROMHelper;->addPreference(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroidx/preference/Preference$OnPreferenceClickListener;)Landroidx/preference/Preference;

    .line 304
    move-object v10, v2

    move-object v2, v1

    move-object v1, v10

    new-instance v6, Lcom/android/settings/OneROMHelper$10;

    invoke-direct {v6, v1}, Lcom/android/settings/OneROMHelper$10;-><init>(Landroid/content/Context;)V

    const-string v3, "onerom_build_date"

    const-string v4, "Build date"

    const-string v5, "November 19, 2026"

    move-object v10, v2

    move-object v2, v1

    move-object v1, v10

    invoke-static/range {v1 .. v6}, Lcom/android/settings/OneROMHelper;->addPreference(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroidx/preference/Preference$OnPreferenceClickListener;)Landroidx/preference/Preference;

    .line 311
    move-object v10, v2

    move-object v2, v1

    move-object v1, v10

    const-string v5, "Stable"

    const/4 v6, 0x0

    const-string v3, "onerom_version_status"

    const-string v4, "Version Status"

    move-object v10, v2

    move-object v2, v1

    move-object v1, v10

    invoke-static/range {v1 .. v6}, Lcom/android/settings/OneROMHelper;->addPreference(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroidx/preference/Preference$OnPreferenceClickListener;)Landroidx/preference/Preference;

    .line 314
    move-object v1, v2

    const-string v0, "System Status"

    invoke-static {p0, v1, v0}, Lcom/android/settings/OneROMHelper;->addCategory(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;)Landroidx/preference/PreferenceCategory;

    move-result-object v0

    .line 315
    const-string v2, "ro.product.device"

    const-string v3, "beyond1lte"

    invoke-static {v2, v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "ro.onerom.device"

    invoke-static {v3, v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 316
    const-string v3, "Device Codename"

    const/4 v5, 0x0

    const-string v2, "onerom_device_codename"

    invoke-static/range {v0 .. v5}, Lcom/android/settings/OneROMHelper;->addPreference(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroidx/preference/Preference$OnPreferenceClickListener;)Landroidx/preference/Preference;

    .line 317
    const-string v2, "ro.bootloader"

    const-string v3, "Unknown"

    invoke-static {v2, v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 318
    const-string v3, "Bootloader"

    const-string v2, "onerom_bootloader"

    invoke-static/range {v0 .. v5}, Lcom/android/settings/OneROMHelper;->addPreference(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroidx/preference/Preference$OnPreferenceClickListener;)Landroidx/preference/Preference;

    .line 319
    const-string v4, "Kprobes"

    const-string v2, "onerom_ksu_mode"

    const-string v3, "KernelSU mode"

    invoke-static/range {v0 .. v5}, Lcom/android/settings/OneROMHelper;->addPreference(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroidx/preference/Preference$OnPreferenceClickListener;)Landroidx/preference/Preference;

    .line 320
    const-string v2, "ro.build.fingerprint"

    sget-object v3, Landroid/os/Build;->FINGERPRINT:Ljava/lang/String;

    invoke-static {v2, v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 321
    const-string v3, "Build fingerprint"

    const-string v2, "onerom_build_fingerprint"

    invoke-static/range {v0 .. v5}, Lcom/android/settings/OneROMHelper;->addPreference(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroidx/preference/Preference$OnPreferenceClickListener;)Landroidx/preference/Preference;

    .line 324
    const-string v0, "Software Details"

    invoke-static {p0, v1, v0}, Lcom/android/settings/OneROMHelper;->addCategory(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;)Landroidx/preference/PreferenceCategory;

    move-result-object p0

    .line 325
    const/16 v0, 0x9

    new-array v1, v0, [Ljava/lang/String;

    const-string v2, "module_version"

    aput-object v2, v1, v8

    const-string v2, "base_band"

    aput-object v2, v1, v9

    const-string v2, "selinux_status"

    const/4 v3, 0x2

    aput-object v2, v1, v3

    const-string v2, "knox_version"

    const/4 v3, 0x3

    aput-object v2, v1, v3

    const-string v2, "omc_version"

    const/4 v3, 0x4

    aput-object v2, v1, v3

    const-string v2, "carrier_config_ver"

    const/4 v3, 0x5

    aput-object v2, v1, v3

    const-string v2, "cc_mode_status"

    const/4 v3, 0x6

    aput-object v2, v1, v3

    const-string v2, "security_sw_version"

    const/4 v3, 0x7

    aput-object v2, v1, v3

    const-string v2, "security_key"

    const/16 v3, 0x8

    aput-object v2, v1, v3

    .line 330
    nop

    :goto_1ab
    if-ge v8, v0, :cond_1c1

    aget-object v2, v1, v8

    .line 331
    invoke-interface {v7, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1be

    .line 332
    invoke-interface {v7, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/preference/Preference;

    invoke-virtual {p0, v2}, Landroidx/preference/PreferenceCategory;->addPreference(Landroidx/preference/Preference;)Z

    .line 330
    :cond_1be
    add-int/lit8 v8, v8, 0x1

    goto :goto_1ab

    .line 335
    :cond_1c1
    return-void

    .line 233
    :cond_1c2
    :goto_1c2
    return-void
.end method

.method public static buildSpoofScreen(Landroidx/preference/PreferenceFragmentCompat;)V
    .registers 7

    .line 535
    if-nez p0, :cond_3

    return-void

    .line 536
    :cond_3
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 537
    if-nez v1, :cond_a

    return-void

    .line 539
    :cond_a
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object v0

    .line 540
    if-nez v0, :cond_1d

    .line 541
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceManager()Landroidx/preference/PreferenceManager;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroidx/preference/PreferenceManager;->createPreferenceScreen(Landroid/content/Context;)Landroidx/preference/PreferenceScreen;

    move-result-object v0

    .line 542
    invoke-virtual {p0, v0}, Landroidx/preference/PreferenceFragmentCompat;->setPreferenceScreen(Landroidx/preference/PreferenceScreen;)V

    move-object p0, v0

    goto :goto_1e

    .line 540
    :cond_1d
    move-object p0, v0

    .line 544
    :goto_1e
    invoke-virtual {p0}, Landroidx/preference/PreferenceScreen;->removeAll()V

    .line 546
    const-string v0, "Status information"

    invoke-static {p0, v1, v0}, Lcom/android/settings/OneROMHelper;->addCategory(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;)Landroidx/preference/PreferenceCategory;

    move-result-object v0

    .line 547
    const-string v4, "Display Developer options in Settings menu"

    const/4 v5, 0x1

    const-string v2, "onerom_show_developer_options"

    const-string v3, "Show Developer options"

    invoke-static/range {v0 .. v5}, Lcom/android/settings/OneROMHelper;->addSwitch(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Landroidx/preference/SecSwitchPreference;

    .line 548
    const-string v4, "Display phone number in About phone"

    const-string v2, "onerom_show_phone_number"

    const-string v3, "Show phone number"

    invoke-static/range {v0 .. v5}, Lcom/android/settings/OneROMHelper;->addSwitch(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Landroidx/preference/SecSwitchPreference;

    .line 549
    const-string v4, "Show real IMEI or mask with ********"

    const/4 v5, 0x0

    const-string v2, "onerom_show_imei"

    const-string v3, "Show IMEI"

    invoke-static/range {v0 .. v5}, Lcom/android/settings/OneROMHelper;->addSwitch(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Landroidx/preference/SecSwitchPreference;

    .line 550
    const-string v4, "Show real serial or mask with ********"

    const-string v2, "onerom_show_serial"

    const-string v3, "Show serial number"

    invoke-static/range {v0 .. v5}, Lcom/android/settings/OneROMHelper;->addSwitch(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Landroidx/preference/SecSwitchPreference;

    .line 552
    const-string v0, "Security & Integrity"

    invoke-static {p0, v1, v0}, Lcom/android/settings/OneROMHelper;->addCategory(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;)Landroidx/preference/PreferenceCategory;

    move-result-object v0

    .line 553
    const-string v4, "Spoof hardware attestation keybox"

    const-string v2, "unica_keybox"

    const-string v3, "Keybox attestation spoofing"

    invoke-static/range {v0 .. v5}, Lcom/android/settings/OneROMHelper;->addSwitch(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Landroidx/preference/SecSwitchPreference;

    .line 554
    new-instance v5, Lcom/android/settings/OneROMHelper$23;

    invoke-direct {v5, v1}, Lcom/android/settings/OneROMHelper$23;-><init>(Landroid/content/Context;)V

    const-string v2, "unica_keybox_load"

    const-string v3, "Load keybox file"

    const-string v4, "Import custom keybox XML from storage"

    invoke-static/range {v0 .. v5}, Lcom/android/settings/OneROMHelper;->addPreference(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroidx/preference/Preference$OnPreferenceClickListener;)Landroidx/preference/Preference;

    .line 561
    new-instance v5, Lcom/android/settings/OneROMHelper$24;

    invoke-direct {v5, v1}, Lcom/android/settings/OneROMHelper$24;-><init>(Landroid/content/Context;)V

    const-string v2, "unica_keybox_clear"

    const-string v3, "Clear keybox"

    const-string v4, "Remove stored custom keybox"

    invoke-static/range {v0 .. v5}, Lcom/android/settings/OneROMHelper;->addPreference(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroidx/preference/Preference$OnPreferenceClickListener;)Landroidx/preference/Preference;

    .line 568
    const-string v4, "Spoof target props for MEETS_DEVICE_INTEGRITY"

    const/4 v5, 0x1

    const-string v2, "unica_pif"

    const-string v3, "Play Integrity fix (PIF)"

    invoke-static/range {v0 .. v5}, Lcom/android/settings/OneROMHelper;->addSwitch(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Landroidx/preference/SecSwitchPreference;

    .line 569
    const-string v4, "Hide developer options and USB debugging from apps"

    const/4 v5, 0x0

    const-string v2, "unica_hide_dev"

    const-string v3, "Hide developer status"

    invoke-static/range {v0 .. v5}, Lcom/android/settings/OneROMHelper;->addSwitch(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Landroidx/preference/SecSwitchPreference;

    .line 570
    return-void
.end method

.method public static buildUIScreen(Landroidx/preference/PreferenceFragmentCompat;)V
    .registers 7

    .line 463
    if-nez p0, :cond_3

    return-void

    .line 464
    :cond_3
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 465
    if-nez v1, :cond_a

    return-void

    .line 467
    :cond_a
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object v0

    .line 468
    if-nez v0, :cond_1d

    .line 469
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceManager()Landroidx/preference/PreferenceManager;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroidx/preference/PreferenceManager;->createPreferenceScreen(Landroid/content/Context;)Landroidx/preference/PreferenceScreen;

    move-result-object v0

    .line 470
    invoke-virtual {p0, v0}, Landroidx/preference/PreferenceFragmentCompat;->setPreferenceScreen(Landroidx/preference/PreferenceScreen;)V

    move-object p0, v0

    goto :goto_1e

    .line 468
    :cond_1d
    move-object p0, v0

    .line 472
    :goto_1e
    invoke-virtual {p0}, Landroidx/preference/PreferenceScreen;->removeAll()V

    .line 474
    const-string v0, "Personalization"

    invoke-static {p0, v1, v0}, Lcom/android/settings/OneROMHelper;->addCategory(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;)Landroidx/preference/PreferenceCategory;

    move-result-object v0

    .line 475
    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "device_name"

    invoke-static {v2, v3}, Landroid/provider/Settings$Global;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 476
    if-eqz v2, :cond_39

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_3b

    :cond_39
    const-string v2, "Galaxy S10"

    :cond_3b
    move-object v4, v2

    .line 477
    new-instance v5, Lcom/android/settings/OneROMHelper$20;

    invoke-direct {v5, v1}, Lcom/android/settings/OneROMHelper$20;-><init>(Landroid/content/Context;)V

    const-string v2, "device_name"

    const-string v3, "Device name"

    invoke-static/range {v0 .. v5}, Lcom/android/settings/OneROMHelper;->addPreference(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroidx/preference/Preference$OnPreferenceClickListener;)Landroidx/preference/Preference;

    .line 491
    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "onerom_custom_banner"

    invoke-static {v2, v3}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 492
    if-eqz v2, :cond_5a

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_5c

    :cond_5a
    const-string v2, "OneROM Zeta 9.5"

    :cond_5c
    move-object v4, v2

    .line 493
    new-instance v5, Lcom/android/settings/OneROMHelper$21;

    invoke-direct {v5, v1}, Lcom/android/settings/OneROMHelper$21;-><init>(Landroid/content/Context;)V

    const-string v2, "custom_oneui_banner"

    const-string v3, "Custom banner text"

    invoke-static/range {v0 .. v5}, Lcom/android/settings/OneROMHelper;->addPreference(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroidx/preference/Preference$OnPreferenceClickListener;)Landroidx/preference/Preference;

    .line 507
    const-string v0, "Visual & Performance"

    invoke-static {p0, v1, v0}, Lcom/android/settings/OneROMHelper;->addCategory(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;)Landroidx/preference/PreferenceCategory;

    move-result-object v0

    .line 508
    const-string v4, "Enable real-time background blur effects"

    const/4 v5, 0x1

    const-string v2, "onerom_live_blur"

    const-string v3, "Live blur"

    invoke-static/range {v0 .. v5}, Lcom/android/settings/OneROMHelper;->addSwitch(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Landroidx/preference/SecSwitchPreference;

    .line 510
    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    const-string v2, "unica_launcher_anim_type"

    invoke-static {p0, v2}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 511
    const-string v2, "Stock"

    if-eqz p0, :cond_90

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_8e

    goto :goto_90

    :cond_8e
    move-object v4, p0

    goto :goto_91

    :cond_90
    :goto_90
    move-object v4, v2

    .line 512
    :goto_91
    const/4 p0, 0x3

    new-array p0, p0, [Ljava/lang/String;

    const/4 v3, 0x0

    aput-object v2, p0, v3

    const-string v2, "Pixel"

    const/4 v3, 0x1

    aput-object v2, p0, v3

    const-string v2, "iOS"

    const/4 v3, 0x2

    aput-object v2, p0, v3

    .line 513
    new-instance v5, Lcom/android/settings/OneROMHelper$22;

    invoke-direct {v5, v1, p0}, Lcom/android/settings/OneROMHelper$22;-><init>(Landroid/content/Context;[Ljava/lang/String;)V

    const-string v2, "unica_launcher_anim_type"

    const-string v3, "Launcher animation type"

    invoke-static/range {v0 .. v5}, Lcom/android/settings/OneROMHelper;->addPreference(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroidx/preference/Preference$OnPreferenceClickListener;)Landroidx/preference/Preference;

    .line 527
    const-string v4, "Enable Vulkan HWUI render engine"

    const/4 v5, 0x0

    const-string v2, "onerom_vulkan"

    const-string v3, "Vulkan rendering"

    invoke-static/range {v0 .. v5}, Lcom/android/settings/OneROMHelper;->addSwitch(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Landroidx/preference/SecSwitchPreference;

    .line 528
    const-string v4, "Enforce 60Hz constant display refresh"

    const-string v2, "onerom_max_refresh_rate"

    const-string v3, "Force max refresh rate"

    invoke-static/range {v0 .. v5}, Lcom/android/settings/OneROMHelper;->addSwitch(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Landroidx/preference/SecSwitchPreference;

    .line 529
    const-string v4, "Play audio chime on device startup"

    const-string v2, "onerom_boot_sound"

    const-string v3, "Boot sound"

    invoke-static/range {v0 .. v5}, Lcom/android/settings/OneROMHelper;->addSwitch(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Landroidx/preference/SecSwitchPreference;

    .line 530
    const-string v4, "Show lock screen wallpaper on Always On Display"

    const-string v2, "aod_show_lockscreen_wallpaper"

    const-string v3, "Fullscreen AOD"

    invoke-static/range {v0 .. v5}, Lcom/android/settings/OneROMHelper;->addSwitch(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Landroidx/preference/SecSwitchPreference;

    .line 531
    return-void
.end method

.method public static buildUnicaScreen(Landroidx/preference/PreferenceFragmentCompat;)V
    .registers 10

    .line 339
    if-nez p0, :cond_3

    return-void

    .line 340
    :cond_3
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 341
    if-nez v1, :cond_a

    return-void

    .line 343
    :cond_a
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object v0

    .line 344
    if-nez v0, :cond_1d

    .line 345
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceManager()Landroidx/preference/PreferenceManager;

    move-result-object v0

    .line 346
    invoke-virtual {v0, v1}, Landroidx/preference/PreferenceManager;->createPreferenceScreen(Landroid/content/Context;)Landroidx/preference/PreferenceScreen;

    move-result-object v0

    .line 347
    invoke-virtual {p0, v0}, Landroidx/preference/PreferenceFragmentCompat;->setPreferenceScreen(Landroidx/preference/PreferenceScreen;)V

    move-object p0, v0

    goto :goto_1e

    .line 344
    :cond_1d
    move-object p0, v0

    .line 349
    :goto_1e
    invoke-virtual {p0}, Landroidx/preference/PreferenceScreen;->removeAll()V

    .line 352
    new-instance v6, Lcom/android/settings/OneROMHelper$11;

    invoke-direct {v6, v1}, Lcom/android/settings/OneROMHelper$11;-><init>(Landroid/content/Context;)V

    const/16 v2, 0x96

    const-string v3, "OneROM Zeta 9.5"

    const-string v4, "Android 17 QPR2 \u2022 Exynos 9820 \u2022 OneKernel-9.5+"

    const/4 v5, 0x1

    invoke-static/range {v1 .. v6}, Lcom/android/settings/OneROMHelper;->createBannerView(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;ZLjava/lang/Runnable;)Landroid/view/View;

    move-result-object v0

    .line 358
    new-instance v2, Lcom/android/settingslib/widget/LayoutPreference;

    invoke-direct {v2, v1, v0}, Lcom/android/settingslib/widget/LayoutPreference;-><init>(Landroid/content/Context;Landroid/view/View;)V

    .line 359
    const-string v0, "unica_banner_header"

    invoke-virtual {v2, v0}, Lcom/android/settingslib/widget/LayoutPreference;->setKey(Ljava/lang/String;)V

    .line 360
    const/16 v0, -0x2710

    invoke-virtual {v2, v0}, Lcom/android/settingslib/widget/LayoutPreference;->setOrder(I)V

    .line 361
    const/4 v6, 0x1

    invoke-virtual {v2, v6}, Lcom/android/settingslib/widget/LayoutPreference;->setSelectable(Z)V

    .line 362
    new-instance v0, Lcom/android/settings/OneROMHelper$12;

    invoke-direct {v0, v1}, Lcom/android/settings/OneROMHelper$12;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v0}, Lcom/android/settingslib/widget/LayoutPreference;->setOnPreferenceClickListener(Landroidx/preference/Preference$OnPreferenceClickListener;)V

    .line 369
    invoke-virtual {p0, v2}, Landroidx/preference/PreferenceScreen;->addPreference(Landroidx/preference/Preference;)Z

    .line 372
    const-string v0, "About"

    invoke-static {p0, v1, v0}, Lcom/android/settings/OneROMHelper;->addCategory(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;)Landroidx/preference/PreferenceCategory;

    move-result-object v0

    .line 373
    new-instance v5, Lcom/android/settings/OneROMHelper$13;

    invoke-direct {v5, v1}, Lcom/android/settings/OneROMHelper$13;-><init>(Landroid/content/Context;)V

    const-string v2, "unica_rom_version"

    const-string v3, "ROM version"

    const-string v4, "Zeta 9.5.0.1"

    invoke-static/range {v0 .. v5}, Lcom/android/settings/OneROMHelper;->addPreference(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroidx/preference/Preference$OnPreferenceClickListener;)Landroidx/preference/Preference;

    .line 380
    const-string v2, "ro.product.device"

    const-string v3, "beyond1lte"

    invoke-static {v2, v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "ro.onerom.device"

    invoke-static {v3, v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 381
    const-string v3, "Device Codename"

    const/4 v5, 0x0

    const-string v2, "onerom_device_codename"

    invoke-static/range {v0 .. v5}, Lcom/android/settings/OneROMHelper;->addPreference(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroidx/preference/Preference$OnPreferenceClickListener;)Landroidx/preference/Preference;

    .line 384
    const-string v0, "System"

    invoke-static {p0, v1, v0}, Lcom/android/settings/OneROMHelper;->addCategory(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;)Landroidx/preference/PreferenceCategory;

    move-result-object v0

    .line 385
    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "development_settings_enabled"

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    .line 386
    new-instance v3, Landroidx/preference/SecSwitchPreference;

    invoke-direct {v3, v1}, Landroidx/preference/SecSwitchPreference;-><init>(Landroid/content/Context;)V

    .line 387
    const-string v5, "onerom_developer_options"

    invoke-virtual {v3, v5}, Landroidx/preference/SecSwitchPreference;->setKey(Ljava/lang/String;)V

    .line 388
    const-string v5, "Developer options"

    invoke-virtual {v3, v5}, Landroidx/preference/SecSwitchPreference;->setTitle(Ljava/lang/CharSequence;)V

    .line 389
    const-string v5, "Show developer options menu in Settings"

    invoke-virtual {v3, v5}, Landroidx/preference/SecSwitchPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 390
    if-eqz v2, :cond_a1

    goto :goto_a2

    :cond_a1
    const/4 v6, 0x0

    :goto_a2
    invoke-virtual {v3, v6}, Landroidx/preference/SecSwitchPreference;->setChecked(Z)V

    .line 391
    new-instance v2, Lcom/android/settings/OneROMHelper$14;

    invoke-direct {v2, v1}, Lcom/android/settings/OneROMHelper$14;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, v2}, Landroidx/preference/SecSwitchPreference;->setOnPreferenceChangeListener(Landroidx/preference/Preference$OnPreferenceChangeListener;)V

    .line 399
    new-instance v2, Lcom/android/settings/OneROMHelper$15;

    invoke-direct {v2, v1}, Lcom/android/settings/OneROMHelper$15;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, v2}, Landroidx/preference/SecSwitchPreference;->setOnPreferenceClickListener(Landroidx/preference/Preference$OnPreferenceClickListener;)V

    .line 406
    invoke-virtual {v0, v3}, Landroidx/preference/PreferenceCategory;->addPreference(Landroidx/preference/Preference;)Z

    .line 408
    new-instance v5, Lcom/android/settings/OneROMHelper$16;

    invoke-direct {v5, v1}, Lcom/android/settings/OneROMHelper$16;-><init>(Landroid/content/Context;)V

    const-string v2, "onerom_multi_user"

    const-string v3, "Multi-User"

    const-string v4, "Manage multiple user accounts and profiles"

    invoke-static/range {v0 .. v5}, Lcom/android/settings/OneROMHelper;->addPreference(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroidx/preference/Preference$OnPreferenceClickListener;)Landroidx/preference/Preference;

    .line 423
    const-string v0, "Extra options"

    invoke-static {p0, v1, v0}, Lcom/android/settings/OneROMHelper;->addCategory(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;)Landroidx/preference/PreferenceCategory;

    move-result-object p0

    .line 424
    new-instance v6, Lcom/android/settings/OneROMHelper$17;

    invoke-direct {v6, v1}, Lcom/android/settings/OneROMHelper$17;-><init>(Landroid/content/Context;)V

    const-string v3, "unica_ui_settings"

    const-string v4, "UI"

    const-string v5, "User interface modifications"

    move-object v2, v1

    move-object v1, p0

    invoke-static/range {v1 .. v6}, Lcom/android/settings/OneROMHelper;->addPreference(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroidx/preference/Preference$OnPreferenceClickListener;)Landroidx/preference/Preference;

    move-result-object p0

    .line 431
    move-object v8, v2

    move-object v2, v1

    move-object v1, v8

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v3, "sec_ic_settings_display"

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    const-string v7, "drawable"

    invoke-virtual {v0, v3, v7, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 432
    if-eqz v0, :cond_fb

    .line 433
    :try_start_f2
    invoke-virtual {v1, v0}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroidx/preference/Preference;->setIcon(Landroid/graphics/drawable/Drawable;)V
    :try_end_f9
    .catch Ljava/lang/Exception; {:try_start_f2 .. :try_end_f9} :catch_fa

    goto :goto_fb

    :catch_fa
    move-exception v0

    .line 436
    :cond_fb
    :goto_fb
    new-instance v6, Lcom/android/settings/OneROMHelper$18;

    invoke-direct {v6, v1}, Lcom/android/settings/OneROMHelper$18;-><init>(Landroid/content/Context;)V

    const-string v3, "unica_spoof_settings"

    const-string v4, "Spoofing"

    const-string v5, "Device and system spoofing"

    move-object v8, v2

    move-object v2, v1

    move-object v1, v8

    invoke-static/range {v1 .. v6}, Lcom/android/settings/OneROMHelper;->addPreference(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroidx/preference/Preference$OnPreferenceClickListener;)Landroidx/preference/Preference;

    move-result-object p0

    .line 443
    move-object v8, v2

    move-object v2, v1

    move-object v1, v8

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v3, "sec_ic_settings_biometrics_and_security"

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v7, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 444
    if-eqz v0, :cond_129

    .line 445
    :try_start_120
    invoke-virtual {v1, v0}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroidx/preference/Preference;->setIcon(Landroid/graphics/drawable/Drawable;)V
    :try_end_127
    .catch Ljava/lang/Exception; {:try_start_120 .. :try_end_127} :catch_128

    goto :goto_129

    :catch_128
    move-exception v0

    .line 448
    :cond_129
    :goto_129
    new-instance v6, Lcom/android/settings/OneROMHelper$19;

    invoke-direct {v6, v1}, Lcom/android/settings/OneROMHelper$19;-><init>(Landroid/content/Context;)V

    const-string v3, "unica_extra_settings"

    const-string v4, "Extra"

    const-string v5, "Additional system tweaks and controls"

    move-object v8, v2

    move-object v2, v1

    move-object v1, v8

    invoke-static/range {v1 .. v6}, Lcom/android/settings/OneROMHelper;->addPreference(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroidx/preference/Preference$OnPreferenceClickListener;)Landroidx/preference/Preference;

    move-result-object p0

    .line 455
    move-object v1, v2

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v2, "sec_ic_settings_advanced_feature"

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v7, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 456
    if-eqz v0, :cond_155

    .line 457
    :try_start_14c
    invoke-virtual {v1, v0}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroidx/preference/Preference;->setIcon(Landroid/graphics/drawable/Drawable;)V
    :try_end_153
    .catch Ljava/lang/Exception; {:try_start_14c .. :try_end_153} :catch_154

    goto :goto_155

    :catch_154
    move-exception v0

    .line 459
    :cond_155
    :goto_155
    return-void
.end method

.method public static createBannerView(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;ZLjava/lang/Runnable;)Landroid/view/View;
    .registers 22

    .line 45
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move-object/from16 v2, p5

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->density:F

    .line 46
    move/from16 v4, p1

    int-to-float v4, v4

    mul-float v4, v4, v3

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    .line 47
    const/high16 v5, 0x41800000    # 16.0f

    mul-float v5, v5, v3

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v5

    .line 48
    const/high16 v6, 0x40c00000    # 6.0f

    mul-float v7, v3, v6

    invoke-static {v7}, Ljava/lang/Math;->round(F)I

    move-result v7

    .line 49
    const/high16 v8, 0x41d00000    # 26.0f

    mul-float v8, v8, v3

    invoke-static {v8}, Ljava/lang/Math;->round(F)I

    move-result v8

    .line 51
    new-instance v9, Landroid/widget/FrameLayout;

    invoke-direct {v9, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 52
    new-instance v10, Landroid/view/ViewGroup$MarginLayoutParams;

    const/4 v11, -0x1

    invoke-direct {v10, v11, v4}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 55
    invoke-virtual {v10, v5, v7, v5, v7}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 56
    invoke-virtual {v9, v10}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 58
    new-instance v4, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v4}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 59
    const-string v5, "#ff222222"

    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 60
    int-to-float v5, v8

    invoke-virtual {v4, v5}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 61
    invoke-virtual {v9, v4}, Landroid/widget/FrameLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 62
    const/4 v4, 0x1

    invoke-virtual {v9, v4}, Landroid/widget/FrameLayout;->setClipToOutline(Z)V

    .line 64
    new-instance v5, Landroid/widget/ImageView;

    invoke-direct {v5, v0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 65
    new-instance v7, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v7, v11, v11}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v7}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 68
    sget-object v7, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v5, v7}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 69
    :try_start_wp
    invoke-static {v0}, Landroid/app/WallpaperManager;->getInstance(Landroid/content/Context;)Landroid/app/WallpaperManager;

    move-result-object v7

    invoke-virtual {v7}, Landroid/app/WallpaperManager;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v7

    if-eqz v7, :cond_file_wp

    invoke-virtual {v5, v7}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :cond_78

    :try_end_wp
    .catch Ljava/lang/Throwable; {:try_start_wp .. :try_end_wp} :cond_file_wp

    :cond_file_wp
    const-string v7, "/system/media/onerom_wallpaper.png"

    invoke-static {v7}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v7

    if-eqz v7, :cond_78

    invoke-virtual {v5, v7}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    :cond_78
    invoke-virtual {v9, v5}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 75
    new-instance v5, Landroid/view/View;

    invoke-direct {v5, v0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 76
    new-instance v7, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v7, v11, v11}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v7}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 79
    const-string v7, "#66000000"

    invoke-static {v7}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v5, v7}, Landroid/view/View;->setBackgroundColor(I)V

    .line 80
    invoke-virtual {v9, v5}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 82
    new-instance v5, Landroid/widget/LinearLayout;

    invoke-direct {v5, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 83
    invoke-virtual {v5, v4}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 84
    const/16 v7, 0x11

    invoke-virtual {v5, v7}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 85
    new-instance v8, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v8, v11, v11}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v8}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 89
    const/high16 v8, 0x40800000    # 4.0f

    if-eqz p4, :cond_e0

    .line 90
    const-string v10, "/system/media/unica_logo.webp"

    invoke-static {v10}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v10

    .line 91
    if-nez v10, :cond_bb

    .line 92
    const-string v10, "/system/media/rom_logo.png"

    invoke-static {v10}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v10

    .line 94
    :cond_bb
    if-eqz v10, :cond_e0

    .line 95
    new-instance v12, Landroid/widget/ImageView;

    invoke-direct {v12, v0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 96
    const/high16 v13, 0x42300000    # 44.0f

    mul-float v13, v13, v3

    invoke-static {v13}, Ljava/lang/Math;->round(F)I

    move-result v13

    .line 97
    new-instance v14, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v14, v13, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 98
    mul-float v3, v3, v8

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    iput v3, v14, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 99
    invoke-virtual {v12, v14}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 100
    invoke-virtual {v12, v10}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 101
    invoke-virtual {v5, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 105
    :cond_e0
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v10, "onerom_custom_banner"

    invoke-static {v3, v10}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 106
    if-eqz v3, :cond_f7

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_f7

    .line 107
    goto :goto_f9

    .line 110
    :cond_f7
    move-object/from16 v3, p2

    :goto_f9
    new-instance v10, Landroid/widget/TextView;

    invoke-direct {v10, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 111
    invoke-virtual {v10, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 112
    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setTextColor(I)V

    .line 113
    if-eqz p4, :cond_109

    const/high16 v3, 0x41c00000    # 24.0f

    goto :goto_10b

    :cond_109
    const/high16 v3, 0x41a00000    # 20.0f

    :goto_10b
    const/4 v11, 0x2

    invoke-virtual {v10, v11, v3}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 114
    const-string v3, "sec"

    invoke-static {v3, v4}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v12

    invoke-virtual {v10, v12}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 115
    const/high16 v12, 0x40000000    # 2.0f

    const-string v13, "#80000000"

    invoke-static {v13}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v14

    const/4 v15, 0x0

    invoke-virtual {v10, v6, v15, v12, v14}, Landroid/widget/TextView;->setShadowLayer(FFFI)V

    .line 116
    invoke-virtual {v10, v7}, Landroid/widget/TextView;->setGravity(I)V

    .line 117
    invoke-virtual {v5, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 119
    if-eqz v1, :cond_15f

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_15f

    .line 120
    new-instance v6, Landroid/widget/TextView;

    invoke-direct {v6, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 121
    invoke-virtual {v6, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 122
    const-string v0, "#ccffffff"

    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {v6, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 123
    const/high16 v0, 0x41400000    # 12.0f

    invoke-virtual {v6, v11, v0}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 124
    const/4 v0, 0x0

    invoke-static {v3, v0}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v0

    invoke-virtual {v6, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 125
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {v13}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v6, v8, v15, v0, v1}, Landroid/widget/TextView;->setShadowLayer(FFFI)V

    .line 126
    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setGravity(I)V

    .line 127
    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 130
    :cond_15f
    invoke-virtual {v9, v5}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 132
    if-eqz v2, :cond_172

    .line 133
    invoke-virtual {v9, v4}, Landroid/widget/FrameLayout;->setClickable(Z)V

    .line 134
    invoke-virtual {v9, v4}, Landroid/widget/FrameLayout;->setFocusable(Z)V

    .line 135
    new-instance v0, Lcom/android/settings/OneROMHelper$1;

    invoke-direct {v0, v2}, Lcom/android/settings/OneROMHelper$1;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v9, v0}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 143
    :cond_172
    return-object v9
.end method

.method private static getKernelSUVersion()Ljava/lang/String;
    .registers 2

    .line 701
    :try_start_0
    new-instance v0, Ljava/io/File;

    const-string v1, "/sys/fs/selinux"

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 702
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_11

    .line 703
    const-string v0, "KernelSU Next v3.4.0 (33294) (12104)"
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_f} :catch_10

    return-object v0

    .line 705
    :catch_10
    move-exception v0

    :cond_11
    nop

    .line 706
    const-string v0, "KernelSU Active"

    return-object v0
.end method

.method public static initAboutBanner(Landroidx/preference/PreferenceFragmentCompat;)V
    .registers 8

    .line 200
    if-nez p0, :cond_3

    return-void

    .line 201
    :cond_3
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 202
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object p0

    .line 203
    if-eqz v0, :cond_45

    if-nez p0, :cond_10

    goto :goto_45

    .line 205
    :cond_10
    const-string v6, "onerom_about_banner"

    invoke-virtual {p0, v6}, Landroidx/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v1

    if-eqz v1, :cond_19

    return-void

    .line 207
    :cond_19
    new-instance v5, Lcom/android/settings/OneROMHelper$3;

    invoke-direct {v5, v0}, Lcom/android/settings/OneROMHelper$3;-><init>(Landroid/content/Context;)V

    const/16 v1, 0x4a

    const-string v2, "OneROM Zeta 9.5"

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static/range {v0 .. v5}, Lcom/android/settings/OneROMHelper;->createBannerView(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;ZLjava/lang/Runnable;)Landroid/view/View;

    move-result-object v1

    .line 214
    new-instance v2, Lcom/android/settingslib/widget/LayoutPreference;

    invoke-direct {v2, v0, v1}, Lcom/android/settingslib/widget/LayoutPreference;-><init>(Landroid/content/Context;Landroid/view/View;)V

    .line 215
    invoke-virtual {v2, v6}, Lcom/android/settingslib/widget/LayoutPreference;->setKey(Ljava/lang/String;)V

    .line 216
    const/16 v1, -0x2710

    invoke-virtual {v2, v1}, Lcom/android/settingslib/widget/LayoutPreference;->setOrder(I)V

    .line 217
    const/4 v1, 0x1

    invoke-virtual {v2, v1}, Lcom/android/settingslib/widget/LayoutPreference;->setSelectable(Z)V

    .line 218
    new-instance v1, Lcom/android/settings/OneROMHelper$4;

    invoke-direct {v1, v0}, Lcom/android/settings/OneROMHelper$4;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v1}, Lcom/android/settingslib/widget/LayoutPreference;->setOnPreferenceClickListener(Landroidx/preference/Preference$OnPreferenceClickListener;)V

    .line 225
    invoke-virtual {p0, v2}, Landroidx/preference/PreferenceScreen;->addPreference(Landroidx/preference/Preference;)Z

    .line 226
    return-void

    .line 203
    :cond_45
    :goto_45
    return-void
.end method

.method private static launchAppOrToast(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5

    .line 710
    if-nez p0, :cond_3

    return-void

    .line 711
    :cond_3
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    .line 712
    if-nez p1, :cond_15

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    .line 713
    :cond_15
    if-eqz p1, :cond_20

    .line 714
    const/high16 p2, 0x10000000

    invoke-virtual {p1, p2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 715
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_28

    .line 717
    :cond_20
    const/4 p1, 0x1

    invoke-static {p0, p3, p1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 719
    :goto_28
    return-void
.end method

.method public static openSubSettings(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6

    .line 147
    if-nez p0, :cond_3

    return-void

    .line 149
    :cond_3
    :try_start_3
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 150
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "com.android.settings.SubSettings"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 151
    const-string v1, ":settings:show_fragment"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 152
    const-string p1, ":settings:show_fragment_title"

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 153
    const/high16 p1, 0x10000000

    invoke-virtual {v0, p1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 154
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_23} :catch_24

    .line 157
    goto :goto_40

    .line 155
    :catch_24
    move-exception p1

    .line 156
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Cannot open "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    invoke-static {p0, p1, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 158
    :goto_40
    return-void
.end method

.method private static rebootDevice(Landroid/content/Context;Ljava/lang/String;)V
    .registers 3

    .line 692
    if-nez p0, :cond_3

    return-void

    .line 693
    :cond_3
    const-string v0, "power"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/os/PowerManager;

    .line 694
    if-eqz p0, :cond_10

    .line 695
    invoke-virtual {p0, p1}, Landroid/os/PowerManager;->reboot(Ljava/lang/String;)V

    .line 697
    :cond_10
    return-void
.end method

.method private static setDeviceName(Landroid/content/Context;Ljava/lang/String;)V
    .registers 3

    .line 679
    if-eqz p1, :cond_26

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_d

    goto :goto_26

    .line 681
    :cond_d
    :try_start_d
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    const-string v0, "device_name"

    invoke-static {p0, v0, p1}, Landroid/provider/Settings$Global;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_16} :catch_17

    goto :goto_18

    .line 682
    :catch_17
    move-exception p0

    :goto_18
    nop

    .line 684
    :try_start_19
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object p0

    .line 685
    if-eqz p0, :cond_24

    .line 686
    invoke-virtual {p0, p1}, Landroid/bluetooth/BluetoothAdapter;->setName(Ljava/lang/String;)Z
    :try_end_22
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_22} :catch_23

    goto :goto_24

    .line 688
    :catch_23
    move-exception p0

    :cond_24
    :goto_24
    nop

    .line 689
    return-void

    .line 679
    :cond_26
    :goto_26
    return-void
.end method

.method private static setupBixbyPref(Landroidx/preference/PreferenceCategory;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V
    .registers 12

    .line 634
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-static {v0, p2}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 635
    if-eqz v0, :cond_10

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_13

    :cond_10
    const/4 v0, 0x0

    aget-object v0, p4, v0

    :cond_13
    move-object v5, v0

    .line 636
    new-instance v6, Lcom/android/settings/OneROMHelper$29;

    invoke-direct {v6, p1, p4, p2}, Lcom/android/settings/OneROMHelper$29;-><init>(Landroid/content/Context;[Ljava/lang/String;Ljava/lang/String;)V

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    invoke-static/range {v1 .. v6}, Lcom/android/settings/OneROMHelper;->addPreference(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroidx/preference/Preference$OnPreferenceClickListener;)Landroidx/preference/Preference;

    .line 649
    return-void
.end method

.method public static showChangelog(Landroid/content/Context;)V
    .registers 3

    .line 652
    if-nez p0, :cond_3

    return-void

    .line 653
    :cond_3
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 654
    const-string p0, "OneROM Zeta 9.5 Changelog"

    invoke-virtual {v0, p0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 655
    const-string v0, "OneROM Zeta 9.5.0.1 (Android 17 QPR2)\nBuild: S948BXXU6ZZKN \u2022 Exynos 9820\nKernel: OneKernel-9.5+ (Linux 4.14.336)\n\nChanges in Zeta 9.5:\n\u2022 One UI 9.5 ported to Galaxy S10 / S10+\n\u2022 Re-engineered Camera stack for S10 sensors\n\u2022 Full camera preview & viewfinder restored\n\u2022 Samsung One UI corner display cutout padding\n\u2022 Dynamic WQHD+ resolution lock (3040x1440)\n\u2022 Complete OneROM Settings mod restored\n\u2022 Authentic Software information categories\n\u2022 Battery Health (BSOH) & cycle count reporting\n\u2022 SSRM and internal build warning popups suppressed\n\u2022 S Pen hardware configuration stripped\n\u2022 Privacy masking: IMEI and Serial masked\n\u2022 Physical Bixby key mapping & actions\n\u2022 Cached App Freezer enabled"

    invoke-virtual {p0, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 674
    const-string v0, "Close"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 675
    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 676
    return-void
.end method

.method private static showChoiceDialog(Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;Lcom/android/settings/OneROMHelper$DialogCallback;)V
    .registers 5

    .line 744
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 745
    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    new-instance p1, Lcom/android/settings/OneROMHelper$31;

    invoke-direct {p1, p3, p2}, Lcom/android/settings/OneROMHelper$31;-><init>(Lcom/android/settings/OneROMHelper$DialogCallback;[Ljava/lang/String;)V

    .line 746
    invoke-virtual {p0, p2, p1}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 754
    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 755
    return-void
.end method

.method private static showTextEditDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/android/settings/OneROMHelper$DialogCallback;)V
    .registers 5

    .line 726
    new-instance v0, Landroid/widget/EditText;

    invoke-direct {v0, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 727
    invoke-virtual {v0, p2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 728
    new-instance p2, Landroid/app/AlertDialog$Builder;

    invoke-direct {p2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 729
    invoke-virtual {p2, p1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 730
    invoke-virtual {p0, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    new-instance p1, Lcom/android/settings/OneROMHelper$30;

    invoke-direct {p1, p3, v0}, Lcom/android/settings/OneROMHelper$30;-><init>(Lcom/android/settings/OneROMHelper$DialogCallback;Landroid/widget/EditText;)V

    .line 731
    const-string p2, "Save"

    invoke-virtual {p0, p2, p1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 739
    const-string p1, "Cancel"

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 740
    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 741
    return-void
.end method

.method public static showRebootDialog(Landroid/content/Context;)V
    .registers 5

    if-nez p0, :cond_0
    return-void

    :cond_0
    const/4 v0, 0x4
    new-array v1, v0, [Ljava/lang/String;
    const/4 v2, 0x0
    const-string v3, "Reboot"
    aput-object v3, v1, v2
    const/4 v2, 0x1
    const-string v3, "Quick Reboot"
    aput-object v3, v1, v2
    const/4 v2, 0x2
    const-string v3, "Recovery"
    aput-object v3, v1, v2
    const/4 v2, 0x3
    const-string v3, "Download"
    aput-object v3, v1, v2

    new-instance v0, Lcom/android/settings/OneROMHelper$RebootCallback;
    invoke-direct {v0, p0}, Lcom/android/settings/OneROMHelper$RebootCallback;-><init>(Landroid/content/Context;)V

    const-string v2, "Reboot options"
    invoke-static {p0, v2, v1, v0}, Lcom/android/settings/OneROMHelper;->showChoiceDialog(Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;Lcom/android/settings/OneROMHelper$DialogCallback;)V
    return-void
.end method
