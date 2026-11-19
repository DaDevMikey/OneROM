.class public Lcom/samsung/android/settings/deviceinfo/softwareinfo/SoftwareInfoSettings;
.super Lcom/android/settings/dashboard/DashboardFragment;
.source "qb/117478588 ef68672984e5a659a7e5edd478bafa64e2bea021b15a07cfabf98fde6e4913cf"


# static fields
.field public static final SEARCH_INDEX_DATA_PROVIDER:Lcom/android/settings/search/BaseSearchIndexProvider;


# instance fields
.field public mBuildNumberPreferenceController:Lcom/android/settings/deviceinfo/BuildNumberPreferenceController;

.field public final mDevelopEnabled:Landroid/net/Uri;

.field public final mDeveloperSettingsObserver:Lcom/samsung/android/settings/deviceinfo/softwareinfo/SoftwareInfoSettings$2;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/samsung/android/settings/deviceinfo/softwareinfo/SoftwareInfoSettings$1;

    const v1, 0x7f18027b

    invoke-direct {v0, v1}, Lcom/android/settings/search/BaseSearchIndexProvider;-><init>(I)V

    sput-object v0, Lcom/samsung/android/settings/deviceinfo/softwareinfo/SoftwareInfoSettings;->SEARCH_INDEX_DATA_PROVIDER:Lcom/android/settings/search/BaseSearchIndexProvider;

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    invoke-direct {p0}, Lcom/android/settings/dashboard/DashboardFragment;-><init>()V

    const-string/jumbo v0, "development_settings_enabled"

    invoke-static {v0}, Landroid/provider/Settings$Global;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    iput-object v0, p0, Lcom/samsung/android/settings/deviceinfo/softwareinfo/SoftwareInfoSettings;->mDevelopEnabled:Landroid/net/Uri;

    new-instance v0, Lcom/samsung/android/settings/deviceinfo/softwareinfo/SoftwareInfoSettings$2;

    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    invoke-direct {v0, p0, v1}, Lcom/samsung/android/settings/deviceinfo/softwareinfo/SoftwareInfoSettings$2;-><init>(Lcom/samsung/android/settings/deviceinfo/softwareinfo/SoftwareInfoSettings;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/samsung/android/settings/deviceinfo/softwareinfo/SoftwareInfoSettings;->mDeveloperSettingsObserver:Lcom/samsung/android/settings/deviceinfo/softwareinfo/SoftwareInfoSettings$2;

    return-void
.end method

.method public static buildPreferenceControllers$2(Landroid/content/Context;)Ljava/util/List;
    .locals 9

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Lcom/samsung/android/settings/deviceinfo/softwareinfo/CarrierConfigPreferenceController;

    invoke-direct {v1, p0}, Lcom/android/settingslib/core/AbstractPreferenceController;-><init>(Landroid/content/Context;)V

    new-instance v2, Lcom/samsung/android/settings/deviceinfo/softwareinfo/CarrierConfigPreferenceController$1;

    invoke-direct {v2, v1}, Lcom/samsung/android/settings/deviceinfo/softwareinfo/CarrierConfigPreferenceController$1;-><init>(Lcom/samsung/android/settings/deviceinfo/softwareinfo/CarrierConfigPreferenceController;)V

    iput-object v2, v1, Lcom/samsung/android/settings/deviceinfo/softwareinfo/CarrierConfigPreferenceController;->mReceiver:Lcom/samsung/android/settings/deviceinfo/softwareinfo/CarrierConfigPreferenceController$1;

    const/4 v2, 0x5

    iput v2, v1, Lcom/samsung/android/settings/deviceinfo/softwareinfo/CarrierConfigPreferenceController;->mDevHitCountdown:I

    iput-object p0, v1, Lcom/samsung/android/settings/deviceinfo/softwareinfo/CarrierConfigPreferenceController;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string/jumbo p0, "VERSION"

    filled-new-array {p0}, [Ljava/lang/String;

    move-result-object v5

    const-string/jumbo p0, "com.samsung.nsds.provider/device_config"

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v3 .. v8}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    if-eqz p0, :cond_0

    :try_start_0
    invoke-interface {p0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x0

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_0

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    goto :goto_0

    :catchall_0
    move-exception v0

    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    throw v0

    :cond_0
    if-eqz p0, :cond_1

    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    :cond_1
    const-string v2, "0"

    :goto_0
    iput-object v2, v1, Lcom/samsung/android/settings/deviceinfo/softwareinfo/CarrierConfigPreferenceController;->mConfig:Ljava/lang/String;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method


# virtual methods
.method public final createPreferenceControllers(Landroid/content/Context;)Ljava/util/List;
    .locals 0

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    invoke-virtual {p0}, Lcom/android/settings/core/ObservablePreferenceFragment;->getSettingsLifecycle()Lcom/android/settingslib/core/lifecycle/Lifecycle;

    invoke-static {p1}, Lcom/samsung/android/settings/deviceinfo/softwareinfo/SoftwareInfoSettings;->buildPreferenceControllers$2(Landroid/content/Context;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public final getLogTag()Ljava/lang/String;
    .locals 0

    const-string/jumbo p0, "SoftwareInfoSettings"

    return-object p0
.end method

.method public final getMetricsCategory()I
    .locals 0

    const/16 p0, 0x12c9

    return p0
.end method

.method public final getPreferenceScreenResId()I
    .locals 0

    const p0, 0x7f18027b

    return p0
.end method

.method public final onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    iget-object v0, p0, Lcom/samsung/android/settings/deviceinfo/softwareinfo/SoftwareInfoSettings;->mBuildNumberPreferenceController:Lcom/android/settings/deviceinfo/BuildNumberPreferenceController;

    invoke-virtual {v0, p1, p2, p3}, Lcom/android/settings/deviceinfo/BuildNumberPreferenceController;->onActivityResult(IILandroid/content/Intent;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-super {p0, p1, p2, p3}, Lcom/android/settings/dashboard/DashboardFragment;->onActivityResult(IILandroid/content/Intent;)V

    return-void
.end method

.method public final onAttach(Landroid/content/Context;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/android/settings/dashboard/DashboardFragment;->onAttach(Landroid/content/Context;)V

    const-class p1, Lcom/android/settings/deviceinfo/BuildNumberPreferenceController;

    invoke-virtual {p0, p1}, Lcom/android/settings/dashboard/DashboardFragment;->use(Ljava/lang/Class;)Lcom/android/settingslib/core/AbstractPreferenceController;

    move-result-object p1

    check-cast p1, Lcom/android/settings/deviceinfo/BuildNumberPreferenceController;

    iput-object p1, p0, Lcom/samsung/android/settings/deviceinfo/softwareinfo/SoftwareInfoSettings;->mBuildNumberPreferenceController:Lcom/android/settings/deviceinfo/BuildNumberPreferenceController;

    invoke-virtual {p1, p0}, Lcom/android/settings/deviceinfo/BuildNumberPreferenceController;->setHost(Lcom/android/settings/core/InstrumentedPreferenceFragment;)V

    return-void
.end method

.method public final onStart()V
    .locals 3

    invoke-super {p0}, Lcom/android/settings/dashboard/DashboardFragment;->onStart()V

    invoke-static {p0}, Lcom/android/settings/OneROMHelper;->buildSoftwareInfoScreen(Landroidx/preference/PreferenceFragmentCompat;)V

    invoke-virtual {p0}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->getPrefContext()Landroid/content/Context;

    move-result-object v0

    const-string/jumbo v1, "SettingsLib/MinorModeUtils"

    const-string/jumbo v2, "develop options restriction:"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string/jumbo v1, "get_enable_developer_mode_restrict"

    const-string/jumbo v2, "enable_developer_mode_restrict"

    invoke-static {v0, v1, v2}, Lcom/android/settingslib/MinorModeUtils;->isCHNMinorModeRestrictionEnabled(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->getPrefContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/samsung/android/settings/deviceinfo/softwareinfo/SoftwareInfoSettings;->mDevelopEnabled:Landroid/net/Uri;

    const/4 v2, 0x0

    iget-object p0, p0, Lcom/samsung/android/settings/deviceinfo/softwareinfo/SoftwareInfoSettings;->mDeveloperSettingsObserver:Lcom/samsung/android/settings/deviceinfo/softwareinfo/SoftwareInfoSettings$2;

    invoke-virtual {v0, v1, v2, p0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    :cond_0
    return-void
.end method

.method public final onStop()V
    .locals 3

    invoke-super {p0}, Lcom/android/settings/dashboard/DashboardFragment;->onStop()V

    invoke-virtual {p0}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->getPrefContext()Landroid/content/Context;

    move-result-object v0

    const-string/jumbo v1, "SettingsLib/MinorModeUtils"

    const-string/jumbo v2, "develop options restriction:"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string/jumbo v1, "get_enable_developer_mode_restrict"

    const-string/jumbo v2, "enable_developer_mode_restrict"

    invoke-static {v0, v1, v2}, Lcom/android/settingslib/MinorModeUtils;->isCHNMinorModeRestrictionEnabled(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->getPrefContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object p0, p0, Lcom/samsung/android/settings/deviceinfo/softwareinfo/SoftwareInfoSettings;->mDeveloperSettingsObserver:Lcom/samsung/android/settings/deviceinfo/softwareinfo/SoftwareInfoSettings$2;

    invoke-virtual {v0, p0}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    :cond_0
    return-void
.end method
