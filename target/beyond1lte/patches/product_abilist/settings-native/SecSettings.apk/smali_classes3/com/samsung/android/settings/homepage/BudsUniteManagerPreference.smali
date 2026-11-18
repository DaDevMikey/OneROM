.class public Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;
.super Lcom/android/settings/widget/HomepagePreference;
.source "qb/116059356 19e18cb65cd8c1b783c717bee809f29f548ee6c45e9e1aeeae375887cddbc863"


# instance fields
.field public final TAG:Ljava/lang/String;

.field public flBuds1Layout:Landroid/widget/FrameLayout;

.field public flBuds2Layout:Landroid/widget/FrameLayout;

.field public imgBudsIcon1:Landroid/widget/ImageView;

.field public imgBudsIcon2:Landroid/widget/ImageView;

.field public llBuds1Layout:Landroid/widget/LinearLayout;

.field public llBuds2Layout:Landroid/widget/LinearLayout;

.field public lnBudsAllLayout:Landroid/widget/LinearLayout;

.field public mContext:Landroid/content/Context;

.field public mCustomBackgroundEnabled:Z

.field public mDevice1:Landroid/bluetooth/BluetoothDevice;

.field public mDevice2:Landroid/bluetooth/BluetoothDevice;

.field public mHeight:I

.field public mIsTabletView:Z

.field public mIsTopViewVisible:Z

.field public mUpdateHandler:Landroid/os/Handler;

.field public rlBgLayout:Landroid/widget/RelativeLayout;

.field public tvBudsName1:Landroid/widget/TextView;

.field public tvBudsName2:Landroid/widget/TextView;

.field public viewDivider:Landroid/view/View;

.field public viewTop:Landroid/view/View;


