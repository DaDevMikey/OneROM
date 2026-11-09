.class public Lio/mesalabs/unica/settings/ChangelogFragment;
.super Lcom/android/settings/dashboard/DashboardFragment;
.source "ChangelogFragment.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lcom/android/settings/dashboard/DashboardFragment;-><init>()V

    return-void
.end method


# virtual methods
.method public final getLogTag()Ljava/lang/String;
    .registers 2

    const-string v0, "OneROMChangelog"

    return-object v0
.end method

.method public final getMetricsCategory()I
    .registers 2

    const/16 v0, 0x2e8

    return v0
.end method

.method public final getPreferenceScreenResId()I
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public onCreatePreferences(Landroid/os/Bundle;Ljava/lang/String;)V
    .registers 8

    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceManager()Landroidx/preference/PreferenceManager;

    move-result-object p1

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroidx/preference/PreferenceManager;->createPreferenceScreen(Landroid/content/Context;)Landroidx/preference/PreferenceScreen;

    move-result-object p1

    const/4 v2, 0x0

    # --- Category: OneROM 9.0.1.0 (Unified S10 & S10+) ---
    new-instance v0, Landroidx/preference/PreferenceCategory;

    invoke-direct {v0, p2}, Landroidx/preference/PreferenceCategory;-><init>(Landroid/content/Context;)V

    const-string v1, "OneROM 9.0.1.0"

    invoke-virtual {v0, v1}, Landroidx/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceGroup;->addPreference(Landroidx/preference/Preference;)Z

    # Item 1: S10+ support & credits
    new-instance v1, Landroidx/preference/Preference;

    invoke-direct {v1, p2}, Landroidx/preference/Preference;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v2}, Landroidx/preference/Preference;->setSelectable(Z)V

    const-string v3, "Galaxy S10+ Hardware Support"

    invoke-virtual {v1, v3}, Landroidx/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    const-string v3, "Added full Galaxy S10+ (beyond2lte) support with dual front camera pill cutout & animations. Merged with Rodrigo Brown (@rodrigonbrown-rgb)."

    invoke-virtual {v1, v3}, Landroidx/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, v1}, Landroidx/preference/PreferenceGroup;->addPreference(Landroidx/preference/Preference;)Z

    # Item 2: Exynos 9820 Platform Fixes
    new-instance v1, Landroidx/preference/Preference;

    invoke-direct {v1, p2}, Landroidx/preference/Preference;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v2}, Landroidx/preference/Preference;->setSelectable(Z)V

    const-string v3, "Exynos 9820 Platform Optimizations"

    invoke-virtual {v1, v3}, Landroidx/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    const-string v3, "Disabled sead crash loop (eliminates overheating and CPU thrash), fixed SurfaceFlinger GPIS blur stutter, enabled HWC VDS screen recording, and tuned LMKD anti-thrash."

    invoke-virtual {v1, v3}, Landroidx/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, v1}, Landroidx/preference/PreferenceGroup;->addPreference(Landroidx/preference/Preference;)Z

    # Item 3: Browser & Sandboxed Processes
    new-instance v1, Landroidx/preference/Preference;

    invoke-direct {v1, p2}, Landroidx/preference/Preference;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v2}, Landroidx/preference/Preference;->setSelectable(Z)V

    const-string v3, "Web Browser & Sandboxed Processes"

    invoke-virtual {v1, v3}, Landroidx/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    const-string v3, "Resolved Chromium, Chrome, and system WebView crashes by implementing SandboxedProcessService fallback in Android framework."

    invoke-virtual {v1, v3}, Landroidx/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, v1}, Landroidx/preference/PreferenceGroup;->addPreference(Landroidx/preference/Preference;)Z

    # Item 4: Dual Kernel Lineup
    new-instance v1, Landroidx/preference/Preference;

    invoke-direct {v1, p2}, Landroidx/preference/Preference;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v2}, Landroidx/preference/Preference;->setSelectable(Z)V

    const-string v3, "Dual Kernel Lineup"

    invoke-virtual {v1, v3}, Landroidx/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    const-string v3, "Released OneKernel 9.0 (Stock 2.73 GHz, 702 MHz GPU) and OneKernel+ 9.0 (3.02 GHz OC, 806 MHz GPU) with KernelSU-Next v3.2.0 integration."

    invoke-virtual {v1, v3}, Landroidx/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, v1}, Landroidx/preference/PreferenceGroup;->addPreference(Landroidx/preference/Preference;)Z

    # Item 5: Lockscreen & Camera Polish
    new-instance v1, Landroidx/preference/Preference;

    invoke-direct {v1, p2}, Landroidx/preference/Preference;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v2}, Landroidx/preference/Preference;->setSelectable(Z)V

    const-string v3, "Lockscreen & Camera Fixes"

    invoke-virtual {v1, v3}, Landroidx/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    const-string v3, "Calibrated in-display fingerprint sensor position on PIN bouncer (no overlap with 0 key), fixed front camera timeout crash, and tuned touch polling to 240Hz."

    invoke-virtual {v1, v3}, Landroidx/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, v1}, Landroidx/preference/PreferenceGroup;->addPreference(Landroidx/preference/Preference;)Z

    # --- Category: OneROM Delta 9.0 ---
    new-instance v0, Landroidx/preference/PreferenceCategory;

    invoke-direct {v0, p2}, Landroidx/preference/PreferenceCategory;-><init>(Landroid/content/Context;)V

    const-string v1, "OneROM Delta 9.0"

    invoke-virtual {v0, v1}, Landroidx/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceGroup;->addPreference(Landroidx/preference/Preference;)Z

    new-instance v1, Landroidx/preference/Preference;

    invoke-direct {v1, p2}, Landroidx/preference/Preference;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v2}, Landroidx/preference/Preference;->setSelectable(Z)V

    const-string v3, "Initial Release"

    invoke-virtual {v1, v3}, Landroidx/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    const-string v3, "Initial One UI 9 Android 17 port for Galaxy S10 (beyond1lte)."

    invoke-virtual {v1, v3}, Landroidx/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, v1}, Landroidx/preference/PreferenceGroup;->addPreference(Landroidx/preference/Preference;)Z

    invoke-virtual {p0, p1}, Landroidx/preference/PreferenceFragmentCompat;->setPreferenceScreen(Landroidx/preference/PreferenceScreen;)V

    return-void
.end method
