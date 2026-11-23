.class public Lcom/samsung/android/settings/display/ScreenResolutionFragment;
.super Lcom/android/settings/dashboard/DashboardFragment;
.source "qb/117478588 ef68672984e5a659a7e5edd478bafa64e2bea021b15a07cfabf98fde6e4913cf"


# static fields
.field public static mDisplay:Landroid/view/Display;

.field public static final sHandler:Landroid/os/Handler;


# instance fields
.field public mApplyButton:Lcom/samsung/android/settings/widget/SecButtonPreference;

.field public mConfiguration:Landroid/content/res/Configuration;

.field public mContext:Landroid/content/Context;

.field public mController:Lcom/samsung/android/settings/display/controller/SecScreenResolutionSingleChoiceController;

.field public final mControllers:Ljava/util/List;

.field public mDesktopModeListener:Lcom/samsung/android/settings/display/ScreenResolutionFragment$1;

.field public mDesktopModeManager:Lcom/samsung/android/desktopmode/SemDesktopModeManager;

.field public final mEntryValues:Ljava/util/ArrayList;

.field public mFinishFragmentRunnable:Lcom/samsung/android/settings/display/ScreenResolutionFragment$$ExternalSyntheticLambda0;

.field public mIsFinishedWithDelay:Z

.field public final mMainTitleList:Ljava/util/ArrayList;

.field public mNestedScrollView:Landroidx/core/widget/NestedScrollView;

.field public mPreviewPane:Landroid/view/ViewGroup;

.field public mPreviewRowOrientation:I

.field public mScreenChangeState:Z

.field public mScreenResolution:I

.field public mScreenResolutionButton:Lcom/samsung/android/settings/widget/SecHorizontalRadioPreference;

.field public mStrBtnFHD:Ljava/lang/String;

.field public mStrBtnHD:Ljava/lang/String;

.field public mStrBtnWQHD:Ljava/lang/String;

.field public mStrBtnWUXGA:Ljava/lang/String;

.field public final mSubTitleList:Ljava/util/ArrayList;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->sHandler:Landroid/os/Handler;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Lcom/android/settings/dashboard/DashboardFragment;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mEntryValues:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mMainTitleList:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mSubTitleList:Ljava/util/ArrayList;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mIsFinishedWithDelay:Z

    iput-boolean v0, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mScreenChangeState:Z

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mControllers:Ljava/util/List;

    iput v0, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mPreviewRowOrientation:I

    new-instance v0, Lcom/samsung/android/settings/display/ScreenResolutionFragment$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object p0, v0, Lcom/samsung/android/settings/display/ScreenResolutionFragment$$ExternalSyntheticLambda0;->f$0:Lcom/samsung/android/settings/display/ScreenResolutionFragment;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    iput-object v0, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mFinishFragmentRunnable:Lcom/samsung/android/settings/display/ScreenResolutionFragment$$ExternalSyntheticLambda0;

    return-void
.end method