# direct methods
.method public static -$$Nest$mgetActionIntent(Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;Landroid/bluetooth/BluetoothDevice;)Landroid/content/Intent;
    .locals 4

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    new-instance v1, Landroid/content/ComponentName;

    const-string v2, "com.samsung.accessory.budsunitemgr"

    const-string v3, "com.samsung.accessory.hearablemgr.WelcomeActivity"

    invoke-direct {v1, v2, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    const-string v1, "DEVICE_ADDRESS"

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "MODEL_NAME"

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object p0, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    const-string v1, "request_app_package_name"

    invoke-virtual {v0, v1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p0, "DATA"

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->semGetManufacturerData()[B

    move-result-object p1

    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    const-string p0, "FROM"

    const-string p1, "SETTING_MENU"

    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    return-object v0
.end method

.method public static -$$Nest$mstartActivity(Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;ILandroid/content/Intent;)V
    .locals 4

    iget-object v0, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mDevice1:Landroid/bluetooth/BluetoothDevice;

    const/4 v1, 0x1

    const/16 v2, 0x2580

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mDevice2:Landroid/bluetooth/BluetoothDevice;

    if-eqz v0, :cond_1

    if-ne p1, v1, :cond_0

    goto :goto_0

    :cond_0
    const/16 v2, 0x2581

    :cond_1
    :goto_0
    const/16 p1, 0x23

    invoke-static {p1, v2}, Lcom/samsung/android/settings/logging/LoggingHelper;->insertEventLogging(II)V

    invoke-virtual {p2}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object p1

    if-nez p1, :cond_2

    new-instance p1, Landroid/content/ComponentName;

    const-string v0, "*"

    invoke-direct {p1, v0, v0}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mContext:Landroid/content/Context;

    const/4 v3, 0x0

    invoke-static {v2, p1, v0, v3, v1}, Lcom/android/settings/activityembedding/ActivityEmbeddingRulesController;->registerTwoPanePairRuleForSettingsHome(Landroid/content/Context;Landroid/content/ComponentName;Ljava/lang/String;ZZ)V

    iget-object p1, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mContext:Landroid/content/Context;

    check-cast p1, Lcom/android/settings/homepage/SettingsHomepageActivity;

    invoke-static {p1}, Lcom/android/settings/activityembedding/ActivityEmbeddingUtils;->isAlreadyEmbedded(Landroid/app/Activity;)Z

    move-result p1

    iget-object v0, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    const/high16 v2, 0x10000

    if-eqz p1, :cond_3

    invoke-static {v0, v3, v3}, Landroid/app/ActivityOptions;->makeCustomAnimation(Landroid/content/Context;II)Landroid/app/ActivityOptions;

    move-result-object p1

    iget-object p0, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mContext:Landroid/content/Context;

    check-cast p0, Lcom/android/settings/homepage/SettingsHomepageActivity;

    invoke-virtual {p1}, Landroid/app/ActivityOptions;->toBundle()Landroid/os/Bundle;

    move-result-object p1

    invoke-static {p0, p2, v2, p1, v1}, Lcom/samsung/android/settings/homepage/HomepageUtils;->startActivity(Landroid/app/Activity;Landroid/content/Intent;ILandroid/os/Bundle;Landroid/os/UserHandle;)V

    return-void

    :cond_3
    check-cast v0, Lcom/android/settings/homepage/SettingsHomepageActivity;

    invoke-static {v0, p2, v2, v1, v1}, Lcom/samsung/android/settings/homepage/HomepageUtils;->startActivity(Landroid/app/Activity;Landroid/content/Intent;ILandroid/os/Bundle;Landroid/os/UserHandle;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0, p1}, Lcom/android/settings/widget/HomepagePreference;-><init>(Landroid/content/Context;)V

    const-string v0, "EarbudsMenu_BudsUniteManagerPreference"

    iput-object v0, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->TAG:Ljava/lang/String;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mCustomBackgroundEnabled:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mIsTopViewVisible:Z

    iput v0, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mHeight:I

    iput-boolean v0, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mIsTabletView:Z

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->init$1(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    invoke-direct {p0, p1, p2}, Lcom/android/settings/widget/HomepagePreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const-string v0, "EarbudsMenu_BudsUniteManagerPreference"

    iput-object v0, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->TAG:Ljava/lang/String;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mCustomBackgroundEnabled:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mIsTopViewVisible:Z

    iput v0, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mHeight:I

    iput-boolean v0, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mIsTabletView:Z

    invoke-virtual {p0, p1, p2}, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->init$1(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/android/settings/widget/HomepagePreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const-string p3, "EarbudsMenu_BudsUniteManagerPreference"

    iput-object p3, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->TAG:Ljava/lang/String;

    const/4 p3, 0x1

    iput-boolean p3, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mCustomBackgroundEnabled:Z

    const/4 p3, 0x0

    iput-boolean p3, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mIsTopViewVisible:Z

    iput p3, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mHeight:I

    iput-boolean p3, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mIsTabletView:Z

    invoke-virtual {p0, p1, p2}, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->init$1(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/settings/widget/HomepagePreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    const-string p3, "EarbudsMenu_BudsUniteManagerPreference"

    iput-object p3, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->TAG:Ljava/lang/String;

    const/4 p3, 0x1

    iput-boolean p3, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mCustomBackgroundEnabled:Z

    const/4 p3, 0x0

    iput-boolean p3, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mIsTopViewVisible:Z

    iput p3, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mHeight:I

    iput-boolean p3, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mIsTabletView:Z

    invoke-virtual {p0, p1, p2}, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->init$1(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public final getIconBuds(I)Landroid/graphics/drawable/Drawable;
    .locals 1

    iget-object v0, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mContext:Landroid/content/Context;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {v0, p1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    if-nez p1, :cond_1

    :goto_0
    const/4 p0, 0x0

    return-object p0

    :cond_1
    iget-object p0, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v0, 0x7f0601e1

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getColor(I)I

    move-result p0

    invoke-virtual {p1, p0}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    return-object p1
.end method

.method public final init$1(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 4

    const-string v0, "Init done 20dp after change = "

    iput-object p1, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->TAG:Ljava/lang/String;

    const-string v2, "Init done"

    invoke-static {v1, v2}, Lcom/samsung/android/util/SemLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v1, Landroid/os/Handler;

    iget-object v2, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v1, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mUpdateHandler:Landroid/os/Handler;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f070f0f

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    float-to-int v1, v1

    iput v1, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mHeight:I

    iget-object v1, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Init done 20dp = "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v3, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mHeight:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/samsung/android/util/SemLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz p2, :cond_0

    sget-object v1, Lcom/android/settings/R$styleable;->SecInsetCategory:[I

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    :try_start_0
    iget p2, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mHeight:I

    const/4 v1, 0x0

    invoke-virtual {p1, v1, p2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    iput p2, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mHeight:I

    iget-object p2, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v0, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mHeight:I

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Lcom/samsung/android/util/SemLog;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p2

    iget-object p0, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Init done 20dp fail."

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, p2}, Lcom/samsung/android/util/SemLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    :cond_0
    return-void
.end method

.method public final onBindViewHolder(Landroidx/preference/PreferenceViewHolder;)V
    .locals 4

    const-string v0, "onBindViewHolder currentKey "

    invoke-super {p0, p1}, Lcom/android/settings/widget/HomepagePreference;->onBindViewHolder(Landroidx/preference/PreferenceViewHolder;)V

    :try_start_0
    iget-object v1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    const v3, 0x7f0b0edf

    invoke-virtual {v1, v3, v2}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    const v1, 0x7f0b1057

    invoke-virtual {p1, v1}, Landroidx/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/RelativeLayout;

    iput-object v1, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->rlBgLayout:Landroid/widget/RelativeLayout;

    const v1, 0x7f0b1561

    invoke-virtual {p1, v1}, Landroidx/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->viewTop:Landroid/view/View;

    const v1, 0x7f0b0bd1

    invoke-virtual {p1, v1}, Landroidx/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    iput-object v1, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->lnBudsAllLayout:Landroid/widget/LinearLayout;

    const v1, 0x7f0b0bd3

    invoke-virtual {p1, v1}, Landroidx/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    iput-object v1, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->llBuds1Layout:Landroid/widget/LinearLayout;

    const v1, 0x7f0b0bd4

    invoke-virtual {p1, v1}, Landroidx/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    iput-object v1, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->llBuds2Layout:Landroid/widget/LinearLayout;

    const v1, 0x7f0b0708

    invoke-virtual {p1, v1}, Landroidx/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout;

    iput-object v1, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->flBuds1Layout:Landroid/widget/FrameLayout;

    const v1, 0x7f0b0709

    invoke-virtual {p1, v1}, Landroidx/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout;

    iput-object v1, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->flBuds2Layout:Landroid/widget/FrameLayout;

    const v1, 0x7f0b05d9

    invoke-virtual {p1, v1}, Landroidx/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->viewDivider:Landroid/view/View;

    const v1, 0x7f0b0a9e

    invoke-virtual {p1, v1}, Landroidx/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->imgBudsIcon1:Landroid/widget/ImageView;

    const v1, 0x7f0b0a9f

    invoke-virtual {p1, v1}, Landroidx/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->imgBudsIcon2:Landroid/widget/ImageView;

    const v1, 0x7f0b14ec

    invoke-virtual {p1, v1}, Landroidx/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->tvBudsName1:Landroid/widget/TextView;

    const v1, 0x7f0b14ed

    invoke-virtual {p1, v1}, Landroidx/preference/PreferenceViewHolder;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->tvBudsName2:Landroid/widget/TextView;

    iget-object p1, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    if-eqz p1, :cond_0

    instance-of v2, p1, Lcom/android/settings/homepage/SettingsHomepageActivity;

    if-eqz v2, :cond_0

    check-cast p1, Lcom/android/settings/homepage/SettingsHomepageActivity;

    invoke-static {p1}, Lcom/android/settings/activityembedding/ActivityEmbeddingUtils;->isAlreadyEmbedded(Landroid/app/Activity;)Z

    move-result p1

    goto :goto_0

    :cond_0
    move p1, v1

    :goto_0
    iput-boolean p1, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mIsTabletView:Z

    iget-object p1, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->llBuds1Layout:Landroid/widget/LinearLayout;

    new-instance v2, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference$1;

    invoke-direct {v2, v1}, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference$1;-><init>(I)V

    iput-object p0, v2, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference$1;->this$0:Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {p1, v2}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->llBuds2Layout:Landroid/widget/LinearLayout;

    new-instance v1, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference$1;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference$1;-><init>(I)V

    iput-object p0, v1, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference$1;->this$0:Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/android/settings/SettingsApplication;

    invoke-virtual {p1}, Lcom/android/settings/SettingsApplication;->getHomeActivity()Lcom/android/settings/homepage/SettingsHomepageActivity;

    move-result-object p1

    if-eqz p1, :cond_2

    iget-object p1, p1, Lcom/android/settings/homepage/SettingsHomepageActivity;->mMainFragment:Lcom/android/settings/homepage/TopLevelSettings;

    if-eqz p1, :cond_2

    iget-object p1, p1, Lcom/android/settings/homepage/TopLevelSettings;->mHighlightMixin:Lcom/android/settings/homepage/TopLevelHighlightMixin;

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/android/settings/homepage/TopLevelHighlightMixin;->getHighlightPreferenceKey()Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    :cond_1
    const/4 p1, 0x0

    :goto_1
    iget-object v1, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/samsung/android/util/SemLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz p1, :cond_2

    const-string v0, "top_level_buds_unite"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_2

    iget-object p1, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mContext:Landroid/content/Context;

    invoke-static {p1}, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->getInstance(Landroid/content/Context;)Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;

    move-result-object p1

    const-string v0, ""

    invoke-virtual {p1, v0}, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->setFocusEarbuds(Ljava/lang/String;)V

    goto :goto_2

    :catch_0
    move-exception p1

    goto :goto_3

    :cond_2
    :goto_2
    invoke-virtual {p0}, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->showBudsMenu()V

    iget-object p1, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->TAG:Ljava/lang/String;

    const-string v0, "onBindViewHolder done"

    invoke-static {p1, v0}, Lcom/samsung/android/util/SemLog;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :goto_3
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    iget-object p0, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "onBindViewHolder error = "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/samsung/android/util/SemLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public final showBudsData(Landroid/bluetooth/BluetoothDevice;I)V
    .locals 0

    return-void
.end method

    const/4 v3, 0x1

    if-eqz p1, :cond_0

    move v4, v3

    goto :goto_0

    :cond_0
    move v4, v2

    :goto_0
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/samsung/android/util/SemLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz p1, :cond_12

    iget-object v0, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->lnBudsAllLayout:Landroid/widget/LinearLayout;

    if-nez v0, :cond_1

    goto/16 :goto_7

    :cond_1
    if-ne p2, v3, :cond_2

    iget-object v0, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->imgBudsIcon1:Landroid/widget/ImageView;

    goto :goto_1

    :cond_2
    iget-object v0, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->imgBudsIcon2:Landroid/widget/ImageView;

    :goto_1
    if-ne p2, v3, :cond_3

    iget-object p2, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->tvBudsName1:Landroid/widget/TextView;

    goto :goto_2

    :cond_3
    iget-object p2, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->tvBudsName2:Landroid/widget/TextView;

    :goto_2
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->semGetManufacturerData()[B

    move-result-object v1

    invoke-static {v1}, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->getSingleManufacturerData([B)[B

    move-result-object v4

    new-instance v5, Lcom/samsung/android/settings/homepage/SamsungMFFormat;

    invoke-direct {v5, v4}, Lcom/samsung/android/settings/homepage/SamsungMFFormat;-><init>([B)V

    iget-object v4, v5, Lcom/samsung/android/settings/homepage/SamsungMFFormat;->mData:Lcom/samsung/android/settings/homepage/SamsungMFFormat$Data;

    iget-object v4, v4, Lcom/samsung/android/settings/homepage/SamsungMFFormat$Data;->mDeviceId:[B

    aget-byte v5, v4, v2

    and-int/lit16 v5, v5, 0xff

    shl-int/lit8 v5, v5, 0x8

    aget-byte v4, v4, v3

    and-int/lit16 v4, v4, 0xff

    or-int/2addr v4, v5

    iget-object v5, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->TAG:Ljava/lang/String;

    const-string v6, "getDeviceId : "

    invoke-static {v4, v6, v5}, Lcom/samsung/android/settings/accessibility/hearing/shortcutpopup/AmbientSliderController$$ExternalSyntheticOutline0;->m(ILjava/lang/String;Ljava/lang/String;)V

    const/16 v5, 0x169

    const v6, 0x7f080236

    if-le v4, v5, :cond_c

    const/4 v5, 0x0

    if-nez v1, :cond_4

    :goto_3
    move-object v1, v5

    goto :goto_4

    :cond_4
    new-instance v7, Lcom/samsung/android/settingslib/bluetooth/ManufacturerData;

    invoke-direct {v7, v1}, Lcom/samsung/android/settingslib/bluetooth/ManufacturerData;-><init>([B)V

    iget-object v1, v7, Lcom/samsung/android/settingslib/bluetooth/ManufacturerData;->mData:Lcom/samsung/android/settingslib/bluetooth/ManufacturerData$Data;

    iget-byte v7, v1, Lcom/samsung/android/settingslib/bluetooth/ManufacturerData$Data;->mDeviceCategory:B

    if-gtz v7, :cond_5

    goto :goto_3

    :cond_5
    iget-byte v1, v1, Lcom/samsung/android/settingslib/bluetooth/ManufacturerData$Data;->mDeviceIconIndex:B

    iget-object v8, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mContext:Landroid/content/Context;

    const/4 v9, 0x2

    new-array v9, v9, [B

    aput-byte v7, v9, v2

    aput-byte v1, v9, v3

    invoke-static {v8, v9}, Lcom/samsung/android/settingslib/bluetooth/scsp/ScspUtils;->getIconIndexFileDirPath(Landroid/content/Context;[B)Ljava/lang/String;

    move-result-object v1

    :goto_4
    iget-object v2, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v7, " showBudsData() path = "

    invoke-direct {v3, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/samsung/android/util/SemLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    const v2, 0x7f080471

    const/16 v3, 0x16b

    if-eqz v1, :cond_a

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v7

    if-nez v7, :cond_6

    goto :goto_5

    :cond_6
    invoke-static {v1}, Landroidx/compose/ui/autofill/PopulateViewStructure_androidKt$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v7, Lcom/samsung/android/settingslib/bluetooth/scsp/ScspUtils;->FILE_NAME_UNITE_LEFT_RIGHT:Ljava/lang/String;

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v7, Lcom/samsung/android/settingslib/bluetooth/scsp/ScspUtils;->FILE_EXTENSION_SVG:Ljava/lang/String;

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v7, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->TAG:Ljava/lang/String;

    const-string v8, " showBudsData() pathFull = "

    invoke-virtual {v8, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/samsung/android/util/SemLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v0}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    if-eqz v7, :cond_7

    iget-object v5, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mContext:Landroid/content/Context;

    iget v8, v7, Landroid/view/ViewGroup$LayoutParams;->width:I

    iget v7, v7, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-static {v5, v8, v7, v1}, Lcom/samsung/android/settingslib/bluetooth/scsp/ScspUtils;->getIcon(Landroid/content/Context;IILjava/lang/String;)Landroid/graphics/drawable/BitmapDrawable;

    move-result-object v5

    :cond_7
    iget-object v1, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, " showBudsData() drawable = "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v1, v7}, Lcom/samsung/android/util/SemLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz v5, :cond_8

    iget-object v1, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0601e1

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v5, v1}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    goto :goto_6

    :cond_8
    if-lt v4, v3, :cond_9

    invoke-virtual {p0, v2}, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->getIconBuds(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    goto :goto_6

    :cond_9
    invoke-virtual {p0, v6}, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->getIconBuds(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    goto :goto_6

    :cond_a
    :goto_5
    if-lt v4, v3, :cond_b

    invoke-virtual {p0, v2}, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->getIconBuds(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    goto :goto_6

    :cond_b
    invoke-virtual {p0, v6}, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->getIconBuds(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    goto :goto_6

    :cond_c
    const/16 v1, 0x163

    if-lt v4, v1, :cond_d

    invoke-virtual {p0, v6}, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->getIconBuds(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    goto :goto_6

    :cond_d
    const/16 v1, 0x14d

    if-lt v4, v1, :cond_e

    const v1, 0x7f080235

    invoke-virtual {p0, v1}, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->getIconBuds(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    goto :goto_6

    :cond_e
    const v1, 0x7f080237

    invoke-virtual {p0, v1}, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->getIconBuds(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    :goto_6
    if-eqz v5, :cond_f

    invoke-virtual {v0, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_f
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getAlias()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_10

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_11

    :cond_10
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v0

    :cond_11
    iget-object p0, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->TAG:Ljava/lang/String;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "showBudsData mBudsName = "

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "|"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/samsung/android/util/SemLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_12
    :goto_7
    return-void
.end method

.method public final showBudsMenu()V
    .locals 6

    iget-object v0, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    instance-of v2, v0, Lcom/android/settings/homepage/SettingsHomepageActivity;

    if-eqz v2, :cond_0

    check-cast v0, Lcom/android/settings/homepage/SettingsHomepageActivity;

    invoke-static {v0}, Lcom/android/settings/activityembedding/ActivityEmbeddingUtils;->isAlreadyEmbedded(Landroid/app/Activity;)Z

    move-result v0

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    iget-object v2, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "show Buds Menu(): isTabletView="

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/samsung/android/util/SemLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mDevice1:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {p0, v3, v2}, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->showBudsData(Landroid/bluetooth/BluetoothDevice;I)V

    const/4 v2, 0x2

    iget-object v3, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mDevice2:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {p0, v3, v2}, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->showBudsData(Landroid/bluetooth/BluetoothDevice;I)V

    iget-object v2, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->viewDivider:Landroid/view/View;

    iget-object v3, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mDevice1:Landroid/bluetooth/BluetoothDevice;

    const/16 v4, 0x8

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mDevice2:Landroid/bluetooth/BluetoothDevice;

    if-eqz v3, :cond_1

    move v3, v1

    goto :goto_1

    :cond_1
    move v3, v4

    :goto_1
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object v2, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->rlBgLayout:Landroid/widget/RelativeLayout;

    iget-object v3, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mDevice1:Landroid/bluetooth/BluetoothDevice;

    if-nez v3, :cond_3

    iget-object v3, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mDevice2:Landroid/bluetooth/BluetoothDevice;

    if-eqz v3, :cond_2

    goto :goto_2

    :cond_2
    move v3, v4

    goto :goto_3

    :cond_3
    :goto_2
    move v3, v1

    :goto_3
    invoke-virtual {v2, v3}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    iget-object v2, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->viewTop:Landroid/view/View;

    iget-boolean v3, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mIsTopViewVisible:Z

    if-eqz v3, :cond_4

    move v3, v1

    goto :goto_4

    :cond_4
    move v3, v4

    :goto_4
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object v2, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mDevice1:Landroid/bluetooth/BluetoothDevice;

    if-eqz v2, :cond_5

    move v3, v1

    goto :goto_5

    :cond_5
    move v3, v4

    :goto_5
    iget-object v5, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mDevice2:Landroid/bluetooth/BluetoothDevice;

    if-eqz v5, :cond_6

    goto :goto_6

    :cond_6
    move v1, v4

    :goto_6
    const/4 v4, 0x0

    if-eqz v2, :cond_9

    if-eqz v5, :cond_9

    iget-object v2, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->TAG:Ljava/lang/String;

    const-string v5, "set 2 bg item: "

    invoke-static {v2, v5}, Lcom/samsung/android/util/SemLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-boolean v2, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mCustomBackgroundEnabled:Z

    iget-object v5, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->lnBudsAllLayout:Landroid/widget/LinearLayout;

    if-eqz v2, :cond_8

    if-eqz v0, :cond_7

    const v0, 0x7f08024c

    invoke-virtual {v5, v0}, Landroid/widget/LinearLayout;->setBackgroundResource(I)V

    goto :goto_7

    :cond_7
    const v0, 0x7f080247

    invoke-virtual {v5, v0}, Landroid/widget/LinearLayout;->setBackgroundResource(I)V

    :goto_7
    iget-object v0, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->rlBgLayout:Landroid/widget/RelativeLayout;

    const v2, 0x7f08024b

    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout;->setBackgroundResource(I)V

    goto :goto_9

    :cond_8
    invoke-virtual {v5, v4}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->rlBgLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v4}, Landroid/widget/RelativeLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_9

    :cond_9
    iget-object v2, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->TAG:Ljava/lang/String;

    const-string v5, "set 1 bg item: "

    invoke-static {v2, v5}, Lcom/samsung/android/util/SemLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-boolean v2, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mCustomBackgroundEnabled:Z

    iget-object v5, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->lnBudsAllLayout:Landroid/widget/LinearLayout;

    if-eqz v2, :cond_b

    if-eqz v0, :cond_a

    const v0, 0x7f080249

    invoke-virtual {v5, v0}, Landroid/widget/LinearLayout;->setBackgroundResource(I)V

    goto :goto_8

    :cond_a
    const v0, 0x7f080248

    invoke-virtual {v5, v0}, Landroid/widget/LinearLayout;->setBackgroundResource(I)V

    :goto_8
    iget-object v0, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->rlBgLayout:Landroid/widget/RelativeLayout;

    const v2, 0x7f08024a

    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout;->setBackgroundResource(I)V

    goto :goto_9

    :cond_b
    invoke-virtual {v5, v4}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->rlBgLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v4}, Landroid/widget/RelativeLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    :goto_9
    iget-object v0, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->llBuds1Layout:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getVisibility()I

    move-result v0

    if-ne v0, v3, :cond_c

    iget-object v0, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->llBuds2Layout:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getVisibility()I

    move-result v0

    if-eq v0, v1, :cond_e

    :cond_c
    iget-object v0, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->lnBudsAllLayout:Landroid/widget/LinearLayout;

    new-instance v2, Landroid/transition/ChangeBounds;

    invoke-direct {v2}, Landroid/transition/ChangeBounds;-><init>()V

    invoke-static {v0, v2}, Landroid/transition/TransitionManager;->beginDelayedTransition(Landroid/view/ViewGroup;Landroid/transition/Transition;)V

    iget-object v0, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->llBuds1Layout:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getVisibility()I

    move-result v0

    if-eq v0, v3, :cond_d

    iget-object v0, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->llBuds1Layout:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setVisibility(I)V

    :cond_d
    iget-object v0, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->llBuds2Layout:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getVisibility()I

    move-result v0

    if-eq v0, v1, :cond_e

    iget-object v0, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->llBuds2Layout:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    :cond_e
    invoke-virtual {p0}, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->updateFocusState()V

    return-void
.end method

.method public final updateFocusState()V
    .locals 5

    iget-object v0, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->flBuds1Layout:Landroid/widget/FrameLayout;

    if-eqz v0, :cond_b

    iget-object v1, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->flBuds2Layout:Landroid/widget/FrameLayout;

    if-nez v1, :cond_0

    goto/16 :goto_2

    :cond_0
    iget-boolean v1, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mIsTabletView:Z

    const/4 v2, 0x0

    if-nez v1, :cond_2

    if-eqz v0, :cond_1

    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->setBackgroundResource(I)V

    :cond_1
    iget-object p0, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->flBuds2Layout:Landroid/widget/FrameLayout;

    if-eqz p0, :cond_b

    invoke-virtual {p0, v2}, Landroid/widget/FrameLayout;->setBackgroundResource(I)V

    return-void

    :cond_2
    iget-object v0, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->getInstance(Landroid/content/Context;)Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;

    move-result-object v0

    iget-object v1, v0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->prefs:Landroid/content/SharedPreferences;

    const-string v3, "PREFS_FOCUS_EARBUDS"

    const-string v4, ""

    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/samsung/android/settings/homepage/TopLevelBudsUniteManager;->mDeviceFocus:Ljava/lang/String;

    if-nez v1, :cond_4

    iget-object v0, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->flBuds1Layout:Landroid/widget/FrameLayout;

    if-eqz v0, :cond_3

    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->setBackgroundResource(I)V

    :cond_3
    iget-object p0, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->flBuds2Layout:Landroid/widget/FrameLayout;

    if-eqz p0, :cond_b

    invoke-virtual {p0, v2}, Landroid/widget/FrameLayout;->setBackgroundResource(I)V

    return-void

    :cond_4
    iget-object v0, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->TAG:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v4, 0x8

    if-lt v3, v4, :cond_5

    invoke-virtual {v1, v2, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    :cond_5
    move-object v3, v1

    :goto_0
    const-string v4, "updateFocusState: currentFocus="

    invoke-virtual {v4, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/samsung/android/util/SemLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->flBuds1Layout:Landroid/widget/FrameLayout;

    if-eqz v0, :cond_6

    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->setBackgroundResource(I)V

    :cond_6
    iget-object v0, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->flBuds2Layout:Landroid/widget/FrameLayout;

    if-eqz v0, :cond_7

    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->setBackgroundResource(I)V

    :cond_7
    iget-object v0, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mDevice1:Landroid/bluetooth/BluetoothDevice;

    const/4 v2, 0x1

    if-eqz v0, :cond_8

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    move v0, v2

    goto :goto_1

    :cond_8
    const/4 v0, -0x1

    :goto_1
    iget-object v3, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->mDevice2:Landroid/bluetooth/BluetoothDevice;

    const/4 v4, 0x2

    if-eqz v3, :cond_9

    invoke-virtual {v3}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_9

    move v0, v4

    :cond_9
    iget-object v1, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->TAG:Ljava/lang/String;

    const-string v3, "updateFocusState: mFocusedBudsIndex="

    invoke-static {v0, v3, v1}, Lcom/samsung/android/settings/accessibility/hearing/shortcutpopup/AmbientSliderController$$ExternalSyntheticOutline0;->m(ILjava/lang/String;Ljava/lang/String;)V

    const v1, 0x7f080b86

    if-ne v0, v2, :cond_a

    iget-object v2, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->flBuds1Layout:Landroid/widget/FrameLayout;

    if-eqz v2, :cond_a

    invoke-virtual {v2, v1}, Landroid/widget/FrameLayout;->setBackgroundResource(I)V

    return-void

    :cond_a
    if-ne v0, v4, :cond_b

    iget-object p0, p0, Lcom/samsung/android/settings/homepage/BudsUniteManagerPreference;->flBuds2Layout:Landroid/widget/FrameLayout;

    if-eqz p0, :cond_b

    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->setBackgroundResource(I)V

    :cond_b
    :goto_2
    return-void
.end method
