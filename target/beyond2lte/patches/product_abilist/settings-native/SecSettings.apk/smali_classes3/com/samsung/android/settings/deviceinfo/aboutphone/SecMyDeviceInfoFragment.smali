.class public Lcom/samsung/android/settings/deviceinfo/aboutphone/SecMyDeviceInfoFragment;
.super Lcom/samsung/android/settings/dynamicmenu/SecDynamicFragment;
.source "qb/117478588 ef68672984e5a659a7e5edd478bafa64e2bea021b15a07cfabf98fde6e4913cf"


# static fields
.field public static final SEARCH_INDEX_DATA_PROVIDER:Lcom/android/settings/search/BaseSearchIndexProvider;


# instance fields
.field public mContext:Landroid/content/Context;

.field public mDeviceImageManager:Lcom/samsung/android/settings/deviceinfo/aboutphone/DeviceImageManager;

.field public mDeviceInfoHeaderPreferenceController:Lcom/samsung/android/settings/deviceinfo/aboutphone/DeviceInfoHeaderPreferenceController;

.field public mRelativeLinkView:Lcom/samsung/android/settings/widget/SecRelativeLinkView;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/samsung/android/settings/deviceinfo/aboutphone/SecMyDeviceInfoFragment$1;

    const v1, 0x7f18023c

    invoke-direct {v0, v1}, Lcom/android/settings/search/BaseSearchIndexProvider;-><init>(I)V

    sput-object v0, Lcom/samsung/android/settings/deviceinfo/aboutphone/SecMyDeviceInfoFragment;->SEARCH_INDEX_DATA_PROVIDER:Lcom/android/settings/search/BaseSearchIndexProvider;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/samsung/android/settings/dynamicmenu/SecDynamicFragment;-><init>()V

    return-void
.end method

.method public static buildPreferenceControllers(Landroid/content/Context;Lcom/samsung/android/settings/deviceinfo/aboutphone/SecMyDeviceInfoFragment;Lcom/android/settingslib/core/lifecycle/Lifecycle;Landroidx/fragment/app/FragmentActivity;)Ljava/util/List;
    .locals 3

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Lcom/samsung/android/settings/deviceinfo/aboutphone/KnoxGuardPreferenceController;

    invoke-direct {v1, p0}, Lcom/android/settingslib/core/AbstractPreferenceController;-><init>(Landroid/content/Context;)V

    iput-object p0, v1, Lcom/samsung/android/settings/deviceinfo/aboutphone/KnoxGuardPreferenceController;->mContext:Landroid/content/Context;

    if-eqz p2, :cond_0

    invoke-virtual {p2, v1}, Lcom/android/settingslib/core/lifecycle/Lifecycle;->addObserver(Landroidx/lifecycle/LifecycleObserver;)V

    :cond_0
    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/samsung/android/settings/deviceinfo/aboutphone/DeviceInfoHeaderPreferenceController;

    invoke-direct {v1, p0}, Lcom/android/settingslib/core/AbstractPreferenceController;-><init>(Landroid/content/Context;)V

    const/4 v2, 0x0

    iput-boolean v2, v1, Lcom/samsung/android/settings/deviceinfo/aboutphone/DeviceInfoHeaderPreferenceController;->mHasEditDeviceNameExtra:Z

    iput-object p0, v1, Lcom/samsung/android/settings/deviceinfo/aboutphone/DeviceInfoHeaderPreferenceController;->mContext:Landroid/content/Context;

    iput-object p3, v1, Lcom/samsung/android/settings/deviceinfo/aboutphone/DeviceInfoHeaderPreferenceController;->mActivity:Landroid/app/Activity;

    iput-object p1, v1, Lcom/samsung/android/settings/deviceinfo/aboutphone/DeviceInfoHeaderPreferenceController;->mFragment:Lcom/samsung/android/settings/deviceinfo/aboutphone/SecMyDeviceInfoFragment;

    new-instance p1, Lcom/samsung/android/settings/deviceinfo/aboutphone/DeviceNameManager;

    invoke-direct {p1, p0}, Lcom/samsung/android/settings/deviceinfo/aboutphone/DeviceNameManager;-><init>(Landroid/content/Context;)V

    iput-object p1, v1, Lcom/samsung/android/settings/deviceinfo/aboutphone/DeviceInfoHeaderPreferenceController;->mDeviceNameManager:Lcom/samsung/android/settings/deviceinfo/aboutphone/DeviceNameManager;

    if-eqz p2, :cond_1

    invoke-virtual {p2, v1}, Lcom/android/settingslib/core/lifecycle/Lifecycle;->addObserver(Landroidx/lifecycle/LifecycleObserver;)V

    :cond_1
    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method


