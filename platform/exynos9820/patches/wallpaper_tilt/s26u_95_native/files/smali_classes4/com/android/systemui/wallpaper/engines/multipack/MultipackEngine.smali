.class public Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;
.super Lcom/android/systemui/wallpaper/engines/WallpaperEngine;
.source "qb/117478588 63230b00838586e9741071cb17d7b2dfd30e23ac5c32aa66524c0dd85ab02e4f"


# instance fields
.field public final TAG:Ljava/lang/String;

.field public final mCallback:Lcom/android/systemui/wallpaper/engines/WallpaperEngineCallback;

.field public final mCoverWallpaper:Lcom/android/systemui/wallpaper/CoverWallpaper;

.field public final mCoverWallpaperConsumer:Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine$1;

.field public final mDozeParameters:Lcom/android/systemui/statusbar/phone/DozeParameters;

.field public final mDrawLock:Ljava/lang/Object;

.field public mIsAlive:Z

.field public mIsFirstTransition:Z

.field public mIsVisibilityReported:Z

.field public final mKeyguardUpdateMonitor:Lcom/android/keyguard/KeyguardUpdateMonitor;

.field public final mKeyguardWallpaper:Lcom/android/systemui/wallpaper/KeyguardWallpaper;

.field public final mLongExecutor:Lcom/android/systemui/util/concurrency/DelayableExecutor;

.field public mNextType:I

.field public final mPluginUpdateTask:Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine$$ExternalSyntheticLambda1;

.field public final mPluginWallpaper:Lcom/android/systemui/wallpaper/PluginWallpaper;

.field public final mPluginWallpaperConsumer:Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine$2;

.field public mPrevScreenshot:Landroid/graphics/Bitmap;

.field public mPrevType:I

.field private final mSettingsHelper:Lcom/android/systemui/util/SettingsHelper;

.field public mSubEngine:Lcom/android/systemui/wallpaper/engines/WallpaperEngine;

.field public mSurfaceHolder:Landroid/view/SurfaceHolder;

.field public final mSystemWallpaperColors:Lcom/android/systemui/wallpaper/colors/SystemWallpaperColors;

.field public final mWallpaperAnimator:Lcom/android/systemui/wallpaper/engines/WallpaperAnimator;


# direct methods
.method public constructor <init>(Lcom/android/systemui/wallpaper/engines/WallpaperEngineCallback;Lcom/android/systemui/wallpaper/CoverWallpaper;Lcom/android/systemui/wallpaper/PluginWallpaper;Lcom/android/systemui/util/SettingsHelper;Lcom/android/systemui/wallpaper/colors/SystemWallpaperColors;Lcom/android/systemui/util/concurrency/DelayableExecutor;Lcom/android/systemui/statusbar/phone/DozeParameters;Lcom/android/systemui/wallpaper/KeyguardWallpaper;Lcom/android/keyguard/KeyguardUpdateMonitor;)V
    .locals 2

    invoke-direct {p0, p1}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;-><init>(Lcom/android/systemui/wallpaper/engines/WallpaperEngineCallback;)V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mDrawLock:Ljava/lang/Object;

    new-instance v0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine$$ExternalSyntheticLambda1;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine$$ExternalSyntheticLambda1;-><init>(B)V

    iput-object p0, v0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    iput-object v0, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mPluginUpdateTask:Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine$$ExternalSyntheticLambda1;

    new-instance v0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine$1;

    invoke-direct {v0, p0}, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine$1;-><init>(Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;)V

    iput-object v0, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mCoverWallpaperConsumer:Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine$1;

    new-instance v0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine$2;

    invoke-direct {v0, p0}, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine$2;-><init>(Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;)V

    iput-object v0, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mPluginWallpaperConsumer:Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine$2;

    const/4 v0, -0x1

    iput v0, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mPrevType:I

    iput v0, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mNextType:I

    iput-boolean v1, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mIsAlive:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mIsFirstTransition:Z

    iput-boolean v1, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mIsVisibilityReported:Z

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "ImageWallpaper_"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getWhich()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string/jumbo v1, "[Multipack]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->TAG:Ljava/lang/String;

    iput-object p1, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mCallback:Lcom/android/systemui/wallpaper/engines/WallpaperEngineCallback;

    iput-object p6, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mLongExecutor:Lcom/android/systemui/util/concurrency/DelayableExecutor;

    iput-object p2, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mCoverWallpaper:Lcom/android/systemui/wallpaper/CoverWallpaper;

    iput-object p7, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mDozeParameters:Lcom/android/systemui/statusbar/phone/DozeParameters;

    iput-object p4, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mSettingsHelper:Lcom/android/systemui/util/SettingsHelper;

    iput-object p3, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mPluginWallpaper:Lcom/android/systemui/wallpaper/PluginWallpaper;

    iput-object p8, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mKeyguardWallpaper:Lcom/android/systemui/wallpaper/KeyguardWallpaper;

    iput-object p9, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mKeyguardUpdateMonitor:Lcom/android/keyguard/KeyguardUpdateMonitor;

    iput-object p5, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mSystemWallpaperColors:Lcom/android/systemui/wallpaper/colors/SystemWallpaperColors;

    new-instance p1, Lcom/android/systemui/wallpaper/engines/WallpaperAnimator;

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getSurfaceHolder()Landroid/view/SurfaceHolder;

    move-result-object p2

    iget-object p3, p0, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->mCallback:Lcom/android/systemui/wallpaper/engines/WallpaperEngineCallback;

    check-cast p3, Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine$2;

    invoke-virtual {p3}, Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine$2;->getSurfaceControl()Landroid/view/SurfaceControl;

    move-result-object p3

    invoke-direct {p1, p2, p3, p9}, Lcom/android/systemui/wallpaper/engines/WallpaperAnimator;-><init>(Landroid/view/SurfaceHolder;Landroid/view/SurfaceControl;Lcom/android/keyguard/KeyguardUpdateMonitor;)V

    iput-object p1, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mWallpaperAnimator:Lcom/android/systemui/wallpaper/engines/WallpaperAnimator;

    return-void