.method public static formatDimensions(Ljava/text/NumberFormat;II)Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    int-to-long v1, p1

    invoke-virtual {p0, v1, v2}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " x "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    int-to-long p1, p2

    invoke-virtual {p0, p1, p2}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final applyListSpacing(Landroidx/core/graphics/Insets;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/android/settings/SettingsPreferenceFragment;->applyListSpacing(Landroidx/core/graphics/Insets;)V

    iget-object p1, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mNestedScrollView:Landroidx/core/widget/NestedScrollView;

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->isLandscapeMode()Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p0, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mNestedScrollView:Landroidx/core/widget/NestedScrollView;

    const/4 p1, 0x0

    invoke-virtual {p0, p1, p1, p1, p1}, Landroid/widget/FrameLayout;->setPadding(IIII)V

    :cond_0
    return-void
.end method

.method public final applyPaneConfiguration()V
    .locals 8

    invoke-virtual {p0}, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->isLandscapeMode()Z

    move-result v0

    iget-object v1, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mPreviewPane:Landroid/view/ViewGroup;

    const-string/jumbo v2, "screen_resolution_preview"

    const v3, 0x7f060ab1

    const-string/jumbo v4, "screen_resolution_desc"

    const/4 v5, 0x1

    if-eqz v1, :cond_b

    iget-object v6, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mContext:Landroid/content/Context;

    if-nez v6, :cond_0

    goto/16 :goto_2

    :cond_0
    invoke-virtual {v1}, Landroid/view/ViewGroup;->removeAllViews()V

    iget-object v1, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mPreviewPane:Landroid/view/ViewGroup;

    const/4 v6, 0x0

    if-eqz v0, :cond_8

    invoke-virtual {v1, v6}, Landroid/view/ViewGroup;->setVisibility(I)V

    iget-object v0, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mContext:Landroid/content/Context;

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0e07b9

    iget-object v7, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mPreviewPane:Landroid/view/ViewGroup;

    invoke-virtual {v0, v1, v7, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    iget-object v0, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mNestedScrollView:Landroidx/core/widget/NestedScrollView;

    if-eqz v0, :cond_1

    invoke-virtual {v0, v5}, Landroidx/core/widget/NestedScrollView;->seslSetFadingEdgeEnabled(Z)V

    iget-object v0, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mNestedScrollView:Landroidx/core/widget/NestedScrollView;

    iget-object v1, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v3}, Landroid/content/Context;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroidx/core/widget/NestedScrollView;->seslSetFadingEdgeColor(I)V

    :cond_1
    invoke-virtual {p0, v2}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {v0, v6}, Landroidx/preference/Preference;->setVisible(Z)V

    :cond_2
    iget-object v0, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mPreviewPane:Landroid/view/ViewGroup;

    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object v1

    if-nez v1, :cond_3

    goto :goto_0

    :cond_3
    invoke-virtual {p0, v4}, Lcom/android/settings/SettingsPreferenceFragment;->removePreference(Ljava/lang/String;)Z

    :goto_0
    if-eqz v0, :cond_d

    iget-object v1, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mContext:Landroid/content/Context;

    if-nez v1, :cond_4

    goto :goto_4

    :cond_4
    const v1, 0x7f0b1141

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_5

    goto :goto_4

    :cond_5
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object v1

    if-nez v1, :cond_6

    goto :goto_4

    :cond_6
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    instance-of v1, v1, Landroid/view/ViewGroup;

    if-eqz v1, :cond_7

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_7
    new-instance v1, Lcom/android/settingslib/widget/LayoutPreference;

    iget-object v7, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mContext:Landroid/content/Context;

    invoke-direct {v1, v7, v0}, Lcom/android/settingslib/widget/LayoutPreference;-><init>(Landroid/content/Context;Landroid/view/View;)V

    invoke-virtual {v1, v4}, Landroidx/preference/Preference;->setKey(Ljava/lang/String;)V

    invoke-virtual {v1, v6}, Landroidx/preference/Preference;->setSelectable(Z)V

    invoke-virtual {v1, v6}, Landroidx/preference/Preference;->setOrder(I)V

    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroidx/preference/PreferenceGroup;->addPreference(Landroidx/preference/Preference;)Z

    goto :goto_4

    :cond_8
    const/16 v0, 0x8

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->setVisibility(I)V

    iget-object v0, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mNestedScrollView:Landroidx/core/widget/NestedScrollView;

    if-eqz v0, :cond_9

    invoke-virtual {v0, v6}, Landroidx/core/widget/NestedScrollView;->seslSetFadingEdgeEnabled(Z)V

    :cond_9
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object v0

    if-nez v0, :cond_a

    goto :goto_1

    :cond_a
    invoke-virtual {p0, v4}, Lcom/android/settings/SettingsPreferenceFragment;->removePreference(Ljava/lang/String;)Z

    :goto_1
    invoke-virtual {p0}, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->showPreviewRow()V

    goto :goto_4

    :cond_b
    :goto_2
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object v0

    if-nez v0, :cond_c

    goto :goto_3

    :cond_c
    invoke-virtual {p0, v4}, Lcom/android/settings/SettingsPreferenceFragment;->removePreference(Ljava/lang/String;)Z

    :goto_3
    invoke-virtual {p0}, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->showPreviewRow()V

    :cond_d
    :goto_4
    iget-object v0, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mNestedScrollView:Landroidx/core/widget/NestedScrollView;

    if-eqz v0, :cond_10

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    if-nez v0, :cond_e

    goto :goto_5

    :cond_e
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    const v1, 0x7f0b125d

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/oneui/floatingactioncontainer/FloatingToolbarLayout;

    if-eqz v0, :cond_f

    iget-object v1, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mNestedScrollView:Landroidx/core/widget/NestedScrollView;

    invoke-virtual {v0, v1}, Lcom/google/android/material/oneui/floatingactioncontainer/FloatingGroupLayout;->setNestedScrollView(Landroidx/core/widget/NestedScrollView;)V

    :cond_f
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    const v1, 0x7f0b0745

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/oneui/floatingactioncontainer/FloatingBottomLayout;

    if-eqz v0, :cond_10

    iget-object v1, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mNestedScrollView:Landroidx/core/widget/NestedScrollView;

    invoke-virtual {v0, v1}, Lcom/google/android/material/oneui/floatingactioncontainer/FloatingGroupLayout;->setNestedScrollView(Landroidx/core/widget/NestedScrollView;)V

    :cond_10
    :goto_5
    invoke-virtual {p0}, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->isLandscapeMode()Z

    move-result v0

    const v1, 0x7f0b1145

    const/4 v4, 0x0

    if-eqz v0, :cond_11

    iget-object v0, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mPreviewPane:Landroid/view/ViewGroup;

    if-eqz v0, :cond_11

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    goto :goto_6

    :cond_11
    invoke-virtual {p0, v2}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v0

    instance-of v2, v0, Lcom/android/settingslib/widget/LayoutPreference;

    if-eqz v2, :cond_12

    check-cast v0, Lcom/android/settingslib/widget/LayoutPreference;

    iget-object v0, v0, Lcom/android/settingslib/widget/LayoutPreference;->mRootView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    goto :goto_6

    :cond_12
    move-object v0, v4

    :goto_6
    if-eqz v0, :cond_13

    const/16 v1, 0xf

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->semSetRoundedCorners(I)V

    iget-object v2, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mContext:Landroid/content/Context;

    invoke-virtual {v2, v3}, Landroid/content/Context;->getColor(I)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->semSetRoundedCornerColor(II)V

    const v1, 0x7f0b06f7

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iget-object v2, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mStrBtnFHD:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v1, 0x7f0b0a00

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iget-object v2, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mStrBtnHD:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v1, 0x7f0b1702

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iget-object v2, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mStrBtnWQHD:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mConfiguration:Landroid/content/res/Configuration;

    invoke-virtual {v1}, Landroid/content/res/Configuration;->getLayoutDirection()I

    move-result v1

    if-ne v1, v5, :cond_13

    const v1, 0x7f0b113f

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iget-object p0, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v1, 0x7f080a8e

    invoke-virtual {p0, v1, v4}, Landroid/content/res/Resources;->getDrawable(ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_13
    return-void
.end method

.method public final createPreferenceControllers(Landroid/content/Context;)Ljava/util/List;
    .locals 2

    new-instance v0, Lcom/samsung/android/settings/display/controller/SecScreenResolutionSingleChoiceController;

    const-string/jumbo v1, "screen_resolution_seekbar"

    invoke-direct {v0, p1, v1}, Lcom/samsung/android/settings/display/controller/SecScreenResolutionSingleChoiceController;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mController:Lcom/samsung/android/settings/display/controller/SecScreenResolutionSingleChoiceController;

    iget-object p1, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mControllers:Ljava/util/List;

    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object p0, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mControllers:Ljava/util/List;

    return-object p0
.end method

.method public final getLogTag()Ljava/lang/String;
    .locals 0

    const-string/jumbo p0, "ScreenResolutionFragment"

    return-object p0
.end method

.method public final getMetricsCategory()I
    .locals 0

    const/16 p0, 0x1d10

    return p0
.end method

.method public final getNestedScrollView()Landroidx/core/widget/NestedScrollView;
    .locals 0

    iget-object p0, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mNestedScrollView:Landroidx/core/widget/NestedScrollView;

    return-object p0
.end method

.method public final getPreferenceScreenResId()I
    .locals 0

    const p0, 0x7f180268

    return p0
.end method

.method public final isLandscapeMode()Z
    .locals 1

    iget-object p0, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mConfiguration:Landroid/content/res/Configuration;

    if-eqz p0, :cond_0

    iget p0, p0, Landroid/content/res/Configuration;->orientation:I

    const/4 v0, 0x2

    if-ne p0, v0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public final isListSpacingNeeded()Z
    .locals 0

    invoke-virtual {p0}, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->isLandscapeMode()Z

    move-result p0

    return p0
.end method

.method public final isPreferenceAnimationAllowed()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public final onActivityCreated(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/android/settings/SettingsPreferenceFragment;->onActivityCreated(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getListView()Landroidx/recyclerview/widget/RecyclerView;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getListView()Landroidx/recyclerview/widget/RecyclerView;

    move-result-object p1

    const/4 v0, 0x0

    iput-boolean v0, p1, Landroidx/recyclerview/widget/RecyclerView;->mDrawLastRoundedCorner:Z

    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getListView()Landroidx/recyclerview/widget/RecyclerView;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setItemAnimator(Landroidx/recyclerview/widget/RecyclerView$ItemAnimator;)V

    :cond_0
    return-void
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 3

    invoke-super {p0, p1}, Lcom/android/settings/SettingsPreferenceFragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget-object v0, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mConfiguration:Landroid/content/res/Configuration;

    iget v1, v0, Landroid/content/res/Configuration;->orientation:I

    iget v2, p1, Landroid/content/res/Configuration;->orientation:I

    if-eq v1, v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {v0, p1}, Landroid/content/res/Configuration;->updateFrom(Landroid/content/res/Configuration;)I

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->applyPaneConfiguration()V

    :cond_1
    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .locals 10

    invoke-super {p0, p1}, Lcom/android/settings/dashboard/DashboardFragment;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mContext:Landroid/content/Context;

    invoke-static {p1}, Lcom/samsung/android/settings/display/SecDisplayUtils;->getScreenResolution(Landroid/content/Context;)I

    move-result p1

    iput p1, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mScreenResolution:I

    new-instance p1, Landroid/content/res/Configuration;

    invoke-direct {p1}, Landroid/content/res/Configuration;-><init>()V

    iput-object p1, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mConfiguration:Landroid/content/res/Configuration;

    iget-object v0, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/content/res/Configuration;->updateFrom(Landroid/content/res/Configuration;)I

    iget-object p1, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mContext:Landroid/content/Context;

    const-class v0, Landroid/hardware/display/DisplayManager;

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/hardware/display/DisplayManager;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/hardware/display/DisplayManager;->getDisplay(I)Landroid/view/Display;

    move-result-object p1

    sput-object p1, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mDisplay:Landroid/view/Display;

    invoke-static {p1}, Lcom/samsung/android/settings/display/SecDisplayUtils;->initSupportedResolutionData(Landroid/view/Display;)V

    sget-object p1, Lcom/samsung/android/settings/Rune;->COMMON_CONFIG_PACKAGE_NAME_SMART_MANAGER:Ljava/lang/String;

    const-string/jumbo p1, "screen_resolution_seekbar"

    invoke-virtual {p0, p1}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object p1

    check-cast p1, Lcom/samsung/android/settings/widget/SecHorizontalRadioPreference;

    iput-object p1, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mScreenResolutionButton:Lcom/samsung/android/settings/widget/SecHorizontalRadioPreference;

    iget v1, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mScreenResolution:I

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/samsung/android/settings/widget/SecHorizontalRadioPreference;->setValue(Ljava/lang/String;)V

    new-instance p1, Landroid/graphics/Point;

    invoke-direct {p1}, Landroid/graphics/Point;-><init>()V

    iget-object v1, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mContext:Landroid/content/Context;

    const v2, 0x7f152ae2

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mStrBtnHD:Ljava/lang/String;

    iget-object v1, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mContext:Landroid/content/Context;

    const v2, 0x7f152ade

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mStrBtnFHD:Ljava/lang/String;

    iget-object v1, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mContext:Landroid/content/Context;

    const v2, 0x7f152af1

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mStrBtnWQHD:Ljava/lang/String;

    iget-object v1, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mContext:Landroid/content/Context;

    const v2, 0x7f152af4

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mStrBtnWUXGA:Ljava/lang/String;

    const/4 v1, 0x1

    :try_start_0
    invoke-static {}, Landroid/view/WindowManagerGlobal;->getWindowManagerService()Landroid/view/IWindowManager;

    move-result-object v2

    invoke-interface {v2, v0, p1}, Landroid/view/IWindowManager;->getInitialDisplaySize(ILandroid/graphics/Point;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    iget v2, p1, Landroid/graphics/Point;->x:I

    iget p1, p1, Landroid/graphics/Point;->y:I

    iget-object v3, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Configuration;->getLayoutDirection()I

    move-result v3

    if-ne v3, v1, :cond_0

    move v3, v1

    goto :goto_0

    :cond_0
    move v3, v0

    :goto_0
    const/16 v4, 0x4d2

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    const-string v6, "%d"

    invoke-static {v6, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    int-to-float v5, p1

    int-to-float v6, v2

    div-float/2addr v5, v6

    const v6, 0x3fe38e39

    cmpl-float v5, v5, v6

    if-lez v5, :cond_1

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mStrBtnHD:Ljava/lang/String;

    const-string v7, "+"

    invoke-static {v5, v6, v7}, Landroidx/activity/ComponentActivity$activityResultRegistry$1$$ExternalSyntheticOutline0;->m(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mStrBtnHD:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mStrBtnFHD:Ljava/lang/String;

    invoke-static {v5, v6, v7}, Landroidx/activity/ComponentActivity$activityResultRegistry$1$$ExternalSyntheticOutline0;->m(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mStrBtnFHD:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mStrBtnWQHD:Ljava/lang/String;

    invoke-static {v5, v6, v7}, Landroidx/activity/ComponentActivity$activityResultRegistry$1$$ExternalSyntheticOutline0;->m(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mStrBtnWQHD:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mStrBtnWUXGA:Ljava/lang/String;

    invoke-static {v5, v6, v7}, Landroidx/activity/ComponentActivity$activityResultRegistry$1$$ExternalSyntheticOutline0;->m(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mStrBtnWUXGA:Ljava/lang/String;

    :cond_1
    iget-object v5, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mMainTitleList:Ljava/util/ArrayList;

    iget-object v6, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mStrBtnHD:Ljava/lang/String;

    iget-object v7, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mStrBtnFHD:Ljava/lang/String;

    iget-object v8, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mStrBtnWQHD:Ljava/lang/String;

    filled-new-array {v6, v7, v8}, [Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v5

    invoke-static {v5}, Ljava/text/NumberFormat;->getInstance(Ljava/util/Locale;)Ljava/text/NumberFormat;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/text/NumberFormat;->setGroupingUsed(Z)V

    if-eqz v3, :cond_2

    if-nez v4, :cond_2

    move v0, p1

    goto :goto_1

    :cond_2
    move v0, v2

    :goto_1
    if-eqz v3, :cond_3

    if-nez v4, :cond_3

    goto :goto_2

    :cond_3
    move v2, p1

    :goto_2
    iget p1, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mScreenResolution:I

    const/4 v3, 0x3

    const/4 v4, 0x2

    if-eq p1, v1, :cond_6

    if-eq p1, v4, :cond_5

    if-eq p1, v3, :cond_4

    invoke-static {v5, v2, v0}, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->formatDimensions(Ljava/text/NumberFormat;II)Ljava/lang/String;

    move-result-object p1

    mul-int/lit8 v3, v2, 0x3

    div-int/2addr v3, v4

    mul-int/lit8 v6, v0, 0x3

    div-int/2addr v6, v4

    invoke-static {v5, v3, v6}, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->formatDimensions(Ljava/text/NumberFormat;II)Ljava/lang/String;

    move-result-object v3

    mul-int/lit8 v4, v2, 0x2

    mul-int/lit8 v6, v0, 0x2

    invoke-static {v5, v4, v6}, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->formatDimensions(Ljava/text/NumberFormat;II)Ljava/lang/String;

    move-result-object v4

    mul-int/lit8 v2, v2, 0x9

    div-int/lit8 v2, v2, 0x5

    mul-int/lit8 v0, v0, 0x9

    div-int/lit8 v0, v0, 0x5

    invoke-static {v5, v2, v0}, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->formatDimensions(Ljava/text/NumberFormat;II)Ljava/lang/String;

    goto/16 :goto_4

    :cond_4
    int-to-float p1, v2

    const v3, 0x3f0e3bcd    # 0.5556f

    mul-float v4, p1, v3

    float-to-int v4, v4

    int-to-float v6, v0

    mul-float/2addr v3, v6

    float-to-int v3, v3

    invoke-static {v5, v4, v3}, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->formatDimensions(Ljava/text/NumberFormat;II)Ljava/lang/String;

    move-result-object v3

    const v4, 0x3f5559b4    # 0.8334f

    mul-float v7, p1, v4

    float-to-int v7, v7

    mul-float/2addr v4, v6

    float-to-int v4, v4

    invoke-static {v5, v7, v4}, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->formatDimensions(Ljava/text/NumberFormat;II)Ljava/lang/String;

    move-result-object v4

    const v7, 0x3f8e3bcd    # 1.1112f

    mul-float/2addr p1, v7

    float-to-int p1, p1

    mul-float/2addr v6, v7

    float-to-int v6, v6

    invoke-static {v5, p1, v6}, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->formatDimensions(Ljava/text/NumberFormat;II)Ljava/lang/String;

    move-result-object p1

    invoke-static {v5, v2, v0}, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->formatDimensions(Ljava/text/NumberFormat;II)Ljava/lang/String;

    move-object v9, v4

    move-object v4, p1

    move-object p1, v3

    :goto_3
    move-object v3, v9

    goto :goto_4

    :cond_5
    div-int/lit8 p1, v2, 0x2

    div-int/lit8 v3, v0, 0x2

    invoke-static {v5, p1, v3}, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->formatDimensions(Ljava/text/NumberFormat;II)Ljava/lang/String;

    move-result-object p1

    mul-int/lit8 v3, v2, 0x3

    div-int/lit8 v3, v3, 0x4

    mul-int/lit8 v4, v0, 0x3

    div-int/lit8 v4, v4, 0x4

    invoke-static {v5, v3, v4}, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->formatDimensions(Ljava/text/NumberFormat;II)Ljava/lang/String;

    move-result-object v3

    invoke-static {v5, v2, v0}, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->formatDimensions(Ljava/text/NumberFormat;II)Ljava/lang/String;

    move-result-object v4

    mul-int/lit8 v2, v2, 0x9

    div-int/lit8 v2, v2, 0xa

    mul-int/lit8 v0, v0, 0x9

    div-int/lit8 v0, v0, 0xa

    invoke-static {v5, v2, v0}, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->formatDimensions(Ljava/text/NumberFormat;II)Ljava/lang/String;

    goto :goto_4

    :cond_6
    div-int/lit8 p1, v2, 0x3

    mul-int/2addr p1, v4

    div-int/lit8 v6, v0, 0x3

    mul-int/2addr v6, v4

    invoke-static {v5, p1, v6}, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->formatDimensions(Ljava/text/NumberFormat;II)Ljava/lang/String;

    move-result-object p1

    invoke-static {v5, v2, v0}, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->formatDimensions(Ljava/text/NumberFormat;II)Ljava/lang/String;

    move-result-object v4

    mul-int/lit8 v6, v2, 0x4

    div-int/2addr v6, v3

    mul-int/lit8 v7, v0, 0x4

    div-int/2addr v7, v3

    invoke-static {v5, v6, v7}, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->formatDimensions(Ljava/text/NumberFormat;II)Ljava/lang/String;

    move-result-object v3

    mul-int/lit8 v2, v2, 0x6

    div-int/lit8 v2, v2, 0x5

    mul-int/lit8 v0, v0, 0x6

    div-int/lit8 v0, v0, 0x5

    invoke-static {v5, v2, v0}, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->formatDimensions(Ljava/text/NumberFormat;II)Ljava/lang/String;

    move-object v9, v4

    move-object v4, v3

    goto :goto_3

    :goto_4
    const-string p1, "1520 x 720"

    const-string v3, "2280 x 1080"

    const-string v4, "3040 x 1440"

    iget-object v0, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mSubTitleList:Ljava/util/ArrayList;

    filled-new-array {p1, v3, v4}, [Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    iget-object p1, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mEntryValues:Ljava/util/ArrayList;

    const-string v0, "0"

    const-string v2, "2"

    const-string v3, "1"

    filled-new-array {v0, v3, v2}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    goto :goto_5

    :catch_0
    const-string/jumbo p1, "ScreenResolutionFragment"

    const-string/jumbo v0, "getInitialDisplaySize() exception!!!"

    invoke-static {p1, v0}, Landroid/util/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    :goto_5
    new-instance p1, Lcom/samsung/android/settings/widget/RadioItemDataInfo$Builder;

    iget-object v0, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mEntryValues:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mMainTitleList:Ljava/util/ArrayList;

    invoke-direct {p1, v0, v2}, Lcom/samsung/android/settings/widget/RadioItemDataInfo$Builder;-><init>(Ljava/util/List;Ljava/util/List;)V

    iget-object v0, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mSubTitleList:Ljava/util/ArrayList;

    iput-object v0, p1, Lcom/samsung/android/settings/widget/RadioItemDataInfo$Builder;->mSubTitleList:Ljava/util/List;

    invoke-virtual {p1}, Lcom/samsung/android/settings/widget/RadioItemDataInfo$Builder;->build()Lcom/samsung/android/settings/widget/RadioItemDataInfo;

    move-result-object p1

    iget-object v0, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mScreenResolutionButton:Lcom/samsung/android/settings/widget/SecHorizontalRadioPreference;

    if-nez p1, :cond_7

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string/jumbo p1, "SecHorizontalRadioPreference"

    const-string/jumbo v0, "There are no ItemDataInfo for RadioItems"

    invoke-static {p1, v0}, Lcom/samsung/android/util/SemLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_6

    :cond_7
    iput-object p1, v0, Lcom/samsung/android/settings/widget/SecHorizontalRadioPreference;->mRadioItemDataInfo:Lcom/samsung/android/settings/widget/RadioItemDataInfo;

    :goto_6
    iget-object p1, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mScreenResolutionButton:Lcom/samsung/android/settings/widget/SecHorizontalRadioPreference;

    iput-boolean v1, p1, Lcom/samsung/android/settings/widget/SecHorizontalRadioPreference;->mIsColorFilterEnabled:Z

    iput-boolean v1, p1, Lcom/samsung/android/settings/widget/SecHorizontalRadioPreference;->mIsDividerEnabled:Z

    const/16 v0, 0xf

    invoke-virtual {p1, v0}, Landroidx/preference/Preference;->seslSetRoundedBg(I)V

    new-instance p1, Lcom/samsung/android/settings/widget/SecButtonPreference;

    iget-object v0, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mContext:Landroid/content/Context;

    invoke-direct {p1, v0}, Lcom/samsung/android/settings/widget/SecButtonPreference;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mApplyButton:Lcom/samsung/android/settings/widget/SecButtonPreference;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f150d6a

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/samsung/android/settings/widget/SecButtonPreference;->setButtonText$1(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mApplyButton:Lcom/samsung/android/settings/widget/SecButtonPreference;

    iget-boolean v0, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mScreenChangeState:Z

    invoke-virtual {p1, v0}, Landroidx/preference/Preference;->setEnabled(Z)V

    iget-object p1, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mApplyButton:Lcom/samsung/android/settings/widget/SecButtonPreference;

    new-instance v0, Lcom/samsung/android/settings/display/ScreenResolutionFragment$2;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object p0, v0, Lcom/samsung/android/settings/display/ScreenResolutionFragment$2;->this$0:Lcom/samsung/android/settings/display/ScreenResolutionFragment;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    iput-object v0, p1, Lcom/samsung/android/settings/widget/SecButtonPreference;->mOnClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object p1

    iget-object v0, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mApplyButton:Lcom/samsung/android/settings/widget/SecButtonPreference;

    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceGroup;->addPreference(Landroidx/preference/Preference;)Z

    const-string/jumbo p1, "screen_resolution_help_description"

    invoke-virtual {p0, p1}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object p1

    check-cast p1, Lcom/android/settingslib/widget/LayoutPreference;

    const v0, 0x7f0b1144

    iget-object p1, p1, Lcom/android/settingslib/widget/LayoutPreference;->mRootView:Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iget-object v0, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mScreenResolutionButton:Lcom/samsung/android/settings/widget/SecHorizontalRadioPreference;

    new-instance v1, Lcom/samsung/android/settings/display/ScreenResolutionFragment$3;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object p1, v1, Lcom/samsung/android/settings/display/ScreenResolutionFragment$3;->val$helpTextView:Landroid/widget/TextView;

    iput-object p0, v1, Lcom/samsung/android/settings/display/ScreenResolutionFragment$3;->this$0:Lcom/samsung/android/settings/display/ScreenResolutionFragment;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {v0, v1}, Landroidx/preference/Preference;->setOnPreferenceChangeListener(Landroidx/preference/Preference$OnPreferenceChangeListener;)V

    iget-object p1, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mConfiguration:Landroid/content/res/Configuration;

    iget p1, p1, Landroid/content/res/Configuration;->orientation:I

    iput p1, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mPreviewRowOrientation:I

    return-void
.end method

.method public final onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 5

    invoke-super {p0, p1, p2, p3}, Lcom/android/settings/SettingsPreferenceFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_3

    iget-object p2, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mContext:Landroid/content/Context;

    if-nez p2, :cond_0

    goto :goto_0

    :cond_0
    new-instance p2, Landroidx/core/widget/NestedScrollView;

    iget-object p3, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mContext:Landroid/content/Context;

    invoke-direct {p2, p3}, Landroidx/core/widget/NestedScrollView;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mNestedScrollView:Landroidx/core/widget/NestedScrollView;

    new-instance p3, Landroid/view/ViewGroup$LayoutParams;

    const/4 v0, -0x1

    invoke-direct {p3, v0, v0}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {p2, p3}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object p2, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mNestedScrollView:Landroidx/core/widget/NestedScrollView;

    const/4 p3, 0x1

    invoke-virtual {p2, p3}, Landroidx/core/widget/NestedScrollView;->setFillViewport(Z)V

    new-instance p2, Landroid/widget/LinearLayout;

    iget-object p3, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mContext:Landroid/content/Context;

    invoke-direct {p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 p3, 0x0

    invoke-virtual {p2, p3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v1, v0, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p2, v1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/FrameLayout;

    iget-object v2, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v3, 0x40a00000    # 5.0f

    invoke-direct {v2, p3, v0, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {p2, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v2, Landroid/widget/FrameLayout;

    iget-object v4, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mContext:Landroid/content/Context;

    invoke-direct {v2, v4}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v4, p3, v0, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {p2, v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    instance-of v3, v3, Landroid/view/ViewGroup;

    if-eqz v3, :cond_1

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup;

    invoke-virtual {v3, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_1
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v3, v0, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, p1, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iput-object v1, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mPreviewPane:Landroid/view/ViewGroup;

    instance-of v0, p1, Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v0, :cond_2

    invoke-virtual {p1, p3}, Landroid/view/View;->setNestedScrollingEnabled(Z)V

    :cond_2
    iget-object p1, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mNestedScrollView:Landroidx/core/widget/NestedScrollView;

    invoke-virtual {p1, p2}, Landroidx/core/widget/NestedScrollView;->addView(Landroid/view/View;)V

    iget-object p1, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mNestedScrollView:Landroidx/core/widget/NestedScrollView;

    invoke-virtual {p0}, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->applyPaneConfiguration()V

    :cond_3
    :goto_0
    return-object p1
.end method

.method public final onDestroyView()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mPreviewPane:Landroid/view/ViewGroup;

    invoke-super {p0}, Lcom/android/settings/SettingsPreferenceFragment;->onDestroyView()V

    return-void
.end method

.method public final onDetach()V
    .locals 2

    const-string/jumbo v0, "ScreenResolutionFragment"

    const-string/jumbo v1, "onDetach"

    invoke-static {v0, v1}, Landroid/util/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mFinishFragmentRunnable:Lcom/samsung/android/settings/display/ScreenResolutionFragment$$ExternalSyntheticLambda0;

    if-eqz v0, :cond_0

    sget-object v1, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->sHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mFinishFragmentRunnable:Lcom/samsung/android/settings/display/ScreenResolutionFragment$$ExternalSyntheticLambda0;

    :cond_0
    invoke-super {p0}, Lcom/android/settings/SettingsPreferenceFragment;->onDetach()V

    return-void
.end method

.method public final onPause()V
    .locals 2

    iget-boolean v0, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mIsFinishedWithDelay:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mIsFinishedWithDelay:Z

    sget-object v0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->sHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mFinishFragmentRunnable:Lcom/samsung/android/settings/display/ScreenResolutionFragment$$ExternalSyntheticLambda0;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->finish()V

    :cond_0
    invoke-super {p0}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->onPause()V

    iget-object v0, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mDesktopModeManager:Lcom/samsung/android/desktopmode/SemDesktopModeManager;

    if-eqz v0, :cond_1

    iget-object p0, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mDesktopModeListener:Lcom/samsung/android/settings/display/ScreenResolutionFragment$1;

    invoke-virtual {v0, p0}, Lcom/samsung/android/desktopmode/SemDesktopModeManager;->unregisterListener(Lcom/samsung/android/desktopmode/SemDesktopModeManager$DesktopModeListener;)V

    :cond_1
    return-void
.end method

.method public final onResume()V
    .locals 2

    invoke-super {p0}, Lcom/android/settings/dashboard/DashboardFragment;->onResume()V

    iget-object v0, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/android/settings/Utils;->isDesktopModeEnabled(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/android/settings/SettingsPreferenceFragment;->finish()V

    :cond_0
    sget-object v0, Lcom/samsung/android/settings/Rune;->COMMON_CONFIG_PACKAGE_NAME_SMART_MANAGER:Ljava/lang/String;

    iget-object v0, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mScreenResolutionButton:Lcom/samsung/android/settings/widget/SecHorizontalRadioPreference;

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mApplyButton:Lcom/samsung/android/settings/widget/SecButtonPreference;

    if-eqz v1, :cond_1

    iget v1, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mScreenResolution:I

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/samsung/android/settings/widget/SecHorizontalRadioPreference;->setValue(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mScreenResolutionButton:Lcom/samsung/android/settings/widget/SecHorizontalRadioPreference;

    iget-object v0, v0, Lcom/samsung/android/settings/widget/SecHorizontalRadioPreference;->mCurrentValue:Landroidx/lifecycle/MutableLiveData;

    invoke-virtual {v0}, Landroidx/lifecycle/LiveData;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget v1, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mScreenResolution:I

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    iput-boolean v0, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mScreenChangeState:Z

    iget-object v1, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mApplyButton:Lcom/samsung/android/settings/widget/SecButtonPreference;

    invoke-virtual {v1, v0}, Landroidx/preference/Preference;->setEnabled(Z)V

    :cond_1
    iget-object v0, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mContext:Landroid/content/Context;

    const-string/jumbo v1, "desktopmode"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/samsung/android/desktopmode/SemDesktopModeManager;

    iput-object v0, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mDesktopModeManager:Lcom/samsung/android/desktopmode/SemDesktopModeManager;

    if-eqz v0, :cond_2

    new-instance v1, Lcom/samsung/android/settings/display/ScreenResolutionFragment$1;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object p0, v1, Lcom/samsung/android/settings/display/ScreenResolutionFragment$1;->this$0:Lcom/samsung/android/settings/display/ScreenResolutionFragment;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    iput-object v1, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mDesktopModeListener:Lcom/samsung/android/settings/display/ScreenResolutionFragment$1;

    invoke-virtual {v0, v1}, Lcom/samsung/android/desktopmode/SemDesktopModeManager;->registerListener(Lcom/samsung/android/desktopmode/SemDesktopModeManager$DesktopModeListener;)V

    :cond_2
    return-void
.end method

.method public final onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    iget-object v0, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mScreenResolutionButton:Lcom/samsung/android/settings/widget/SecHorizontalRadioPreference;

    if-eqz v0, :cond_0

    iget-object v0, v0, Lcom/samsung/android/settings/widget/SecHorizontalRadioPreference;->mCurrentValue:Landroidx/lifecycle/MutableLiveData;

    invoke-virtual {v0}, Landroidx/lifecycle/LiveData;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz p1, :cond_1

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string/jumbo v1, "selected_value"

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    :cond_1
    invoke-super {p0, p1}, Lcom/android/settings/SettingsPreferenceFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    return-void
.end method

.method public final onStop()V
    .locals 2

    const-string/jumbo v0, "ScreenResolutionFragment"

    const-string/jumbo v1, "onStop"

    invoke-static {v0, v1}, Landroid/util/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mFinishFragmentRunnable:Lcom/samsung/android/settings/display/ScreenResolutionFragment$$ExternalSyntheticLambda0;

    if-eqz v0, :cond_0

    sget-object v1, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->sHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mFinishFragmentRunnable:Lcom/samsung/android/settings/display/ScreenResolutionFragment$$ExternalSyntheticLambda0;

    :cond_0
    invoke-super {p0}, Lcom/android/settings/dashboard/DashboardFragment;->onStop()V

    return-void
.end method

.method public final onViewStateRestored(Landroid/os/Bundle;)V
    .locals 1

    iget-object v0, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/samsung/android/settings/display/SecDisplayUtils;->getScreenResolution(Landroid/content/Context;)I

    move-result v0

    iput v0, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mScreenResolution:I

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onViewStateRestored(Landroid/os/Bundle;)V

    return-void
.end method

.method public final showPreviewRow()V
    .locals 4

    iget-object v0, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mContext:Landroid/content/Context;

    if-eqz v0, :cond_3

    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mConfiguration:Landroid/content/res/Configuration;

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    const-string/jumbo v0, "screen_resolution_preview"

    invoke-virtual {p0, v0}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object v1

    if-eqz v1, :cond_1

    iget v2, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mPreviewRowOrientation:I

    iget-object v3, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mConfiguration:Landroid/content/res/Configuration;

    iget v3, v3, Landroid/content/res/Configuration;->orientation:I

    if-ne v2, v3, :cond_1

    const/4 p0, 0x1

    invoke-virtual {v1, p0}, Landroidx/preference/Preference;->setVisible(Z)V

    return-void

    :cond_1
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object v1

    if-nez v1, :cond_2

    goto :goto_0

    :cond_2
    invoke-virtual {p0, v0}, Lcom/android/settings/SettingsPreferenceFragment;->removePreference(Ljava/lang/String;)Z

    :goto_0
    new-instance v1, Lcom/android/settingslib/widget/LayoutPreference;

    iget-object v2, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mContext:Landroid/content/Context;

    const v3, 0x7f0e07b9

    invoke-direct {v1, v2, v3}, Lcom/android/settingslib/widget/LayoutPreference;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v1, v0}, Landroidx/preference/Preference;->setKey(Ljava/lang/String;)V

    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Landroidx/preference/Preference;->setSelectable(Z)V

    invoke-virtual {v1, v0}, Landroidx/preference/Preference;->setOrder(I)V

    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->getPreferenceScreen()Landroidx/preference/PreferenceScreen;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroidx/preference/PreferenceGroup;->addPreference(Landroidx/preference/Preference;)Z

    iget-object v0, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mConfiguration:Landroid/content/res/Configuration;

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    iput v0, p0, Lcom/samsung/android/settings/display/ScreenResolutionFragment;->mPreviewRowOrientation:I

    :cond_3
    :goto_1
    return-void
.end method