# virtual methods
.method public final createPreferenceControllers(Landroid/content/Context;)Ljava/util/List;
    .locals 2

    invoke-virtual {p0}, Lcom/android/settings/core/ObservablePreferenceFragment;->getSettingsLifecycle()Lcom/android/settingslib/core/lifecycle/Lifecycle;

    move-result-object v0

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    invoke-static {p1, p0, v0, v1}, Lcom/samsung/android/settings/deviceinfo/aboutphone/SecMyDeviceInfoFragment;->buildPreferenceControllers(Landroid/content/Context;Lcom/samsung/android/settings/deviceinfo/aboutphone/SecMyDeviceInfoFragment;Lcom/android/settingslib/core/lifecycle/Lifecycle;Landroidx/fragment/app/FragmentActivity;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public final getLogTag()Ljava/lang/String;
    .locals 0

    const-string/jumbo p0, "SecMyDeviceInfoFragment"

    return-object p0
.end method

.method public final getMetricsCategory()I
    .locals 0

    const/16 p0, 0x28

    return p0
.end method

.method public final getPreferenceScreenResId()I
    .locals 0

    const p0, 0x7f18023c

    return p0
.end method

.method public final onAttach(Landroid/content/Context;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/samsung/android/settings/dynamicmenu/SecDynamicFragment;->onAttach(Landroid/content/Context;)V

    const-class p1, Lcom/samsung/android/settings/deviceinfo/aboutphone/DeviceInfoHeaderPreferenceController;

    invoke-virtual {p0, p1}, Lcom/android/settings/dashboard/DashboardFragment;->use(Ljava/lang/Class;)Lcom/android/settingslib/core/AbstractPreferenceController;

    move-result-object p1

    check-cast p1, Lcom/samsung/android/settings/deviceinfo/aboutphone/DeviceInfoHeaderPreferenceController;

    iput-object p1, p0, Lcom/samsung/android/settings/deviceinfo/aboutphone/SecMyDeviceInfoFragment;->mDeviceInfoHeaderPreferenceController:Lcom/samsung/android/settings/deviceinfo/aboutphone/DeviceInfoHeaderPreferenceController;

    return-void
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/android/settings/SettingsPreferenceFragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    const-string/jumbo p1, "SecMyDeviceInfoFragment"

    const-string/jumbo v0, "onConfigurationChanged"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p0, p0, Lcom/samsung/android/settings/deviceinfo/aboutphone/SecMyDeviceInfoFragment;->mDeviceInfoHeaderPreferenceController:Lcom/samsung/android/settings/deviceinfo/aboutphone/DeviceInfoHeaderPreferenceController;

    if-eqz p0, :cond_1

    iget-object p0, p0, Lcom/samsung/android/settings/deviceinfo/aboutphone/DeviceInfoHeaderPreferenceController;->mDeviceInfoHeader:Lcom/samsung/android/settings/deviceinfo/aboutphone/DeviceInfoHeader;

    if-nez p0, :cond_0

    const-string p0, "DeviceInfoHeaderPreferenceController"

    const-string p1, "Fail to update UI"

    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/samsung/android/settings/deviceinfo/aboutphone/DeviceInfoHeader;->initInfoChart()V

    :cond_1
    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .locals 6

    invoke-super {p0, p1}, Lcom/android/settings/dashboard/DashboardFragment;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Activity;->getBaseContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/samsung/android/settings/deviceinfo/aboutphone/SecMyDeviceInfoFragment;->mContext:Landroid/content/Context;

    invoke-static {p1}, Lcom/samsung/android/settings/deviceinfo/aboutphone/DeviceImageFileUtils;->isImageFileExist(Landroid/content/Context;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/io/File;

    invoke-static {p1}, Lcom/samsung/android/settings/deviceinfo/aboutphone/DeviceImageFileUtils;->getImageFilePath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result p1

    if-eqz p1, :cond_2

    invoke-virtual {v0}, Ljava/io/File;->lastModified()J

    move-result-wide v2

    const-wide/32 v4, 0x5265c00

    add-long/2addr v2, v4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    cmp-long p1, v2, v4

    if-gez p1, :cond_2

    const-string p1, "DeviceImageFileUtils"

    const-string v0, "Image File is older than a day"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    new-instance p1, Lcom/samsung/android/settings/deviceinfo/aboutphone/DeviceImageManager;

    iget-object v0, p0, Lcom/samsung/android/settings/deviceinfo/aboutphone/SecMyDeviceInfoFragment;->mContext:Landroid/content/Context;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    new-instance v2, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v2, p1, Lcom/samsung/android/settings/deviceinfo/aboutphone/DeviceImageManager;->mMainHandler:Landroid/os/Handler;

    const-string/jumbo v2, "ril.product_code"

    invoke-static {v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p1, Lcom/samsung/android/settings/deviceinfo/aboutphone/DeviceImageManager;->mModelCode:Ljava/lang/String;

    iput-object v0, p1, Lcom/samsung/android/settings/deviceinfo/aboutphone/DeviceImageManager;->mContext:Landroid/content/Context;

    new-instance v2, Lcom/samsung/sca/odm/dos/product/ScaProduct;

    const-string/jumbo v3, "Product"

    invoke-direct {v2, v0, v3}, Lcom/samsung/sca/odm/dos/common/AbstractScaOdmApi;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v2, p1, Lcom/samsung/android/settings/deviceinfo/aboutphone/DeviceImageManager;->mScaProduct:Lcom/samsung/sca/odm/dos/product/ScaProduct;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    iput-object p1, p0, Lcom/samsung/android/settings/deviceinfo/aboutphone/SecMyDeviceInfoFragment;->mDeviceImageManager:Lcom/samsung/android/settings/deviceinfo/aboutphone/DeviceImageManager;

    new-instance v2, Lcom/samsung/android/settings/deviceinfo/aboutphone/SecMyDeviceInfoFragment$$ExternalSyntheticLambda0;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object p0, v2, Lcom/samsung/android/settings/deviceinfo/aboutphone/SecMyDeviceInfoFragment$$ExternalSyntheticLambda0;->f$0:Lcom/samsung/android/settings/deviceinfo/aboutphone/SecMyDeviceInfoFragment;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    const-string v3, "DeviceImageManager"

    const-string/jumbo v4, "register Device Image Receiver"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput-object v2, p1, Lcom/samsung/android/settings/deviceinfo/aboutphone/DeviceImageManager;->mListener:Lcom/samsung/android/settings/deviceinfo/aboutphone/SecMyDeviceInfoFragment$$ExternalSyntheticLambda0;

    const-string/jumbo v2, "com.samsung.android.scpm.product.UPDATE.s5d189ajvs"

    invoke-static {v2}, Landroidx/appcompat/app/AlertDialog$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Landroid/content/IntentFilter;

    move-result-object v2

    iget-object v3, p1, Lcom/samsung/android/settings/deviceinfo/aboutphone/DeviceImageManager;->mDeviceImageReceiver:Lcom/samsung/android/settings/deviceinfo/aboutphone/DeviceImageManager$1;

    if-nez v3, :cond_1

    new-instance v3, Lcom/samsung/android/settings/deviceinfo/aboutphone/DeviceImageManager$1;

    invoke-direct {v3, p1}, Lcom/samsung/android/settings/deviceinfo/aboutphone/DeviceImageManager$1;-><init>(Lcom/samsung/android/settings/deviceinfo/aboutphone/DeviceImageManager;)V

    iput-object v3, p1, Lcom/samsung/android/settings/deviceinfo/aboutphone/DeviceImageManager;->mDeviceImageReceiver:Lcom/samsung/android/settings/deviceinfo/aboutphone/DeviceImageManager$1;

    :cond_1
    const/4 p1, 0x2

    invoke-virtual {v0, v3, v2, p1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    iget-object p1, p0, Lcom/samsung/android/settings/deviceinfo/aboutphone/SecMyDeviceInfoFragment;->mDeviceImageManager:Lcom/samsung/android/settings/deviceinfo/aboutphone/DeviceImageManager;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lcom/samsung/android/settings/deviceinfo/aboutphone/DeviceImageManager$$ExternalSyntheticLambda0;

    invoke-direct {v0, v1}, Lcom/samsung/android/settings/deviceinfo/aboutphone/DeviceImageManager$$ExternalSyntheticLambda0;-><init>(B)V

    iput-object p1, v0, Lcom/samsung/android/settings/deviceinfo/aboutphone/DeviceImageManager$$ExternalSyntheticLambda0;->f$0:Lcom/samsung/android/settings/deviceinfo/aboutphone/DeviceImageManager;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    new-instance p1, Ljava/lang/Thread;

    new-instance v2, Lcom/samsung/android/settings/deviceinfo/aboutphone/DeviceImageManager$$ExternalSyntheticLambda1;

    invoke-direct {v2, v1}, Lcom/samsung/android/settings/deviceinfo/aboutphone/DeviceImageManager$$ExternalSyntheticLambda1;-><init>(B)V

    iput-object v0, v2, Lcom/samsung/android/settings/deviceinfo/aboutphone/DeviceImageManager$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    const-string/jumbo v0, "requestDeviceImage"

    iput-object v0, v2, Lcom/samsung/android/settings/deviceinfo/aboutphone/DeviceImageManager$$ExternalSyntheticLambda1;->f$1:Ljava/lang/Object;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-direct {p1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    :cond_2
    invoke-virtual {p0, v1}, Lcom/android/settings/SettingsPreferenceFragment;->setAutoRemoveInsetCategory(Z)V

    return-void
.end method

.method public final onDestroy()V
    .locals 3

    invoke-super {p0}, Lcom/android/settings/SettingsPreferenceFragment;->onDestroy()V

    iget-object p0, p0, Lcom/samsung/android/settings/deviceinfo/aboutphone/SecMyDeviceInfoFragment;->mDeviceImageManager:Lcom/samsung/android/settings/deviceinfo/aboutphone/DeviceImageManager;

    if-eqz p0, :cond_1

    iget-object v0, p0, Lcom/samsung/android/settings/deviceinfo/aboutphone/DeviceImageManager;->mDeviceImageReceiver:Lcom/samsung/android/settings/deviceinfo/aboutphone/DeviceImageManager$1;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v2, p0, Lcom/samsung/android/settings/deviceinfo/aboutphone/DeviceImageManager;->mContext:Landroid/content/Context;

    invoke-virtual {v2, v0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    iput-object v1, p0, Lcom/samsung/android/settings/deviceinfo/aboutphone/DeviceImageManager;->mDeviceImageReceiver:Lcom/samsung/android/settings/deviceinfo/aboutphone/DeviceImageManager$1;

    :cond_0
    iput-object v1, p0, Lcom/samsung/android/settings/deviceinfo/aboutphone/DeviceImageManager;->mListener:Lcom/samsung/android/settings/deviceinfo/aboutphone/SecMyDeviceInfoFragment$$ExternalSyntheticLambda0;

    iget-object p0, p0, Lcom/samsung/android/settings/deviceinfo/aboutphone/DeviceImageManager;->mMainHandler:Landroid/os/Handler;

    invoke-virtual {p0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    :cond_1
    return-void
.end method

.method public final onResume()V
    .locals 8

    invoke-super {p0}, Lcom/samsung/android/settings/dynamicmenu/SecDynamicFragment;->onResume()V

    invoke-static {p0}, Lcom/android/settings/OneROMHelper;->initAboutBanner(Landroidx/preference/PreferenceFragmentCompat;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    invoke-static {}, Lcom/samsung/android/settings/Rune;->supportRelativeLink()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/samsung/android/settings/deviceinfo/aboutphone/SecMyDeviceInfoFragment;->mRelativeLinkView:Lcom/samsung/android/settings/widget/SecRelativeLinkView;

    if-nez v0, :cond_3

    new-instance v0, Lcom/samsung/android/settings/widget/SecRelativeLinkView;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/samsung/android/settings/widget/SecRelativeLinkView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/samsung/android/settings/deviceinfo/aboutphone/SecMyDeviceInfoFragment;->mRelativeLinkView:Lcom/samsung/android/settings/widget/SecRelativeLinkView;

    iget-object v1, p0, Lcom/samsung/android/settings/deviceinfo/aboutphone/SecMyDeviceInfoFragment;->mContext:Landroid/content/Context;

    :try_start_0
    invoke-static {v1}, Lcom/samsung/android/settings/softwareupdate/SoftwareUpdateVariant;->get(Landroid/content/Context;)Lcom/samsung/android/settings/softwareupdate/SoftwareUpdateVariant;

    move-result-object v1

    invoke-virtual {v1}, Lcom/samsung/android/settings/softwareupdate/SoftwareUpdateVariant;->intent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v1}, Lcom/samsung/android/settings/softwareupdate/SoftwareUpdateVariant;->topLevelKey()Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v3, 0x1

    goto :goto_0

    :catch_0
    move-exception v1

    const-string/jumbo v2, "SoftwareUpdateLinkData"

    const-string/jumbo v3, "failed to initialize"

    invoke-static {v2, v3, v1}, Lcom/samsung/android/util/SemLog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v1, v2

    :goto_0
    const/16 v4, 0x28

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/samsung/android/settings/deviceinfo/aboutphone/SecMyDeviceInfoFragment;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/samsung/android/settings/softwareupdate/SoftwareUpdateUtils;->needSoftwareUpdateBlockonDexMode(Landroid/content/Context;)Z

    move-result v3

    if-nez v3, :cond_0

    new-instance v3, Lcom/samsung/android/settings/SettingsPreferenceFragmentLinkData;

    invoke-direct {v3}, Lcom/samsung/android/settings/SettingsPreferenceFragmentLinkData;-><init>()V

    const-string v5, "95020"

    iput-object v5, v3, Lcom/samsung/android/settings/SettingsPreferenceFragmentLinkData;->flowId:Ljava/lang/String;

    iput v4, v3, Lcom/samsung/android/settings/SettingsPreferenceFragmentLinkData;->callerMetric:I

    new-instance v5, Landroid/os/Bundle;

    invoke-direct {v5}, Landroid/os/Bundle;-><init>()V

    const-string v6, ":settings:fragment_args_key"

    const-string/jumbo v7, "key_update"

    invoke-virtual {v5, v6, v7}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v6, ":settings:show_fragment_args"

    invoke-virtual {v2, v6, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    iput-object v2, v3, Lcom/samsung/android/settings/SettingsPreferenceFragmentLinkData;->intent:Landroid/content/Intent;

    iput-object v1, v3, Lcom/samsung/android/settings/SettingsPreferenceFragmentLinkData;->topLevelKey:Ljava/lang/String;

    const v1, 0x7f1533d8

    iput v1, v3, Lcom/samsung/android/settings/SettingsPreferenceFragmentLinkData;->titleRes:I

    invoke-virtual {v0, v3}, Lcom/samsung/android/settings/widget/SecRelativeLinkView;->pushLinkData(Lcom/samsung/android/settings/SettingsPreferenceFragmentLinkData;)Landroid/view/View;

    :cond_0
    iget-object v0, p0, Lcom/samsung/android/settings/deviceinfo/aboutphone/SecMyDeviceInfoFragment;->mRelativeLinkView:Lcom/samsung/android/settings/widget/SecRelativeLinkView;

    iget-object v1, p0, Lcom/samsung/android/settings/deviceinfo/aboutphone/SecMyDeviceInfoFragment;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/samsung/android/settings/Rune;->isShopDemo(Landroid/content/Context;)Z

    move-result v1

    const-string/jumbo v2, "top_level_general"

    if-nez v1, :cond_1

    invoke-static {}, Lcom/samsung/android/settings/Rune;->isLDUOLDModel()Z

    move-result v1

    if-nez v1, :cond_1

    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v1

    iget-object v3, p0, Lcom/samsung/android/settings/deviceinfo/aboutphone/SecMyDeviceInfoFragment;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/samsung/android/settings/SecUserUtil;->getMainUserId(Landroid/content/Context;)I

    move-result v3

    if-ne v1, v3, :cond_1

    const/16 v1, 0x1000

    invoke-static {v1}, Lcom/samsung/android/settings/knox/KnoxUtils;->checkKnoxCustomSettingsHiddenItem(I)Z

    move-result v1

    if-nez v1, :cond_1

    new-instance v1, Lcom/samsung/android/settings/SettingsPreferenceFragmentLinkData;

    invoke-direct {v1}, Lcom/samsung/android/settings/SettingsPreferenceFragmentLinkData;-><init>()V

    const-string v3, "9025"

    iput-object v3, v1, Lcom/samsung/android/settings/SettingsPreferenceFragmentLinkData;->flowId:Ljava/lang/String;

    iput v4, v1, Lcom/samsung/android/settings/SettingsPreferenceFragmentLinkData;->callerMetric:I

    new-instance v3, Landroid/content/Intent;

    invoke-direct {v3}, Landroid/content/Intent;-><init>()V

    const-string/jumbo v5, "com.android.settings"

    const-string/jumbo v6, "com.android.settings.Settings$ResetDashboardFragmentActivity"

    invoke-virtual {v3, v5, v6}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string/jumbo v5, "menu"

    const-string/jumbo v6, "reset"

    invoke-virtual {v3, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iput-object v3, v1, Lcom/samsung/android/settings/SettingsPreferenceFragmentLinkData;->intent:Landroid/content/Intent;

    const v3, 0x7f15292d

    iput v3, v1, Lcom/samsung/android/settings/SettingsPreferenceFragmentLinkData;->titleRes:I

    iput-object v2, v1, Lcom/samsung/android/settings/SettingsPreferenceFragmentLinkData;->topLevelKey:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/samsung/android/settings/widget/SecRelativeLinkView;->pushLinkData(Lcom/samsung/android/settings/SettingsPreferenceFragmentLinkData;)Landroid/view/View;

    :cond_1
    iget-object v0, p0, Lcom/samsung/android/settings/deviceinfo/aboutphone/SecMyDeviceInfoFragment;->mRelativeLinkView:Lcom/samsung/android/settings/widget/SecRelativeLinkView;

    iget-object v1, p0, Lcom/samsung/android/settings/deviceinfo/aboutphone/SecMyDeviceInfoFragment;->mContext:Landroid/content/Context;

    const-wide/32 v5, 0xa220268

    invoke-static {v1, v5, v6}, Lcom/android/settings/Utils;->isSupportContactUs(Landroid/content/Context;J)Z

    move-result v1

    if-eqz v1, :cond_2

    new-instance v1, Lcom/samsung/android/settings/SettingsPreferenceFragmentLinkData;

    invoke-direct {v1}, Lcom/samsung/android/settings/SettingsPreferenceFragmentLinkData;-><init>()V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v3

    invoke-static {v3}, Lcom/android/settings/Utils;->getContactUsIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v3

    const-string v5, "9026"

    iput-object v5, v1, Lcom/samsung/android/settings/SettingsPreferenceFragmentLinkData;->flowId:Ljava/lang/String;

    iput v4, v1, Lcom/samsung/android/settings/SettingsPreferenceFragmentLinkData;->callerMetric:I

    iput-object v3, v1, Lcom/samsung/android/settings/SettingsPreferenceFragmentLinkData;->intent:Landroid/content/Intent;

    iput-object v2, v1, Lcom/samsung/android/settings/SettingsPreferenceFragmentLinkData;->topLevelKey:Ljava/lang/String;

    const v2, 0x7f150e88

    iput v2, v1, Lcom/samsung/android/settings/SettingsPreferenceFragmentLinkData;->titleRes:I

    invoke-virtual {v0, v1}, Lcom/samsung/android/settings/widget/SecRelativeLinkView;->pushLinkData(Lcom/samsung/android/settings/SettingsPreferenceFragmentLinkData;)Landroid/view/View;

    :cond_2
    iget-object v0, p0, Lcom/samsung/android/settings/deviceinfo/aboutphone/SecMyDeviceInfoFragment;->mRelativeLinkView:Lcom/samsung/android/settings/widget/SecRelativeLinkView;

    invoke-virtual {v0, p0}, Lcom/samsung/android/settings/widget/SecRelativeLinkView;->create(Ljava/lang/Object;)V

    :cond_3
    return-void
.end method

.method public final onStart()V
    .locals 0

    invoke-super {p0}, Lcom/android/settings/dashboard/DashboardFragment;->onStart()V

    invoke-static {p0}, Lcom/android/settings/OneROMHelper;->initAboutBanner(Landroidx/preference/PreferenceFragmentCompat;)V

    return-void
.end method