.end method


# virtual methods
.method public final canSupportScaleAnimation(Lcom/android/systemui/wallpaper/engines/WallpaperEngine;)Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public final draw(Landroid/view/SurfaceHolder;)Z
    .locals 1

    iget-object v0, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mDrawLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object p0, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mSubEngine:Lcom/android/systemui/wallpaper/engines/WallpaperEngine;

    if-eqz p0, :cond_0

    invoke-virtual {p0, p1}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->draw(Landroid/view/SurfaceHolder;)Z

    move-result p0

    monitor-exit v0

    return p0

    :catchall_0
    move-exception p0

    goto :goto_0

    :cond_0
    monitor-exit v0

    const/4 p0, 0x0

    return p0

    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public final dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 0

    iget-object p0, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mSubEngine:Lcom/android/systemui/wallpaper/engines/WallpaperEngine;

    if-eqz p0, :cond_0

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public final initSubEngine(Lcom/android/systemui/wallpaper/engines/WallpaperEngine;)V
    .locals 4

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getSurfaceHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->onCreate(Landroid/view/SurfaceHolder;)V

    iget-object v0, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    if-eqz v0, :cond_2

    instance-of v0, p1, Lcom/android/systemui/wallpaper/engines/multipack/TransitionEngine;

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "initSubEngine: mPrevType = "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mPrevType:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", mNextType = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mNextType:I

    iget-object v2, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->TAG:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Landroidx/appcompat/widget/SearchView$$ExternalSyntheticOutline0;->m(Ljava/lang/StringBuilder;ILjava/lang/String;)V

    iget v0, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mNextType:I

    iput v0, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mPrevType:I

    invoke-virtual {p0, p1}, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->canSupportScaleAnimation(Lcom/android/systemui/wallpaper/engines/WallpaperEngine;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mWallpaperAnimator:Lcom/android/systemui/wallpaper/engines/WallpaperAnimator;

    invoke-virtual {v0}, Lcom/android/systemui/wallpaper/engines/WallpaperAnimator;->release()V

    :cond_0
    iget-object v0, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    invoke-virtual {p1, v0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->onSurfaceCreated(Landroid/view/SurfaceHolder;)V

    iget-object v0, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    invoke-interface {v0}, Landroid/view/SurfaceHolder;->getSurfaceFrame()Landroid/graphics/Rect;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v2

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    const/4 v3, 0x0

    invoke-virtual {p1, v1, v3, v2, v0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->onSurfaceChanged(Landroid/view/SurfaceHolder;III)V

    :cond_1
    iget-boolean v0, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mIsVisibilityReported:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    invoke-virtual {p1, v0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->onSurfaceRedrawNeeded(Landroid/view/SurfaceHolder;)V

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->isVisible()Z

    move-result p0

    invoke-virtual {p1, p0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->onVisibilityChanged(Z)V

    :cond_2
    return-void
.end method

.method public final isScaleAnimationEnabled()Z
    .locals 1

    iget-object v0, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mSubEngine:Lcom/android/systemui/wallpaper/engines/WallpaperEngine;

    invoke-virtual {p0, v0}, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->canSupportScaleAnimation(Lcom/android/systemui/wallpaper/engines/WallpaperEngine;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->willShowAodWithWallpaper$1()Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public final onCommand(Ljava/lang/String;IIILandroid/os/Bundle;Z)V
    .locals 7

    iget-object v0, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mSubEngine:Lcom/android/systemui/wallpaper/engines/WallpaperEngine;

    move-object v1, p1

    if-eqz v0, :cond_0

    move v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p5

    move v6, p6

    invoke-virtual/range {v0 .. v6}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->onCommand(Ljava/lang/String;IIILandroid/os/Bundle;Z)V

    :cond_0
    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->isScaleAnimationEnabled()Z

    move-result p1

    if-eqz p1, :cond_3

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string/jumbo p1, "samsung.android.wallpaper.resume"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    iget-object p0, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mWallpaperAnimator:Lcom/android/systemui/wallpaper/engines/WallpaperAnimator;

    if-nez p1, :cond_2

    const-string/jumbo p1, "android.wallpaper.keyguardgoingaway"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/systemui/wallpaper/engines/WallpaperAnimator;->mKeyguardState:Z

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lcom/android/systemui/wallpaper/engines/WallpaperAnimator;->TAG:Ljava/lang/String;

    const-string/jumbo p2, "changeToDownScaleImmediately"

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/WallpaperAnimator;->release()V

    const/high16 p1, 0x3f800000    # 1.0f

    invoke-virtual {p0, p1}, Lcom/android/systemui/wallpaper/engines/WallpaperAnimator;->onTransitionScaleChanged(F)V

    :cond_3
    :goto_0
    return-void
.end method

.method public final onCreate(Landroid/view/SurfaceHolder;)V
    .locals 3

    iget-object p1, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->TAG:Ljava/lang/String;

    const-string/jumbo v0, "onCreate"

    invoke-static {p1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mIsAlive:Z

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getWhich()I

    move-result p1

    invoke-static {p1}, Lcom/android/systemui/wallpaper/utils/WhichChecker;->isWatchFace(I)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-static {p1}, Lcom/android/systemui/wallpaper/utils/WhichChecker;->isVirtualDisplay(I)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getWhich()I

    move-result v0

    const/4 v1, 0x2

    invoke-static {v0, v1}, Lcom/android/systemui/wallpaper/utils/WhichChecker;->isFlagEnabled(II)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mPluginWallpaper:Lcom/android/systemui/wallpaper/PluginWallpaper;

    check-cast v0, Lcom/android/systemui/wallpaper/PluginWallpaperController;

    iget-object v1, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mPluginWallpaperConsumer:Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine$2;

    invoke-virtual {v0, p1, v1}, Lcom/android/systemui/wallpaper/PluginWallpaperController;->setWallpaperUpdateConsumer(ILjava/util/function/Consumer;)V

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getWhich()I

    move-result p1

    iget-object v0, v0, Lcom/android/systemui/wallpaper/PluginWallpaperController;->mWallpaperId:[I

    invoke-static {p1}, Lcom/android/systemui/wallpaper/PluginWallpaperController;->getScreen(I)I

    move-result p1

    aget p1, v0, p1

    invoke-virtual {p0, p1}, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->updateWallpaperIfReady(I)V

    :cond_1
    return-void

    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mCoverWallpaper:Lcom/android/systemui/wallpaper/CoverWallpaper;

    check-cast p1, Lcom/android/systemui/wallpaper/CoverWallpaperController;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "setWallpaperUpdateConsumer: consumer = "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mCoverWallpaperConsumer:Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine$1;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "CoverWallpaperController"

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput-object v1, p1, Lcom/android/systemui/wallpaper/CoverWallpaperController;->mWallpaperConsumer:Ljava/util/function/Consumer;

    iget p1, p1, Lcom/android/systemui/wallpaper/CoverWallpaperController;->mWallpaperId:I

    invoke-virtual {p0, p1}, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->updateWallpaperIfReady(I)V

    return-void
.end method

.method public final onDestroy()V
    .locals 2

    iget-object v0, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "onDestroy"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mIsAlive:Z

    iget-object v0, p0, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->mCallback:Lcom/android/systemui/wallpaper/engines/WallpaperEngineCallback;

    check-cast v0, Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine$2;

    iget-object v0, v0, Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine$2;->this$1:Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine;

    iget-object v0, v0, Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine;->this$0:Lcom/android/systemui/wallpapers/ImageWallpaper;

    iget-object v0, v0, Lcom/android/systemui/wallpapers/ImageWallpaper;->mWorker:Landroid/os/HandlerThread;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Landroid/os/HandlerThread;->getThreadHandler()Landroid/os/Handler;

    move-result-object v0

    :goto_0
    if-nez v0, :cond_1

    goto :goto_1

    :cond_1
    iget-object v1, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mPluginUpdateTask:Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine$$ExternalSyntheticLambda1;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    :goto_1
    iget-object v0, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mWallpaperAnimator:Lcom/android/systemui/wallpaper/engines/WallpaperAnimator;

    invoke-virtual {v0}, Lcom/android/systemui/wallpaper/engines/WallpaperAnimator;->release()V

    iget-object p0, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mSubEngine:Lcom/android/systemui/wallpaper/engines/WallpaperEngine;

    if-eqz p0, :cond_2

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->onDestroy()V

    :cond_2
    return-void
.end method

.method public final onDisplayStateChanged(Lcom/samsung/android/wallpaper/live/sdk/data/DisplayState;Lcom/samsung/android/wallpaper/live/sdk/data/DisplayState;)V
    .locals 6

    new-instance v0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine$$ExternalSyntheticLambda2;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object p0, v0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine$$ExternalSyntheticLambda2;->f$0:Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;

    iput-object p1, v0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine$$ExternalSyntheticLambda2;->f$1:Lcom/samsung/android/wallpaper/live/sdk/data/DisplayState;

    iput-object p2, v0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine$$ExternalSyntheticLambda2;->f$2:Lcom/samsung/android/wallpaper/live/sdk/data/DisplayState;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {p0, v0}, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->runAsWorkerThread$1$1(Ljava/lang/Runnable;)V

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->isScaleAnimationEnabled()Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getWhich()I

    move-result v2

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->isVisible()Z

    move-result v3

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->willShowAodWithWallpaper$1()Z

    move-result v4

    const/4 v5, 0x1

    iget-object v0, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mWallpaperAnimator:Lcom/android/systemui/wallpaper/engines/WallpaperAnimator;

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lcom/android/systemui/wallpaper/engines/WallpaperAnimator;->onDisplayStateChanged(Lcom/samsung/android/wallpaper/live/sdk/data/DisplayState;IZZZ)V

    :cond_0
    return-void
.end method

.method public final onGetScreenshot(Lcom/samsung/android/wallpaper/live/sdk/data/ScreenshotOptions;)Lcom/samsung/android/wallpaper/live/sdk/data/ScreenshotResults;
    .locals 0

    iget-object p0, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mSubEngine:Lcom/android/systemui/wallpaper/engines/WallpaperEngine;

    if-eqz p0, :cond_0

    invoke-virtual {p0, p1}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->onGetScreenshot(Lcom/samsung/android/wallpaper/live/sdk/data/ScreenshotOptions;)Lcom/samsung/android/wallpaper/live/sdk/data/ScreenshotResults;

    move-result-object p0

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public final onStartedWakingUp()V
    .locals 0

    iget-object p0, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mSubEngine:Lcom/android/systemui/wallpaper/engines/WallpaperEngine;

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->onStartedWakingUp()V

    :cond_0
    return-void
.end method

.method public final onSurfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 0

    iput-object p1, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    iget-object p0, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mSubEngine:Lcom/android/systemui/wallpaper/engines/WallpaperEngine;

    if-eqz p0, :cond_0

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->onSurfaceChanged(Landroid/view/SurfaceHolder;III)V

    :cond_0
    return-void
.end method

.method public final onSurfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 0

    iput-object p1, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    iget-object p0, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mSubEngine:Lcom/android/systemui/wallpaper/engines/WallpaperEngine;

    if-eqz p0, :cond_0

    invoke-virtual {p0, p1}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->onSurfaceCreated(Landroid/view/SurfaceHolder;)V

    :cond_0
    return-void
.end method

.method public final onSurfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 0

    iget-object p0, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mSubEngine:Lcom/android/systemui/wallpaper/engines/WallpaperEngine;

    if-eqz p0, :cond_0

    invoke-virtual {p0, p1}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->onSurfaceDestroyed(Landroid/view/SurfaceHolder;)V

    :cond_0
    return-void
.end method

.method public final onSurfaceRedrawNeeded(Landroid/view/SurfaceHolder;)V
    .locals 0

    iget-object p0, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mSubEngine:Lcom/android/systemui/wallpaper/engines/WallpaperEngine;

    if-eqz p0, :cond_0

    invoke-virtual {p0, p1}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->onSurfaceRedrawNeeded(Landroid/view/SurfaceHolder;)V

    :cond_0
    return-void
.end method

.method public final onSwitchDisplayChanged(Z)V
    .locals 0

    iget-object p0, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mSubEngine:Lcom/android/systemui/wallpaper/engines/WallpaperEngine;

    if-eqz p0, :cond_0

    invoke-virtual {p0, p1}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->onSwitchDisplayChanged(Z)V

    :cond_0
    return-void
.end method

.method public final onVisibilityChanged(Z)V
    .locals 3

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mIsVisibilityReported:Z

    iget-object v1, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mSubEngine:Lcom/android/systemui/wallpaper/engines/WallpaperEngine;

    if-eqz v1, :cond_0

    invoke-virtual {v1, p1}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->onVisibilityChanged(Z)V

    :cond_0
    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->isScaleAnimationEnabled()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getWhich()I

    move-result v1

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->willShowAodWithWallpaper$1()Z

    move-result v2

    iget-object p0, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mWallpaperAnimator:Lcom/android/systemui/wallpaper/engines/WallpaperAnimator;

    invoke-virtual {p0, v1, p1, v2, v0}, Lcom/android/systemui/wallpaper/engines/WallpaperAnimator;->onEngineVisibilityChanged(IZZZ)V

    :cond_1
    return-void
.end method

.method public final runAsWorkerThread$1$1(Ljava/lang/Runnable;)V
    .locals 0

    iget-object p0, p0, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->mCallback:Lcom/android/systemui/wallpaper/engines/WallpaperEngineCallback;

    check-cast p0, Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine$2;

    iget-object p0, p0, Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine$2;->this$1:Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine;

    iget-object p0, p0, Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine;->this$0:Lcom/android/systemui/wallpapers/ImageWallpaper;

    iget-object p0, p0, Lcom/android/systemui/wallpapers/ImageWallpaper;->mWorker:Landroid/os/HandlerThread;

    if-nez p0, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Landroid/os/HandlerThread;->getThreadHandler()Landroid/os/Handler;

    move-result-object p0

    :goto_0
    if-nez p0, :cond_1

    return-void

    :cond_1
    invoke-virtual {p0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final shouldWaitForEngineShown()Z
    .locals 0

    iget-object p0, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mSubEngine:Lcom/android/systemui/wallpaper/engines/WallpaperEngine;

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->shouldWaitForEngineShown()Z

    move-result p0

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public final updateWallpaper()V
    .locals 18

    move-object/from16 v1, p0

    iget-object v0, v1, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mSubEngine:Lcom/android/systemui/wallpaper/engines/WallpaperEngine;

    instance-of v2, v0, Lcom/android/systemui/wallpaper/engines/video/VideoEngine;

    const/4 v3, 0x1

    if-eqz v2, :cond_0

    check-cast v0, Lcom/android/systemui/wallpaper/engines/video/VideoEngine;

    iget-object v0, v0, Lcom/android/systemui/wallpaper/engines/video/VideoEngine;->mVideoController:Lcom/android/systemui/wallpaper/engines/video/VideoController;

    invoke-virtual {v0, v3}, Lcom/android/systemui/wallpaper/engines/video/VideoController;->pause(Z)V

    :cond_0
    iget-boolean v0, v1, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mIsAlive:Z

    if-nez v0, :cond_1

    iget-object v0, v1, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "changeWallpaper: engine destroyed"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_1
    iget-object v0, v1, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mSubEngine:Lcom/android/systemui/wallpaper/engines/WallpaperEngine;

    const/4 v2, 0x0

    if-eqz v0, :cond_4

    iget-boolean v0, v1, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mIsFirstTransition:Z

    if-nez v0, :cond_3

    invoke-virtual {v1}, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->willShowAodWithWallpaper$1()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, v1, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mSubEngine:Lcom/android/systemui/wallpaper/engines/WallpaperEngine;

    new-instance v4, Lcom/samsung/android/wallpaper/live/sdk/data/ScreenshotOptions;

    const-string/jumbo v5, "prev"

    invoke-direct {v4, v5}, Lcom/samsung/android/wallpaper/live/sdk/data/ScreenshotOptions;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v4}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->onGetScreenshot(Lcom/samsung/android/wallpaper/live/sdk/data/ScreenshotOptions;)Lcom/samsung/android/wallpaper/live/sdk/data/ScreenshotResults;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v0, v0, Lcom/samsung/android/wallpaper/live/sdk/data/ScreenshotResults;->mBitmap:Landroid/graphics/Bitmap;

    goto :goto_0

    :cond_2
    move-object v0, v2

    :goto_0
    iput-object v0, v1, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mPrevScreenshot:Landroid/graphics/Bitmap;

    :cond_3
    iget-object v0, v1, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mSubEngine:Lcom/android/systemui/wallpaper/engines/WallpaperEngine;

    invoke-virtual {v0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->onDestroy()V

    :cond_4
    iget-object v0, v1, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mCallback:Lcom/android/systemui/wallpaper/engines/WallpaperEngineCallback;

    iget-object v4, v1, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->TAG:Ljava/lang/String;

    iget-object v5, v1, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mPluginWallpaper:Lcom/android/systemui/wallpaper/PluginWallpaper;

    iget-object v6, v1, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mCoverWallpaper:Lcom/android/systemui/wallpaper/CoverWallpaper;

    invoke-virtual {v1}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getWhich()I

    move-result v7

    invoke-static {v7, v3}, Lcom/android/systemui/wallpaper/utils/WhichChecker;->isFlagEnabled(II)Z

    move-result v3

    const/4 v8, 0x2

    if-eqz v3, :cond_5

    move-object v3, v6

    check-cast v3, Lcom/android/systemui/wallpaper/CoverWallpaperController;

    invoke-virtual {v3}, Lcom/android/systemui/wallpaper/CoverWallpaperController;->isCoverWallpaperRequired()Z

    move-result v9

    if-eqz v9, :cond_5

    invoke-virtual {v3}, Lcom/android/systemui/wallpaper/CoverWallpaperController;->getWallpaperType()I

    move-result v3

    goto :goto_1

    :cond_5
    invoke-static {v7, v8}, Lcom/android/systemui/wallpaper/utils/WhichChecker;->isFlagEnabled(II)Z

    move-result v3

    if-eqz v3, :cond_6

    check-cast v5, Lcom/android/systemui/wallpaper/PluginWallpaperController;

    invoke-virtual {v5, v7}, Lcom/android/systemui/wallpaper/PluginWallpaperController;->isPluginWallpaperRequired(I)Z

    move-result v3

    if-eqz v3, :cond_6

    invoke-virtual {v5, v7}, Lcom/android/systemui/wallpaper/PluginWallpaperController;->getWallpaperType(I)I

    move-result v3

    goto :goto_1

    :cond_6
    const-string/jumbo v3, "getCurrentWallpaperType: Not ready"

    invoke-static {v4, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v3, -0x1

    :goto_1
    iput v3, v1, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mNextType:I

    new-instance v3, Ljava/lang/StringBuilder;

    const-string/jumbo v5, "createNextEngine: mNextType = "

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v5, v1, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mNextType:I

    invoke-static {v3, v5, v4}, Landroidx/appcompat/widget/SearchView$$ExternalSyntheticOutline0;->m(Ljava/lang/StringBuilder;ILjava/lang/String;)V

    iget v3, v1, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mNextType:I

    if-eq v3, v8, :cond_8

    const/16 v4, 0x8

    if-eq v3, v4, :cond_8

    const/16 v4, 0xc

    if-eq v3, v4, :cond_7

    const/16 v4, 0xd

    if-eq v3, v4, :cond_8

    const/16 v4, 0x16

    if-eq v3, v4, :cond_7

    const/16 v4, 0x17

    if-eq v3, v4, :cond_8

    new-instance v9, Lcom/android/systemui/wallpaper/engines/image/ImageSource;

    invoke-virtual {v1}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getAppContext()Landroid/content/Context;

    move-result-object v10

    iget-object v11, v1, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mCoverWallpaper:Lcom/android/systemui/wallpaper/CoverWallpaper;

    iget-object v12, v1, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mPluginWallpaper:Lcom/android/systemui/wallpaper/PluginWallpaper;

    invoke-virtual {v1}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getWhich()I

    move-result v13

    invoke-virtual {v1}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getCurrentUserId()I

    move-result v14

    iget-object v0, v1, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->mCallback:Lcom/android/systemui/wallpaper/engines/WallpaperEngineCallback;

    check-cast v0, Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine$2;

    iget-object v0, v0, Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine$2;->this$1:Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine;

    invoke-virtual {v0}, Landroid/service/wallpaper/WallpaperService$Engine;->getDisplayId()I

    move-result v15

    invoke-direct/range {v9 .. v15}, Lcom/android/systemui/wallpaper/engines/image/ImageSource;-><init>(Landroid/content/Context;Lcom/android/systemui/wallpaper/CoverWallpaper;Lcom/android/systemui/wallpaper/PluginWallpaper;III)V

    new-instance v0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;

    iget-object v11, v1, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mCallback:Lcom/android/systemui/wallpaper/engines/WallpaperEngineCallback;

    iget-object v12, v1, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mSettingsHelper:Lcom/android/systemui/util/SettingsHelper;

    iget-object v13, v1, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mSystemWallpaperColors:Lcom/android/systemui/wallpaper/colors/SystemWallpaperColors;

    iget-object v14, v1, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mLongExecutor:Lcom/android/systemui/util/concurrency/DelayableExecutor;

    iget-object v15, v1, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mKeyguardWallpaper:Lcom/android/systemui/wallpaper/KeyguardWallpaper;

    iget-object v3, v1, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mKeyguardUpdateMonitor:Lcom/android/keyguard/KeyguardUpdateMonitor;

    iget-object v4, v1, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mDozeParameters:Lcom/android/systemui/statusbar/phone/DozeParameters;

    move-object/from16 v16, v3

    move-object/from16 v17, v4

    move-object v10, v9

    move-object v9, v0

    invoke-direct/range {v9 .. v17}, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;-><init>(Lcom/android/systemui/wallpaper/engines/image/ImageSource;Lcom/android/systemui/wallpaper/engines/WallpaperEngineCallback;Lcom/android/systemui/util/SettingsHelper;Lcom/android/systemui/wallpaper/colors/SystemWallpaperColors;Lcom/android/systemui/util/concurrency/DelayableExecutor;Lcom/android/systemui/wallpaper/KeyguardWallpaper;Lcom/android/keyguard/KeyguardUpdateMonitor;Lcom/android/systemui/statusbar/phone/DozeParameters;)V

    move-object v3, v9

    goto :goto_2

    :cond_7
    new-instance v3, Lcom/android/systemui/wallpaper/engines/gif/GifSource;

    invoke-virtual {v1}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getAppContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v1}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getWhich()I

    move-result v5

    invoke-direct {v3, v4, v5, v6}, Lcom/android/systemui/wallpaper/engines/gif/GifSource;-><init>(Landroid/content/Context;ILcom/android/systemui/wallpaper/CoverWallpaper;)V

    new-instance v4, Lcom/android/systemui/wallpaper/engines/gif/GifEngine;

    invoke-direct {v4, v3, v0}, Lcom/android/systemui/wallpaper/engines/gif/GifEngine;-><init>(Lcom/android/systemui/wallpaper/engines/gif/GifSource;Lcom/android/systemui/wallpaper/engines/WallpaperEngineCallback;)V

    move-object v3, v4

    goto :goto_2

    :cond_8
    new-instance v9, Lcom/android/systemui/wallpaper/engines/video/VideoSource;

    invoke-virtual {v1}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getAppContext()Landroid/content/Context;

    move-result-object v10

    invoke-virtual {v1}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getWhich()I

    move-result v11

    invoke-virtual {v1}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getCurrentUserId()I

    move-result v13

    iget-object v14, v1, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mCoverWallpaper:Lcom/android/systemui/wallpaper/CoverWallpaper;

    iget-object v15, v1, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mPluginWallpaper:Lcom/android/systemui/wallpaper/PluginWallpaper;

    const/4 v12, 0x2

    invoke-direct/range {v9 .. v15}, Lcom/android/systemui/wallpaper/engines/video/VideoSource;-><init>(Landroid/content/Context;IIILcom/android/systemui/wallpaper/CoverWallpaper;Lcom/android/systemui/wallpaper/PluginWallpaper;)V

    new-instance v3, Lcom/android/systemui/wallpaper/engines/video/VideoEngine;

    iget-object v4, v1, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mKeyguardUpdateMonitor:Lcom/android/keyguard/KeyguardUpdateMonitor;

    invoke-direct {v3, v9, v0, v4}, Lcom/android/systemui/wallpaper/engines/video/VideoEngine;-><init>(Lcom/android/systemui/wallpaper/engines/video/VideoSource;Lcom/android/systemui/wallpaper/engines/WallpaperEngineCallback;Lcom/android/keyguard/KeyguardUpdateMonitor;)V

    :goto_2
    invoke-virtual {v1, v3}, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->canSupportScaleAnimation(Lcom/android/systemui/wallpaper/engines/WallpaperEngine;)Z

    move-result v0

    if-nez v0, :cond_9

    iget-object v0, v1, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mWallpaperAnimator:Lcom/android/systemui/wallpaper/engines/WallpaperAnimator;

    invoke-virtual {v0}, Lcom/android/systemui/wallpaper/engines/WallpaperAnimator;->release()V

    :cond_9
    invoke-virtual {v1}, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->willShowAodWithWallpaper$1()Z

    move-result v0

    if-eqz v0, :cond_e

    invoke-virtual {v1}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getWhich()I

    move-result v0

    invoke-static {v0}, Lcom/android/systemui/wallpaper/utils/WhichChecker;->isVirtualDisplay(I)Z

    move-result v0

    if-eqz v0, :cond_a

    iget-object v0, v1, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mCoverWallpaper:Lcom/android/systemui/wallpaper/CoverWallpaper;

    check-cast v0, Lcom/android/systemui/wallpaper/CoverWallpaperController;

    invoke-virtual {v0}, Lcom/android/systemui/wallpaper/CoverWallpaperController;->isCoverWallpaperRequired()Z

    move-result v0

    if-eqz v0, :cond_a

    goto :goto_4

    :cond_a
    iget-boolean v0, v1, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mIsFirstTransition:Z

    if-nez v0, :cond_d

    iget-object v0, v1, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mPrevScreenshot:Landroid/graphics/Bitmap;

    if-nez v0, :cond_b

    goto :goto_3

    :cond_b
    new-instance v0, Lcom/samsung/android/wallpaper/live/sdk/data/ScreenshotOptions;

    const-string/jumbo v4, "next"

    invoke-direct {v0, v4}, Lcom/samsung/android/wallpaper/live/sdk/data/ScreenshotOptions;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->onGetScreenshot(Lcom/samsung/android/wallpaper/live/sdk/data/ScreenshotOptions;)Lcom/samsung/android/wallpaper/live/sdk/data/ScreenshotResults;

    move-result-object v0

    if-eqz v0, :cond_c

    iget-object v2, v0, Lcom/samsung/android/wallpaper/live/sdk/data/ScreenshotResults;->mBitmap:Landroid/graphics/Bitmap;

    :cond_c
    iget-object v0, v1, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mPrevScreenshot:Landroid/graphics/Bitmap;

    new-instance v4, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine$$ExternalSyntheticLambda0;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    iput-object v1, v4, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine$$ExternalSyntheticLambda0;->f$0:Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;

    iput-object v3, v4, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine$$ExternalSyntheticLambda0;->f$1:Lcom/android/systemui/wallpaper/engines/WallpaperEngine;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    new-instance v3, Lcom/android/systemui/wallpaper/engines/multipack/TransitionEngine;

    iget-object v5, v1, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mCallback:Lcom/android/systemui/wallpaper/engines/WallpaperEngineCallback;

    invoke-direct {v3, v5, v0, v2, v4}, Lcom/android/systemui/wallpaper/engines/multipack/TransitionEngine;-><init>(Lcom/android/systemui/wallpaper/engines/WallpaperEngineCallback;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Ljava/lang/Runnable;)V

    iput-object v3, v1, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mSubEngine:Lcom/android/systemui/wallpaper/engines/WallpaperEngine;

    invoke-virtual {v1, v3}, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->initSubEngine(Lcom/android/systemui/wallpaper/engines/WallpaperEngine;)V

    return-void

    :cond_d
    :goto_3
    iget-object v0, v1, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string/jumbo v4, "handleTransition: mIsFirstTransition = "

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean v4, v1, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mIsFirstTransition:Z

    invoke-static {v2, v4, v0}, Lcom/android/systemui/animation/DefaultTransitionHelper$$ExternalSyntheticOutline0;->m(Ljava/lang/StringBuilder;ZLjava/lang/String;)V

    iput-object v3, v1, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mSubEngine:Lcom/android/systemui/wallpaper/engines/WallpaperEngine;

    invoke-virtual {v1, v3}, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->initSubEngine(Lcom/android/systemui/wallpaper/engines/WallpaperEngine;)V

    const/4 v0, 0x0

    iput-boolean v0, v1, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mIsFirstTransition:Z

    return-void

    :cond_e
    :goto_4
    invoke-virtual {v1}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getWhich()I

    move-result v0

    invoke-static {v0, v8}, Lcom/android/systemui/wallpaper/utils/WhichChecker;->isFlagEnabled(II)Z

    move-result v2

    if-nez v2, :cond_f

    invoke-static {v0}, Lcom/android/systemui/wallpaper/utils/WhichChecker;->isVirtualDisplay(I)Z

    move-result v0

    if-eqz v0, :cond_16

    :cond_f
    instance-of v0, v3, Lcom/android/systemui/wallpaper/engines/video/VideoEngine;

    if-nez v0, :cond_10

    instance-of v0, v3, Lcom/android/systemui/wallpaper/engines/gif/GifEngine;

    if-eqz v0, :cond_16

    :cond_10
    const-string/jumbo v0, "makeSurfaceBlack: empty surface frame. frame="

    const-string/jumbo v2, "makeSurfaceBlack: surface = "

    const-string/jumbo v4, "makeSurfaceBlack: width == "

    :try_start_0
    iget-object v5, v1, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    invoke-interface {v5}, Landroid/view/SurfaceHolder;->getSurfaceFrame()Landroid/graphics/Rect;

    move-result-object v5

    if-eqz v5, :cond_15

    invoke-virtual {v5}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_11

    goto/16 :goto_7

    :cond_11
    invoke-virtual {v5}, Landroid/graphics/Rect;->width()I

    move-result v0

    invoke-virtual {v5}, Landroid/graphics/Rect;->height()I

    move-result v5

    iget-object v6, v1, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ", height = "

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v6, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v12, Landroid/graphics/Paint;

    invoke-direct {v12}, Landroid/graphics/Paint;-><init>()V

    const/high16 v4, -0x1000000

    invoke-virtual {v12, v4}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v4, v1, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    invoke-interface {v4}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v4

    if-eqz v4, :cond_14

    invoke-virtual {v4}, Landroid/view/Surface;->isValid()Z

    move-result v6

    if-nez v6, :cond_12

    goto :goto_6

    :cond_12
    iget-object v2, v1, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mDrawLock:Ljava/lang/Object;

    monitor-enter v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    invoke-virtual {v4}, Landroid/view/Surface;->lockHardwareCanvas()Landroid/graphics/Canvas;

    move-result-object v7

    if-nez v7, :cond_13

    iget-object v0, v1, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->TAG:Ljava/lang/String;

    const-string/jumbo v4, "makeSurfaceBlack: canvas is null"

    invoke-static {v0, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    monitor-exit v2

    goto :goto_9

    :catchall_0
    move-exception v0

    goto :goto_5

    :cond_13
    int-to-float v10, v0

    int-to-float v11, v5

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-virtual/range {v7 .. v12}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    invoke-virtual {v4, v7}, Landroid/view/Surface;->unlockCanvasAndPost(Landroid/graphics/Canvas;)V

    monitor-exit v2

    goto :goto_9

    :goto_5
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v0

    :catch_0
    move-exception v0

    goto :goto_8

    :cond_14
    :goto_6
    iget-object v0, v1, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_9

    :cond_15
    :goto_7
    iget-object v2, v1, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_9

    :goto_8
    iget-object v2, v1, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string/jumbo v5, "makeSurfaceBlack: e = "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_16
    :goto_9
    iput-object v3, v1, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mSubEngine:Lcom/android/systemui/wallpaper/engines/WallpaperEngine;

    invoke-virtual {v1, v3}, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->initSubEngine(Lcom/android/systemui/wallpaper/engines/WallpaperEngine;)V

    return-void
.end method

.method public final updateWallpaperIfReady(I)V
    .locals 4

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getAppContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/app/WallpaperManager;->getInstance(Landroid/content/Context;)Landroid/app/WallpaperManager;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getSourceWhich()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/app/WallpaperManager;->getWallpaperId(I)I

    move-result v0

    const-string/jumbo v1, "updateWallpaperIfReady: wallpaperId = "

    const-string v2, ", wallpaperManagerId = "

    iget-object v3, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->TAG:Ljava/lang/String;

    invoke-static {p1, v0, v1, v2, v3}, Lcom/android/systemui/pluginlock/PluginLockProvider$$ExternalSyntheticOutline0;->m(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    if-ne p1, v0, :cond_0

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->updateWallpaper()V

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getWhich()I

    move-result p1

    const/4 v0, 0x2

    invoke-static {p1, v0}, Lcom/android/systemui/wallpaper/utils/WhichChecker;->isFlagEnabled(II)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mPluginWallpaper:Lcom/android/systemui/wallpaper/PluginWallpaper;

    check-cast v0, Lcom/android/systemui/wallpaper/PluginWallpaperController;

    invoke-virtual {v0, p1}, Lcom/android/systemui/wallpaper/PluginWallpaperController;->isPluginWallpaperRequired(I)Z

    move-result p1

    const-string/jumbo v0, "updateWallpaperIfReady: isPluginLockReady = "

    invoke-static {v0, v3, p1}, Lcom/android/keyguard/EmergencyButton$$ExternalSyntheticOutline0;->m(Ljava/lang/String;Ljava/lang/String;Z)V

    if-eqz p1, :cond_1

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->updateWallpaper()V

    :cond_1
    return-void
.end method

.method public final willShowAodWithWallpaper$1()Z
    .locals 1

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getWhich()I

    move-result v0

    and-int/lit8 v0, v0, 0x3c

    invoke-static {v0}, Lcom/android/systemui/wallpaper/WallpaperUtils;->isShowWallpaperOnAodEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/android/systemui/wallpaper/engines/multipack/MultipackEngine;->mDozeParameters:Lcom/android/systemui/statusbar/phone/DozeParameters;

    iget-boolean p0, p0, Lcom/android/systemui/statusbar/phone/DozeParameters;->mControlScreenOffAnimation:Z

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method
