.class public Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManagerPreferenceController;
.super Lcom/samsung/android/settings/homepage/TopLevelPreferenceController;
.source "qb/116059356 19e18cb65cd8c1b783c717bee809f29f548ee6c45e9e1aeeae375887cddbc863"

# interfaces
.implements Lcom/android/settingslib/core/lifecycle/LifecycleObserver;
.implements Lcom/android/settingslib/core/lifecycle/events/OnCreate;
.implements Lcom/android/settingslib/core/lifecycle/events/OnResume;
.implements Lcom/android/settingslib/core/lifecycle/events/OnPause;
.implements Lcom/android/settingslib/core/lifecycle/events/OnDestroy;


# static fields
.field private static final TAG:Ljava/lang/String; = "EarbudsMenu_TopLevelBudsUniteManagerPreferenceController"


# instance fields
.field private hasBudsUnitePackage:Z

.field private mContext:Landroid/content/Context;

.field private mPreference:Landroidx/preference/Preference;

.field private mRunnable:Ljava/lang/Runnable;

.field private mScreen:Landroidx/preference/PreferenceScreen;

.field private final packageName:Ljava/lang/String;


# direct methods
.method public static synthetic $r8$lambda$3XGvY4jV7xumVNdWa9uInTq7H9s(Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManagerPreferenceController;Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManagerPreferenceController;->lambda$showBudsItem$0(Landroidx/preference/Preference;)V

    return-void
.end method

.method public static bridge synthetic -$$Nest$fgethasBudsUnitePackage(Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManagerPreferenceController;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManagerPreferenceController;->hasBudsUnitePackage:Z

    return p0
.end method

.method public static bridge synthetic -$$Nest$fgetmContext(Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManagerPreferenceController;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManagerPreferenceController;->mContext:Landroid/content/Context;

    return-object p0
.end method

.method public static bridge synthetic -$$Nest$fgetmPreference(Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManagerPreferenceController;)Landroidx/preference/Preference;
    .locals 0

    iget-object p0, p0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManagerPreferenceController;->mPreference:Landroidx/preference/Preference;

    return-object p0
.end method

.method public static bridge synthetic -$$Nest$fgetmRunnable(Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManagerPreferenceController;)Ljava/lang/Runnable;
    .locals 0

    iget-object p0, p0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManagerPreferenceController;->mRunnable:Ljava/lang/Runnable;

    return-object p0
.end method

.method public static bridge synthetic -$$Nest$mshowBudsItem(Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManagerPreferenceController;Landroidx/preference/Preference;Landroid/bluetooth/BluetoothDevice;Landroid/bluetooth/BluetoothDevice;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManagerPreferenceController;->showBudsItem(Landroidx/preference/Preference;Landroid/bluetooth/BluetoothDevice;Landroid/bluetooth/BluetoothDevice;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3

    invoke-direct {p0, p1, p2}, Lcom/samsung/android/settings/homepage/TopLevelPreferenceController;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    const-string v0, "com.samsung.accessory.budsunitemgr"

    iput-object v0, p0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManagerPreferenceController;->packageName:Ljava/lang/String;

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManagerPreferenceController;->hasBudsUnitePackage:Z

    new-instance v1, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManagerPreferenceController$1;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object p0, v1, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManagerPreferenceController$1;->this$0:Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManagerPreferenceController;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    iput-object v1, p0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManagerPreferenceController;->mRunnable:Ljava/lang/Runnable;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "onCreate key = "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v1, "EarbudsMenu_TopLevelBudsUniteManagerPreferenceController"

    invoke-static {v1, p2}, Lcom/samsung/android/util/SemLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManagerPreferenceController;->mContext:Landroid/content/Context;

    invoke-static {p1, v0}, Lcom/samsung/android/settings/PkgUtils;->hasPackage(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManagerPreferenceController;->hasBudsUnitePackage:Z

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "onCreate hasBudsUnitePackage = "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean p0, p0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManagerPreferenceController;->hasBudsUnitePackage:Z

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/samsung/android/util/SemLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private lambda$showBudsItem$0(Landroidx/preference/Preference;)V
    .locals 1

    iget-object v0, p0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManagerPreferenceController;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->getInstance(Landroid/content/Context;)Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;

    move-result-object v0

    iget-boolean v0, v0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->mIsShowBudsMenu:Z

    invoke-virtual {p1, v0}, Landroidx/preference/Preference;->setVisible(Z)V

    iget-object p0, p0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManagerPreferenceController;->mScreen:Landroidx/preference/PreferenceScreen;

    invoke-static {p0}, Lcom/samsung/android/settings/homepage/HomepageUtils;->updateBudsUniteInsetCategories(Landroidx/preference/PreferenceScreen;)V

    return-void
.end method

.method private showBudsItem(Landroidx/preference/Preference;Landroid/bluetooth/BluetoothDevice;Landroid/bluetooth/BluetoothDevice;)V
    .locals 8

    instance-of v0, p1, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;

    if-eqz v0, :cond_7

    move-object v0, p1

    check-cast v0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, " showBudsItem() device = "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz p2, :cond_0

    move v4, v3

    goto :goto_0

    :cond_0
    move v4, v2

    :goto_0
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v4, " device = "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p3, :cond_1

    move v5, v3

    goto :goto_1

    :cond_1
    move v5, v2

    :goto_1
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v5, "EarbudsMenu_TopLevelBudsUniteManagerPreferenceController"

    invoke-static {v5, v1}, Lcom/samsung/android/util/SemLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, v0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, " setBudsData() device = "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    if-eqz p2, :cond_2

    move v7, v3

    goto :goto_2

    :cond_2
    move v7, v2

    :goto_2
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p3, :cond_3

    move v4, v3

    goto :goto_3

    :cond_3
    move v4, v2

    :goto_3
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Lcom/samsung/android/util/SemLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    iput-object p2, v0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mDevice1:Landroid/bluetooth/BluetoothDevice;

    iput-object p3, v0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mDevice2:Landroid/bluetooth/BluetoothDevice;

    iget-object v1, v0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->lnBudsAllLayout:Landroid/widget/LinearLayout;

    if-nez v1, :cond_4

    goto :goto_4

    :cond_4
    iget-object v1, v0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mUpdateHandler:Landroid/os/Handler;

    new-instance v4, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference$$ExternalSyntheticLambda0;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    iput-object v0, v4, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference$$ExternalSyntheticLambda0;->f$0:Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {v1, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_4
    if-nez p2, :cond_5

    if-eqz p3, :cond_6

    :cond_5
    move v2, v3

    :cond_6
    iget-object p2, p0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManagerPreferenceController;->mContext:Landroid/content/Context;

    invoke-static {p2}, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->getInstance(Landroid/content/Context;)Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;

    move-result-object p2

    iget-boolean p2, p2, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->mIsShowBudsMenu:Z

    new-instance p3, Ljava/lang/StringBuilder;

    const-string v0, " showBudsItem() isShowBudsMenu = "

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v0, " currentShowBudsMenu = "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {v5, p3}, Lcom/samsung/android/util/SemLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-eq p2, v2, :cond_7

    iget-object p2, p0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManagerPreferenceController;->mContext:Landroid/content/Context;

    invoke-static {p2}, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->getInstance(Landroid/content/Context;)Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;

    move-result-object p2

    iput-boolean v2, p2, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->mIsShowBudsMenu:Z

    new-instance p2, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManagerPreferenceController$$ExternalSyntheticLambda0;

    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    iput-object p0, p2, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManagerPreferenceController$$ExternalSyntheticLambda0;->f$0:Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManagerPreferenceController;

    check-cast p1, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;

    iput-object p1, p2, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManagerPreferenceController$$ExternalSyntheticLambda0;->f$1:Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-static {p2}, Lcom/android/settingslib/utils/ThreadUtils;->postOnMainThread(Ljava/lang/Runnable;)V

    :cond_7
    return-void
.end method


# virtual methods
.method public displayPreference(Landroidx/preference/PreferenceScreen;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/samsung/android/settings/homepage/TopLevelPreferenceController;->displayPreference(Landroidx/preference/PreferenceScreen;)V

    const-string v0, " displayPreference"

    const-string v1, "EarbudsMenu_TopLevelBudsUniteManagerPreferenceController"

    invoke-static {v1, v0}, Lcom/samsung/android/util/SemLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput-object p1, p0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManagerPreferenceController;->mScreen:Landroidx/preference/PreferenceScreen;

    invoke-virtual {p0}, Lcom/android/settings/core/BasePreferenceController;->getPreferenceKey()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceGroup;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object p1

    iput-object p1, p0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManagerPreferenceController;->mPreference:Landroidx/preference/Preference;

    const-string p0, " displayPreference done"

    invoke-static {v1, p0}, Lcom/samsung/android/util/SemLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public bridge synthetic getAsyncDBUri()Landroid/net/Uri;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getAvailabilityStatus()I
    .locals 1

    const/4 v0, 0x3

    return v0
.end method

.method public bridge synthetic getBackgroundWorkerClass()Ljava/lang/Class;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public bridge synthetic getBackupKeys()Ljava/util/List;
    .locals 0

    invoke-super {p0}, Lcom/samsung/android/settings/homepage/TopLevelPreferenceController;->getBackupKeys()Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic getIntentFilter()Landroid/content/IntentFilter;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public bridge synthetic getLaunchIntent()Landroid/content/Intent;
    .locals 0

    invoke-super {p0}, Lcom/samsung/android/settings/homepage/TopLevelPreferenceController;->getLaunchIntent()Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method public getRequestCode()I
    .locals 0

    const/high16 p0, 0x10000

    return p0
.end method

.method public getSaLoggingId()I
    .locals 0

    const/16 p0, 0x2580

    return p0
.end method

.method public bridge synthetic getSliceHighlightMenuRes()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public bridge synthetic getStatusText()Ljava/lang/String;
    .locals 0

    invoke-super {p0}, Lcom/samsung/android/settings/homepage/TopLevelPreferenceController;->getStatusText()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic getValue()Lcom/samsung/android/settings/cube/ControlValue;
    .locals 0

    invoke-super {p0}, Lcom/samsung/android/settings/homepage/TopLevelPreferenceController;->getValue()Lcom/samsung/android/settings/cube/ControlValue;

    move-result-object p0

    return-object p0
.end method

.method public handlePreferenceTreeClick(Landroidx/preference/Preference;)Z
    .locals 3

    invoke-virtual {p1}, Landroidx/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, " handlePreferenceTreeClick item "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "EarbudsMenu_TopLevelBudsUniteManagerPreferenceController"

    invoke-static {v2, v1}, Lcom/samsung/android/util/SemLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, p0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManagerPreferenceController;->mPreference:Landroidx/preference/Preference;

    check-cast v1, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;

    invoke-virtual {p0}, Lcom/android/settings/core/BasePreferenceController;->getPreferenceKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    iget-object v0, p0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManagerPreferenceController;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->getInstance(Landroid/content/Context;)Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;

    move-result-object v0

    const-string v2, ""

    invoke-virtual {v0, v2}, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->setFocusEarbuds(Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->updateFocusState()V

    invoke-super {p0, p1}, Lcom/samsung/android/settings/homepage/TopLevelPreferenceController;->handlePreferenceTreeClick(Landroidx/preference/Preference;)Z

    move-result p0

    return p0
.end method

.method public bridge synthetic hasAsyncDBUpdate()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public bridge synthetic hasAsyncUpdate()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public bridge synthetic ignoreUserInteraction()V
    .locals 0

    invoke-super {p0}, Lcom/samsung/android/settings/homepage/TopLevelPreferenceController;->ignoreUserInteraction()V

    return-void
.end method

.method public bridge synthetic isControllable()Z
    .locals 0

    invoke-super {p0}, Lcom/samsung/android/settings/homepage/TopLevelPreferenceController;->isControllable()Z

    move-result p0

    return p0
.end method

.method public bridge synthetic isPublicSlice()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public bridge synthetic isSliceable()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public bridge synthetic needUserInteraction(Ljava/lang/Object;)Lcom/samsung/android/settings/cube/Controllable$ControllableType;
    .locals 0

    invoke-super {p0, p1}, Lcom/samsung/android/settings/homepage/TopLevelPreferenceController;->needUserInteraction(Ljava/lang/Object;)Lcom/samsung/android/settings/cube/Controllable$ControllableType;

    move-result-object p0

    return-object p0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 8

    iget-boolean p1, p0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManagerPreferenceController;->hasBudsUnitePackage:Z

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManagerPreferenceController;->mContext:Landroid/content/Context;

    invoke-static {p1}, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->getInstance(Landroid/content/Context;)Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;

    move-result-object p1

    iget-object v0, p0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManagerPreferenceController;->mRunnable:Ljava/lang/Runnable;

    iget-object p1, p1, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->mRunnableList:Ljava/util/List;

    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object p0, p0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManagerPreferenceController;->mContext:Landroid/content/Context;

    invoke-static {p0}, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->getInstance(Landroid/content/Context;)Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string p1, "onCreate"

    const-string v1, "EarbudsMenu_TopLevelBudsUniteManager"

    invoke-static {v1, p1}, Lcom/samsung/android/util/SemLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string p1, "onCreate.TopLevelBudsUniteManagerPreferenceController"

    invoke-static {p1}, Lcom/samsung/android/settings/Trace;->beginSection(Ljava/lang/String;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->mBluetoothHeadset:Landroid/bluetooth/BluetoothHeadset;

    iput-object p1, p0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->mBluetoothA2dp:Landroid/bluetooth/BluetoothA2dp;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->isNeedUpdate:Z

    iput-boolean p1, p0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->isShowed:Z

    iget-object v0, p0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->mContext:Landroid/content/Context;

    const-string v2, "BudsUnite"

    invoke-virtual {v0, v2, p1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->prefs:Landroid/content/SharedPreferences;

    const-string v2, "PREFS_FIRST_TIME_SHOW_EARBUDS"

    invoke-interface {v0, v2, p1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    iput-boolean p1, p0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->isNeedToShowVI:Z

    iget-object p1, p0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->prefs:Landroid/content/SharedPreferences;

    const-string v0, "PREFS_FOCUS_EARBUDS"

    const-string v2, ""

    invoke-interface {p1, v0, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->mDeviceFocus:Ljava/lang/String;

    new-instance p1, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager$3;

    iget-object v0, p0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p1, p0, v0}, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager$3;-><init>(Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->mUpdateHandler:Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager$3;

    :try_start_0
    new-instance v4, Landroid/content/IntentFilter;

    invoke-direct {v4}, Landroid/content/IntentFilter;-><init>()V

    const-string p1, "android.bluetooth.device.action.ACL_CONNECTED"

    invoke-virtual {v4, p1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string p1, "android.bluetooth.device.action.ACL_DISCONNECTED"

    invoke-virtual {v4, p1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string p1, "android.bluetooth.device.action.BOND_STATE_CHANGED"

    invoke-virtual {v4, p1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string p1, "android.bluetooth.adapter.action.STATE_CHANGED"

    invoke-virtual {v4, p1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string p1, "android.bluetooth.device.action.ALIAS_CHANGED"

    invoke-virtual {v4, p1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->mBluetoothReceiver:Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager$2;

    const/4 v6, 0x0

    const/4 v7, 0x2

    const/4 v5, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;I)Landroid/content/Intent;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    move-object p0, v0

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "register callback failed."

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/samsung/android/util/SemLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    invoke-static {}, Lcom/samsung/android/settings/Trace;->endSection()V

    const-string p0, "onCreate done"

    invoke-static {v1, p0}, Lcom/samsung/android/util/SemLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    return-void
.end method

.method public onDestroy()V
    .locals 5

    const-string v0, "EarbudsMenu_TopLevelBudsUniteManagerPreferenceController"

    const-string v1, " OnDestroy "

    invoke-static {v0, v1}, Lcom/samsung/android/util/SemLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-boolean v0, p0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManagerPreferenceController;->hasBudsUnitePackage:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManagerPreferenceController;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->getInstance(Landroid/content/Context;)Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;

    move-result-object v0

    iget-object v2, p0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManagerPreferenceController;->mRunnable:Ljava/lang/Runnable;

    iget-object v0, v0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->mRunnableList:Ljava/util/List;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManagerPreferenceController;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->getInstance(Landroid/content/Context;)Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v2, "onDestroy size = "

    :try_start_0
    const-string v3, "EarbudsMenu_TopLevelBudsUniteManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, v0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->mRunnableList:Ljava/util/List;

    check-cast v2, Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Lcom/samsung/android/util/SemLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v2, v0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->mRunnableList:Ljava/util/List;

    check-cast v2, Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_0

    goto :goto_2

    :cond_0
    iget-object v2, v0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->bluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    if-eqz v2, :cond_1

    iget-object v3, v0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->mBluetoothHeadset:Landroid/bluetooth/BluetoothHeadset;

    if-eqz v3, :cond_1

    const/4 v4, 0x1

    invoke-virtual {v2, v4, v3}, Landroid/bluetooth/BluetoothAdapter;->closeProfileProxy(ILandroid/bluetooth/BluetoothProfile;)V

    iput-object v1, v0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->mBluetoothHeadset:Landroid/bluetooth/BluetoothHeadset;

    goto :goto_0

    :catch_0
    move-exception v0

    goto :goto_1

    :cond_1
    :goto_0
    iget-object v2, v0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->bluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    if-eqz v2, :cond_2

    iget-object v3, v0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->mBluetoothA2dp:Landroid/bluetooth/BluetoothA2dp;

    if-eqz v3, :cond_2

    const/4 v4, 0x2

    invoke-virtual {v2, v4, v3}, Landroid/bluetooth/BluetoothAdapter;->closeProfileProxy(ILandroid/bluetooth/BluetoothProfile;)V

    iput-object v1, v0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->mBluetoothA2dp:Landroid/bluetooth/BluetoothA2dp;

    :cond_2
    iget-object v2, v0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->mContext:Landroid/content/Context;

    iget-object v3, v0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->mBluetoothReceiver:Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager$2;

    invoke-virtual {v2, v3}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    iget-object v2, v0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->mUpdateHandler:Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager$3;

    const/16 v3, 0x3039

    invoke-virtual {v2, v3}, Landroid/os/Handler;->removeMessages(I)V

    iput-object v1, v0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->mDevice1:Landroid/bluetooth/BluetoothDevice;

    iput-object v1, v0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->mDevice2:Landroid/bluetooth/BluetoothDevice;

    iput-object v1, v0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->mContext:Landroid/content/Context;

    iget-object v0, v0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->mRunnableList:Ljava/util/List;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    const-class v0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;

    monitor-enter v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    sput-object v1, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->sInstance:Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;

    monitor-exit v0

    goto :goto_2

    :catchall_0
    move-exception v2

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v2
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    :goto_1
    const-string v2, "EarbudsMenu_TopLevelBudsUniteManager"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "onDestroy unregister callback failed."

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/samsung/android/util/SemLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3
    :goto_2
    iput-object v1, p0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManagerPreferenceController;->mPreference:Landroidx/preference/Preference;

    iput-object v1, p0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManagerPreferenceController;->mContext:Landroid/content/Context;

    return-void
.end method

.method public onPause()V
    .locals 2

    const-string v0, "EarbudsMenu_TopLevelBudsUniteManagerPreferenceController"

    const-string v1, " onPause "

    invoke-static {v0, v1}, Lcom/samsung/android/util/SemLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-boolean v0, p0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManagerPreferenceController;->hasBudsUnitePackage:Z

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManagerPreferenceController;->mContext:Landroid/content/Context;

    invoke-static {p0}, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->getInstance(Landroid/content/Context;)Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;

    move-result-object p0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->isStarted:Z

    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 4

    const-string v0, "EarbudsMenu_TopLevelBudsUniteManagerPreferenceController"

    const-string v1, " onResume "

    invoke-static {v0, v1}, Lcom/samsung/android/util/SemLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-boolean v0, p0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManagerPreferenceController;->hasBudsUnitePackage:Z

    if-eqz v0, :cond_2

    iget-object p0, p0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManagerPreferenceController;->mContext:Landroid/content/Context;

    invoke-static {p0}, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->getInstance(Landroid/content/Context;)Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v0, "EarbudsMenu_TopLevelBudsUniteManager"

    const-string v1, "onStart "

    invoke-static {v0, v1}, Lcom/samsung/android/util/SemLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->isStarted:Z

    iget-boolean v0, p0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->isNeedToShowVI:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->mUpdateHandler:Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager$3;

    const/16 v1, 0x303b

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    iget-object v0, p0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->mUpdateHandler:Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager$3;

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_0

    :cond_0
    iget-boolean v0, p0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->isNeedUpdate:Z

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->isNeedUpdate:Z

    invoke-virtual {p0}, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->updatePreference()V

    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->mUpdateHandler:Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager$3;

    const/16 v0, 0x303c

    const-wide/16 v1, 0x64

    invoke-virtual {p0, v0, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    :cond_2
    return-void
.end method

.method public bridge synthetic runDefaultAction()Z
    .locals 0

    invoke-super {p0}, Lcom/samsung/android/settings/homepage/TopLevelPreferenceController;->runDefaultAction()Z

    move-result p0

    return p0
.end method

.method public bridge synthetic setValue(Lcom/samsung/android/settings/cube/ControlValue;)Lcom/samsung/android/settings/cube/ControlResult;
    .locals 0

    invoke-super {p0, p1}, Lcom/samsung/android/settings/homepage/TopLevelPreferenceController;->setValue(Lcom/samsung/android/settings/cube/ControlValue;)Lcom/samsung/android/settings/cube/ControlResult;

    move-result-object p0

    return-object p0
.end method

.method public updateState(Landroidx/preference/Preference;)V
    .locals 0

    const-string p0, "EarbudsMenu_TopLevelBudsUniteManagerPreferenceController"

    const-string p1, " updateState"

    invoke-static {p0, p1}, Lcom/samsung/android/util/SemLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public bridge synthetic useDynamicSliceSummary()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method
