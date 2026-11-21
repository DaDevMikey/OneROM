.class public Lcom/android/systemui/wallpaper/engines/image/ImageEngine;
.super Lcom/android/systemui/wallpaper/engines/WallpaperEngine;
.source "qb/117478588 63230b00838586e9741071cb17d7b2dfd30e23ac5c32aa66524c0dd85ab02e4f"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/systemui/wallpaper/engines/image/ImageEngine$DrawState;
    }
.end annotation

# interfaces
.implements Lcom/android/systemui/wallpaper/tilt/Drawer;
.implements Ljava/lang/Runnable;


# instance fields
.field public TAG:Ljava/lang/String;

.field public mTiltColorController:Lcom/android/systemui/wallpaper/tilt/TiltColorController;

.field public final mBitmapPaint:Landroid/graphics/Paint;

.field public mBitmapUsages:I

.field public final mDownScaledSourceBitmapManager:Lcom/android/systemui/wallpaper/engines/image/DownScaledSourceBitmapManager;

.field public final mDozeParameters:Lcom/android/systemui/statusbar/phone/DozeParameters;

.field public mIsEngineAlive:Z

.field public mIsFullQualityFrameDrawn:Z

.field public mIsWallpaperSizeWarningEnabled:Z

.field public final mKeyguardWallpaper:Lcom/android/systemui/wallpaper/KeyguardWallpaper;

.field public mLastDrawnState:Lcom/android/systemui/wallpaper/engines/image/ImageEngine$DrawState;

.field public final mLock:Ljava/lang/Object;

.field public final mLogger:Lcom/android/systemui/wallpaper/log/WallpaperLogger;

.field public final mLongExecutor:Lcom/android/systemui/util/concurrency/DelayableExecutor;

.field private final mSettingsHelper:Lcom/android/systemui/util/SettingsHelper;

.field public mSurfaceHolder:Landroid/view/SurfaceHolder;

.field public final mSurfaceLock:Ljava/lang/Object;

.field public final mSystemWallpaperColors:Lcom/android/systemui/wallpaper/colors/SystemWallpaperColors;

.field public final mWallpaperAnimator:Lcom/android/systemui/wallpaper/engines/WallpaperAnimator;

.field public final mWallpaperManager:Landroid/app/WallpaperManager;

.field public final mWallpaperSource:Lcom/android/systemui/wallpaper/engines/image/ImageSource;


# direct methods
.method public constructor <init>(Lcom/android/systemui/wallpaper/engines/image/ImageSource;Lcom/android/systemui/wallpaper/engines/WallpaperEngineCallback;Lcom/android/systemui/util/SettingsHelper;Lcom/android/systemui/wallpaper/colors/SystemWallpaperColors;Lcom/android/systemui/util/concurrency/DelayableExecutor;Lcom/android/systemui/wallpaper/KeyguardWallpaper;Lcom/android/keyguard/KeyguardUpdateMonitor;Lcom/android/systemui/statusbar/phone/DozeParameters;)V
    .locals 2

    invoke-direct {p0, p2}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;-><init>(Lcom/android/systemui/wallpaper/engines/WallpaperEngineCallback;)V

    new-instance p2, Landroid/graphics/Paint;

    const/4 v0, 0x2

    invoke-direct {p2, v0}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p2, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mBitmapPaint:Landroid/graphics/Paint;

    const/4 p2, 0x0

    iput-boolean p2, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mIsEngineAlive:Z

    iput-boolean p2, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mIsFullQualityFrameDrawn:Z

    iput-boolean p2, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mIsWallpaperSizeWarningEnabled:Z

    iput p2, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mBitmapUsages:I

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mLock:Ljava/lang/Object;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mSurfaceLock:Ljava/lang/Object;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "ImageWallpaper_"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getWhich()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string/jumbo v1, "[Image]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->TAG:Ljava/lang/String;

    iget-object v0, p0, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->mCallback:Lcom/android/systemui/wallpaper/engines/WallpaperEngineCallback;

    move-object v1, v0

    check-cast v1, Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine$2;

    iget-object v1, v1, Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine$2;->this$1:Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine;

    iget-object v1, v1, Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine;->this$0:Lcom/android/systemui/wallpapers/ImageWallpaper;

    iget-object v1, v1, Lcom/android/systemui/wallpapers/ImageWallpaper;->mLogger:Lcom/android/systemui/wallpaper/log/WallpaperLogger;

    iput-object v1, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mLogger:Lcom/android/systemui/wallpaper/log/WallpaperLogger;

    iput-object p5, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mLongExecutor:Lcom/android/systemui/util/concurrency/DelayableExecutor;

    iput-object p8, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mDozeParameters:Lcom/android/systemui/statusbar/phone/DozeParameters;

    iput-object p3, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mSettingsHelper:Lcom/android/systemui/util/SettingsHelper;

    iput-object p1, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mWallpaperSource:Lcom/android/systemui/wallpaper/engines/image/ImageSource;

    check-cast v0, Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine$2;

    iget-object p3, v0, Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine$2;->this$1:Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine;

    iget-object p3, p3, Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine;->mWallpaperManager:Landroid/app/WallpaperManager;

    iput-object p3, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mWallpaperManager:Landroid/app/WallpaperManager;

    iput-object p6, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mKeyguardWallpaper:Lcom/android/systemui/wallpaper/KeyguardWallpaper;

    iput-object p4, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mSystemWallpaperColors:Lcom/android/systemui/wallpaper/colors/SystemWallpaperColors;

    new-instance p3, Lcom/android/systemui/wallpaper/engines/image/DownScaledSourceBitmapManager;

    invoke-static {}, Landroid/os/Process;->getAdvertisedMem()J

    move-result-wide p4

    const-wide v0, 0x1836e2100L

    cmp-long p4, p4, v0

    if-gtz p4, :cond_0

    const/4 p2, 0x1

    :cond_0
    invoke-direct {p3, p2}, Lcom/android/systemui/wallpaper/engines/image/DownScaledSourceBitmapManager;-><init>(Z)V

    iput-object p3, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mDownScaledSourceBitmapManager:Lcom/android/systemui/wallpaper/engines/image/DownScaledSourceBitmapManager;

    new-instance p1, Lcom/android/systemui/wallpaper/tilt/TiltColorController;

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getAppContext()Landroid/content/Context;

    move-result-object p2

    invoke-direct {p1, p2, p0}, Lcom/android/systemui/wallpaper/tilt/TiltColorController;-><init>(Landroid/content/Context;Lcom/android/systemui/wallpaper/tilt/Drawer;)V

    iput-object p1, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mTiltColorController:Lcom/android/systemui/wallpaper/tilt/TiltColorController;

    return-void
.end method


# virtual methods
.method public final draw(Landroid/view/SurfaceHolder;)Z
    .locals 0

    invoke-virtual {p0, p1}, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->onSurfaceRedrawNeeded(Landroid/view/SurfaceHolder;)V

    const/4 p0, 0x0

    return p0
.end method

.method public final drawFrameOnCanvas(Landroid/graphics/Canvas;JLandroid/graphics/Rect;Landroid/graphics/Bitmap;Ljava/util/ArrayList;F)Lcom/android/systemui/wallpaper/engines/image/ImageEngine$DrawState;
    .locals 21

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v4, p5

    move/from16 v0, p7

    const-string/jumbo v5, "drawFrameOnCanvas : surface size mismatch. curFrame="

    const-string/jumbo v6, "drawFrameOnCanvas: e = "

    const-string/jumbo v7, "drawFrameOnCanvas : which="

    invoke-static {v4}, Lcom/android/systemui/wallpaper/WallpaperUtils;->isValidBitmap(Landroid/graphics/Bitmap;)Z

    move-result v8

    const/4 v9, 0x0

    if-nez v8, :cond_0

    return-object v9

    :cond_0
    if-nez v2, :cond_1

    invoke-virtual {v1}, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->isSurfaceCreated()Z

    move-result v8

    if-nez v8, :cond_1

    iget-object v0, v1, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "drawFrameOnCanvas: the surface holder is invalid"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-object v9

    :cond_1
    invoke-virtual {v1}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getSourceWhich()I

    move-result v8

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v10

    :try_start_0
    iget-object v12, v1, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mSurfaceLock:Ljava/lang/Object;

    monitor-enter v12
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4

    const/4 v13, 0x0

    if-eqz v2, :cond_2

    :try_start_1
    new-instance v14, Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/graphics/Canvas;->getWidth()I

    move-result v15

    invoke-virtual {v2}, Landroid/graphics/Canvas;->getHeight()I

    move-result v9

    invoke-direct {v14, v13, v13, v15, v9}, Landroid/graphics/Rect;-><init>(IIII)V

    goto :goto_0

    :catchall_0
    move-exception v0

    move-wide/from16 v17, v10

    goto/16 :goto_14

    :cond_2
    iget-object v9, v1, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    invoke-interface {v9}, Landroid/view/SurfaceHolder;->getSurfaceFrame()Landroid/graphics/Rect;

    move-result-object v14

    :goto_0
    monitor-exit v12
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    new-instance v9, Landroid/graphics/Point;

    invoke-virtual {v14}, Landroid/graphics/Rect;->width()I

    move-result v12

    invoke-virtual {v14}, Landroid/graphics/Rect;->height()I

    move-result v15

    invoke-direct {v9, v12, v15}, Landroid/graphics/Point;-><init>(II)V

    move-object/from16 v12, p6

    invoke-static {v9, v12}, Lcom/android/systemui/wallpaper/utils/IntelligentCropHelper;->getNearestCropHint(Landroid/graphics/Point;Ljava/util/ArrayList;)Landroid/graphics/Rect;

    move-result-object v9

    if-eqz v9, :cond_3

    new-instance v12, Landroid/graphics/Rect;

    iget v15, v9, Landroid/graphics/Rect;->left:I

    int-to-float v15, v15

    mul-float/2addr v15, v0

    float-to-int v15, v15

    iget v13, v9, Landroid/graphics/Rect;->top:I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_4

    int-to-float v13, v13

    mul-float/2addr v13, v0

    float-to-int v13, v13

    move-wide/from16 v17, v10

    :try_start_3
    iget v10, v9, Landroid/graphics/Rect;->right:I

    int-to-float v10, v10

    mul-float/2addr v10, v0

    float-to-int v10, v10

    iget v9, v9, Landroid/graphics/Rect;->bottom:I

    int-to-float v9, v9

    mul-float/2addr v9, v0

    float-to-int v9, v9

    invoke-direct {v12, v15, v13, v10, v9}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v9

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v10

    const/4 v11, 0x0

    invoke-virtual {v12, v11, v11, v9, v10}, Landroid/graphics/Rect;->intersect(IIII)Z

    move-object v9, v12

    goto :goto_2

    :catch_0
    move-exception v0

    :goto_1
    move-wide/from16 v9, v17

    move-wide v15, v9

    goto/16 :goto_15

    :cond_3
    move-wide/from16 v17, v10

    move v11, v13

    :goto_2
    new-instance v10, Landroid/graphics/Matrix;

    invoke-direct {v10}, Landroid/graphics/Matrix;-><init>()V

    if-eqz v9, :cond_4

    invoke-virtual {v9}, Landroid/graphics/Rect;->width()I

    move-result v12

    goto :goto_3

    :cond_4
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v12

    :goto_3
    if-eqz v9, :cond_5

    invoke-virtual {v9}, Landroid/graphics/Rect;->height()I

    move-result v13

    goto :goto_4

    :cond_5
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v13

    :goto_4
    invoke-virtual {v14}, Landroid/graphics/Rect;->width()I

    move-result v15

    invoke-virtual {v14}, Landroid/graphics/Rect;->height()I

    move-result v11

    move-object/from16 v19, v5

    mul-int v5, v12, v11

    mul-int v3, v15, v13

    if-le v5, v3, :cond_6

    int-to-float v3, v11

    int-to-float v5, v13

    :goto_5
    div-float/2addr v3, v5

    goto :goto_6

    :cond_6
    int-to-float v3, v15

    int-to-float v5, v12

    goto :goto_5

    :goto_6
    int-to-float v5, v15

    int-to-float v12, v12

    move/from16 p6, v15

    const/high16 v15, 0x3f000000    # 0.5f

    invoke-static {v12, v3, v5, v15}, Landroidx/compose/ui/graphics/colorspace/Rgb$Companion$$ExternalSyntheticOutline0;->m(FFFF)F

    move-result v5

    int-to-float v12, v11

    int-to-float v13, v13

    invoke-static {v13, v3, v12, v15}, Landroidx/compose/ui/graphics/colorspace/Rgb$Companion$$ExternalSyntheticOutline0;->m(FFFF)F

    move-result v12

    invoke-virtual {v10, v3, v3}, Landroid/graphics/Matrix;->setScale(FF)V

    if-eqz v9, :cond_7

    iget v3, v9, Landroid/graphics/Rect;->left:I

    neg-int v3, v3

    int-to-float v3, v3

    iget v13, v9, Landroid/graphics/Rect;->top:I

    neg-int v13, v13

    int-to-float v13, v13

    invoke-virtual {v10, v3, v13}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    :cond_7
    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v3

    int-to-float v3, v3

    invoke-static {v12}, Ljava/lang/Math;->round(F)I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {v10, v3, v5}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    iget-object v3, v1, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mWallpaperSource:Lcom/android/systemui/wallpaper/engines/image/ImageSource;

    invoke-virtual {v3}, Lcom/android/systemui/wallpaper/engines/image/ImageSource;->getSupplier()Lcom/android/systemui/wallpaper/engines/image/ImageSource$ImageSupplier;

    move-result-object v3

    invoke-interface {v3}, Lcom/android/systemui/wallpaper/engines/image/ImageSource$ImageSupplier;->getFilterData()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_8

    invoke-static {v3, v4}, Lcom/android/systemui/wallpaper/effect/ColorDecorFilterHelper;->createFilteredBitmap(Ljava/lang/String;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v3

    goto :goto_7

    :cond_8
    move-object v3, v4

    :goto_7
    invoke-virtual {v1, v8}, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->getDimFilterColor(I)Ljava/lang/Integer;

    move-result-object v5

    if-eqz v5, :cond_9

    new-instance v12, Landroid/graphics/PorterDuffColorFilter;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v13

    sget-object v15, Landroid/graphics/PorterDuff$Mode;->SRC_OVER:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v12, v13, v15}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    iget-object v13, v1, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mBitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {v13, v12}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    const/4 v13, 0x0

    goto :goto_8

    :cond_9
    iget-object v12, v1, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mBitmapPaint:Landroid/graphics/Paint;

    const/4 v13, 0x0

    invoke-virtual {v12, v13}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    :goto_8
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v15
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    :try_start_4
    iget-object v12, v1, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mLogger:Lcom/android/systemui/wallpaper/log/WallpaperLogger;

    iget-object v13, v1, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->TAG:Ljava/lang/String;

    move/from16 v20, v11

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, ", bmpW="

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, ", bmpH="

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v7

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, ", bmpScale="

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v0, ", src="

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", dest="

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", dimColor="

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", customCanvas="

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v7, 0x1

    if-eqz v2, :cond_a

    move v0, v7

    goto :goto_9

    :cond_a
    const/4 v0, 0x0

    :goto_9
    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    check-cast v12, Lcom/android/systemui/wallpaper/log/WallpaperLoggerImpl;

    invoke-virtual {v12, v13, v0}, Lcom/android/systemui/wallpaper/log/WallpaperLoggerImpl;->log(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-nez v0, :cond_17

    if-eqz v2, :cond_b

    iget-object v0, v1, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mBitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {v2, v3, v10, v0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    goto/16 :goto_10

    :catch_1
    move-exception v0

    move-wide/from16 v9, v17

    goto/16 :goto_15

    :cond_b
    iget-object v9, v1, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mSurfaceLock:Ljava/lang/Object;

    monitor-enter v9
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    :try_start_5
    invoke-virtual {v1}, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->isSurfaceCreated()Z

    move-result v0

    if-eqz v0, :cond_16

    iget-object v0, v1, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    invoke-interface {v0}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v11

    iget-object v0, v1, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mWallpaperManager:Landroid/app/WallpaperManager;

    invoke-virtual {v0, v4}, Landroid/app/WallpaperManager;->wallpaperSupportsWcg(Landroid/graphics/Bitmap;)Z

    move-result v0

    if-eqz v0, :cond_c

    invoke-virtual {v11}, Landroid/view/Surface;->lockHardwareWideColorGamutCanvas()Landroid/graphics/Canvas;

    move-result-object v0

    :goto_a
    move-object v12, v0

    goto :goto_b

    :catchall_1
    move-exception v0

    goto/16 :goto_13

    :cond_c
    invoke-virtual {v11}, Landroid/view/Surface;->lockHardwareCanvas()Landroid/graphics/Canvas;

    move-result-object v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto :goto_a

    :goto_b
    if-eqz v12, :cond_15

    :try_start_6
    iget-object v0, v1, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mBitmapPaint:Landroid/graphics/Paint;

    iget-object v13, v1, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mTiltColorController:Lcom/android/systemui/wallpaper/tilt/TiltColorController;

    if-eqz v13, :cond_tilt_skip

    invoke-virtual {v13}, Lcom/android/systemui/wallpaper/tilt/TiltColorController;->isEnable()Z

    move-result v13

    if-eqz v13, :cond_tilt_skip

    const/high16 v13, -0x1000000

    invoke-virtual {v12, v13}, Landroid/graphics/Canvas;->drawColor(I)V

    iget-object v13, v1, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mTiltColorController:Lcom/android/systemui/wallpaper/tilt/TiltColorController;

    invoke-virtual {v13, v12, v0}, Lcom/android/systemui/wallpaper/tilt/TiltColorController;->prepareDraw(Landroid/graphics/Canvas;Landroid/graphics/Paint;)V

    :cond_tilt_skip
    invoke-virtual {v12, v3, v10, v0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    iget-boolean v0, v1, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mIsWallpaperSizeWarningEnabled:Z

    if-eqz v0, :cond_d

    invoke-virtual {v1, v8, v12, v4}, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->drawWarningTextIfNeeded(ILandroid/graphics/Canvas;Landroid/graphics/Bitmap;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    goto :goto_c

    :catchall_2
    move-exception v0

    goto/16 :goto_12

    :catch_2
    move-exception v0

    goto :goto_e

    :cond_d
    :goto_c
    :try_start_7
    invoke-virtual {v11, v12}, Landroid/view/Surface;->unlockCanvasAndPost(Landroid/graphics/Canvas;)V

    iget-object v0, v1, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mTiltColorController:Lcom/android/systemui/wallpaper/tilt/TiltColorController;

    if-eqz v0, :cond_tilt_hwui

    invoke-virtual {v0}, Lcom/android/systemui/wallpaper/tilt/TiltColorController;->isEnable()Z

    move-result v0

    if-nez v0, :cond_f

    :cond_tilt_hwui
    iget-object v0, v1, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mWallpaperSource:Lcom/android/systemui/wallpaper/engines/image/ImageSource;

    invoke-virtual {v0}, Lcom/android/systemui/wallpaper/engines/image/ImageSource;->isMultipack()Z

    move-result v0

    if-eqz v0, :cond_e

    sget-boolean v0, Lcom/android/systemui/LsRune;->LOCKUI_AOD_PACKAGE_AVAILABLE:Z

    if-nez v0, :cond_f

    :cond_e
    :goto_d
    invoke-virtual {v11}, Landroid/view/Surface;->hwuiDestroy()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    goto :goto_f

    :goto_e
    :try_start_8
    iget-object v10, v1, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->TAG:Ljava/lang/String;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v10, v6, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    :try_start_9
    invoke-virtual {v11, v12}, Landroid/view/Surface;->unlockCanvasAndPost(Landroid/graphics/Canvas;)V

    iget-object v0, v1, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mWallpaperSource:Lcom/android/systemui/wallpaper/engines/image/ImageSource;

    invoke-virtual {v0}, Lcom/android/systemui/wallpaper/engines/image/ImageSource;->isMultipack()Z

    move-result v0

    if-eqz v0, :cond_e

    sget-boolean v0, Lcom/android/systemui/LsRune;->LOCKUI_AOD_PACKAGE_AVAILABLE:Z

    if-nez v0, :cond_f

    goto :goto_d

    :cond_f
    :goto_f
    monitor-exit v9
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    :goto_10
    if-eq v3, v4, :cond_10

    :try_start_a
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->recycle()V

    :cond_10
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v9
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_1

    if-nez v2, :cond_18

    move-object/from16 v3, p4

    :try_start_b
    invoke-virtual {v14, v3}, Landroid/graphics/Rect;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    if-eqz v5, :cond_11

    invoke-virtual {v1}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getAppContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/android/systemui/wallpaper/glwallpaper/ImageDarkModeFilter;->isEnable(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_11

    move v5, v7

    goto :goto_11

    :cond_11
    const/4 v5, 0x0

    :goto_11
    new-instance v0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine$DrawState;

    move/from16 v3, p6

    move v2, v8

    move/from16 v4, v20

    invoke-direct/range {v0 .. v5}, Lcom/android/systemui/wallpaper/engines/image/ImageEngine$DrawState;-><init>(Lcom/android/systemui/wallpaper/engines/image/ImageEngine;IIIZ)V

    goto/16 :goto_17

    :catch_3
    move-exception v0

    goto :goto_15

    :cond_12
    iget-object v0, v1, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    move-object/from16 v4, v19

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v4, ", requestedFrame="

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_3

    goto :goto_16

    :goto_12
    :try_start_c
    invoke-virtual {v11, v12}, Landroid/view/Surface;->unlockCanvasAndPost(Landroid/graphics/Canvas;)V

    iget-object v2, v1, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mWallpaperSource:Lcom/android/systemui/wallpaper/engines/image/ImageSource;

    invoke-virtual {v2}, Lcom/android/systemui/wallpaper/engines/image/ImageSource;->isMultipack()Z

    move-result v2

    if-eqz v2, :cond_13

    sget-boolean v2, Lcom/android/systemui/LsRune;->LOCKUI_AOD_PACKAGE_AVAILABLE:Z

    if-nez v2, :cond_14

    :cond_13
    invoke-virtual {v11}, Landroid/view/Surface;->hwuiDestroy()V

    :cond_14
    throw v0

    :cond_15
    iget-object v0, v1, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "drawFrameOnCanvas: canvas is NULL"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v2, "failed to lock the canvas"

    invoke-direct {v0, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_16
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v2, "incorrect surface"

    invoke-direct {v0, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :goto_13
    monitor-exit v9
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_1

    :try_start_d
    throw v0

    :cond_17
    iget-object v0, v1, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "drawFrameOnCanvas : bitmap is recycled!"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v2, "tried to draw with recycled bitmap"

    invoke-direct {v0, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_1

    :catch_4
    move-exception v0

    move-wide/from16 v17, v10

    goto/16 :goto_1

    :goto_14
    :try_start_e
    monitor-exit v12
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_3

    :try_start_f
    throw v0
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_0

    :catchall_3
    move-exception v0

    goto :goto_14

    :goto_15
    iget-object v2, v1, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string/jumbo v4, "drawFrameOnCanvas : failed draw bitmap. e="

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_18
    :goto_16
    const/4 v0, 0x0

    :goto_17
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    sub-long v2, v2, p2

    sub-long v4, v17, p2

    sub-long v6, v15, v17

    sub-long/2addr v9, v15

    iget-object v8, v1, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mLogger:Lcom/android/systemui/wallpaper/log/WallpaperLogger;

    iget-object v1, v1, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->TAG:Ljava/lang/String;

    const-string/jumbo v11, "drawFrameOnCanvas : elapsed="

    const-string v12, ", bmpPrepareDur="

    invoke-static {v11, v2, v3, v12}, Landroidx/compose/runtime/snapshots/SnapshotStateObserver$$ExternalSyntheticOutline0;->m(Ljava/lang/String;JLjava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v3, ", filterApplyDur="

    const-string v4, ", drawDur="

    invoke-static {v2, v3, v6, v7, v4}, Landroidx/compose/animation/core/Motion$$ExternalSyntheticOutline0;->m(Ljava/lang/StringBuilder;Ljava/lang/String;JLjava/lang/String;)V

    invoke-virtual {v2, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v3, ", drawnState=("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    check-cast v8, Lcom/android/systemui/wallpaper/log/WallpaperLoggerImpl;

    invoke-virtual {v8, v1, v2}, Lcom/android/systemui/wallpaper/log/WallpaperLoggerImpl;->log(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public final drawFrameSynchronized(Landroid/graphics/Rect;)V
    .locals 4

    iget-object v0, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mLock:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x0

    :try_start_0
    invoke-virtual {p0, v1, p1}, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->drawFullQualityFrame(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getAppContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    const-string/jumbo v1, "wallpaper_finish_drawing"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {p1, v1, v2, v3}, Landroid/provider/Settings$System;->putLong(Landroid/content/ContentResolver;Ljava/lang/String;J)Z

    const-string p1, "ImageWallpaper#finishRendering"

    invoke-static {p1}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->TAG:Ljava/lang/String;

    const-string/jumbo p1, "finishRendering"

    invoke-static {p0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Landroid/os/Trace;->endSection()V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public final drawFullQualityFrame(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V
    .locals 4

    if-nez p1, :cond_1

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->isSurfaceCreated()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object p0, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->TAG:Ljava/lang/String;

    const-string/jumbo p1, "drawFullQualityFrame: attempt to draw a frame without a valid surface"

    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    iget-boolean v0, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mIsEngineAlive:Z

    if-nez v0, :cond_1

    iget-object p0, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->TAG:Ljava/lang/String;

    const-string/jumbo p1, "drawFullQualityFrame: engine is destroyed"

    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_1
    const-string v0, "ImageWallpaper.ImageEngine#drawFrame"

    invoke-static {v0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getSourceWhich()I

    move-result v0

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    new-instance v3, Lcom/android/systemui/wallpaper/engines/image/ImageEngine$$ExternalSyntheticLambda3;

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    iput-object p0, v3, Lcom/android/systemui/wallpaper/engines/image/ImageEngine$$ExternalSyntheticLambda3;->f$0:Lcom/android/systemui/wallpaper/engines/image/ImageEngine;

    iput v0, v3, Lcom/android/systemui/wallpaper/engines/image/ImageEngine$$ExternalSyntheticLambda3;->f$1:I

    iput-object p1, v3, Lcom/android/systemui/wallpaper/engines/image/ImageEngine$$ExternalSyntheticLambda3;->f$2:Landroid/graphics/Canvas;

    iput-wide v1, v3, Lcom/android/systemui/wallpaper/engines/image/ImageEngine$$ExternalSyntheticLambda3;->f$3:J

    iput-object p2, v3, Lcom/android/systemui/wallpaper/engines/image/ImageEngine$$ExternalSyntheticLambda3;->f$4:Landroid/graphics/Rect;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    iget-object p1, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mWallpaperSource:Lcom/android/systemui/wallpaper/engines/image/ImageSource;

    invoke-virtual {p1, v3}, Lcom/android/systemui/wallpaper/engines/image/ImageSource;->useBitmap(Ljava/util/function/Consumer;)V

    invoke-static {}, Landroid/os/Trace;->endSection()V

    iget-object p1, p0, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->mCallback:Lcom/android/systemui/wallpaper/engines/WallpaperEngineCallback;

    check-cast p1, Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine$2;

    iget-object p1, p1, Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine$2;->this$1:Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/service/wallpaper/WallpaperService$Engine;->reportEngineShown(Z)V

    iget p1, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mBitmapUsages:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mBitmapUsages:I

    if-gtz p1, :cond_2

    iput p2, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mBitmapUsages:I

    const-string p1, "ImageWallpaper.ImageEngine#unloadBitmap"

    invoke-static {p1}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mWallpaperManager:Landroid/app/WallpaperManager;

    invoke-virtual {p0}, Landroid/app/WallpaperManager;->forgetLoadedWallpaper()V

    invoke-static {}, Landroid/os/Trace;->endSection()V

    :cond_2
    return-void
.end method

.method public final drawWarningTextIfNeeded(ILandroid/graphics/Canvas;Landroid/graphics/Bitmap;)V
    .locals 17

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, p2

    invoke-virtual {v0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getAppContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getSourceWhich()I

    move-result v4

    invoke-static {v4, v3}, Lcom/samsung/android/wallpaper/live/sdk/utils/DisplayUtils;->getDisplayStateByWhich(ILandroid/content/Context;)Lcom/samsung/android/wallpaper/live/sdk/utils/DisplayUtils$DisplayState;

    move-result-object v5

    if-eqz v5, :cond_0

    iget v5, v5, Lcom/samsung/android/wallpaper/live/sdk/utils/DisplayUtils$DisplayState;->displayId:I

    goto :goto_0

    :cond_0
    const/4 v5, -0x1

    :goto_0
    const-string/jumbo v7, "display"

    invoke-virtual {v3, v7}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/hardware/display/DisplayManager;

    invoke-virtual {v7, v5}, Landroid/hardware/display/DisplayManager;->getDisplay(I)Landroid/view/Display;

    move-result-object v7

    const-string v9, ", displayId="

    const-string v10, "CommonUtils"

    const/4 v11, 0x0

    if-nez v7, :cond_1

    new-instance v7, Ljava/lang/StringBuilder;

    const-string/jumbo v12, "getMaxResolution: failed to get display. which="

    invoke-direct {v7, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v10, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_1
    const/4 v8, 0x0

    goto :goto_3

    :cond_1
    new-instance v12, Landroid/graphics/Point;

    invoke-direct {v12, v11, v11}, Landroid/graphics/Point;-><init>(II)V

    invoke-virtual {v7}, Landroid/view/Display;->getSupportedModes()[Landroid/view/Display$Mode;

    move-result-object v7

    array-length v13, v7

    move v14, v11

    move v15, v14

    :goto_2
    if-ge v14, v13, :cond_3

    aget-object v16, v7, v14

    invoke-virtual/range {v16 .. v16}, Landroid/view/Display$Mode;->getPhysicalWidth()I

    move-result v8

    invoke-virtual/range {v16 .. v16}, Landroid/view/Display$Mode;->getPhysicalHeight()I

    move-result v6

    invoke-static {v8, v6}, Ljava/lang/Math;->max(II)I

    move-result v11

    if-le v11, v15, :cond_2

    invoke-virtual {v12, v8, v6}, Landroid/graphics/Point;->set(II)V

    move v15, v11

    :cond_2
    add-int/lit8 v14, v14, 0x1

    const/4 v11, 0x0

    goto :goto_2

    :cond_3
    if-nez v15, :cond_4

    const/4 v6, 0x0

    invoke-static {v3, v4, v6}, Lcom/samsung/android/wallpaper/live/sdk/utils/DisplayUtils;->getDisplaySize(Landroid/content/Context;II)Landroid/graphics/Point;

    move-result-object v7

    if-eqz v7, :cond_4

    iget v6, v7, Landroid/graphics/Point;->x:I

    iget v8, v7, Landroid/graphics/Point;->y:I

    invoke-static {v6, v8}, Ljava/lang/Math;->max(II)I

    move-result v15

    iget v6, v7, Landroid/graphics/Point;->x:I

    iget v7, v7, Landroid/graphics/Point;->y:I

    invoke-virtual {v12, v6, v7}, Landroid/graphics/Point;->set(II)V

    :cond_4
    if-nez v15, :cond_5

    new-instance v6, Ljava/lang/StringBuilder;

    const-string/jumbo v7, "getMaxResolution: failed to get default display size. which="

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v10, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    :cond_5
    move-object v8, v12

    :goto_3
    if-nez v8, :cond_6

    const/4 v6, 0x0

    goto :goto_4

    :cond_6
    iget v4, v8, Landroid/graphics/Point;->x:I

    iget v5, v8, Landroid/graphics/Point;->y:I

    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result v6

    :goto_4
    const/16 v4, 0x8

    invoke-static {v1, v4}, Lcom/android/systemui/wallpaper/utils/WhichChecker;->isFlagEnabled(II)Z

    move-result v4

    if-eqz v4, :cond_7

    const/16 v4, 0x1000

    invoke-static {v4, v6}, Ljava/lang/Math;->max(II)I

    move-result v6

    :cond_7
    int-to-float v4, v6

    const v5, 0x3f8ccccd    # 1.1f

    mul-float v7, v4, v5

    float-to-int v7, v7

    invoke-virtual/range {p3 .. p3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v9

    invoke-virtual/range {p3 .. p3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v10

    invoke-static {v9, v10}, Ljava/lang/Math;->max(II)I

    move-result v11

    if-le v11, v7, :cond_e

    if-nez v6, :cond_8

    goto/16 :goto_9

    :cond_8
    const/4 v6, 0x1

    if-eqz v8, :cond_9

    iget v7, v8, Landroid/graphics/Point;->x:I

    if-lez v7, :cond_9

    iget v7, v8, Landroid/graphics/Point;->y:I

    if-lez v7, :cond_9

    move/from16 v16, v6

    :goto_5
    const/4 v7, 0x0

    goto :goto_6

    :cond_9
    const/16 v16, 0x0

    goto :goto_5

    :goto_6
    invoke-static {v3, v1, v7}, Lcom/samsung/android/wallpaper/live/sdk/utils/DisplayUtils;->getDisplaySize(Landroid/content/Context;II)Landroid/graphics/Point;

    move-result-object v1

    if-eqz v1, :cond_a

    iget v3, v1, Landroid/graphics/Point;->x:I

    iget v1, v1, Landroid/graphics/Point;->y:I

    if-le v3, v1, :cond_a

    move v11, v6

    goto :goto_7

    :cond_a
    move v11, v7

    :goto_7
    invoke-static {}, Lcom/android/systemui/util/DeviceType;->isTablet()Z

    move-result v1

    if-eqz v16, :cond_d

    if-nez v11, :cond_b

    if-eqz v1, :cond_d

    :cond_b
    invoke-static {v9, v10}, Ljava/lang/Math;->min(II)I

    move-result v3

    invoke-static {v9, v10}, Ljava/lang/Math;->max(II)I

    move-result v4

    iget v6, v8, Landroid/graphics/Point;->x:I

    iget v7, v8, Landroid/graphics/Point;->y:I

    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    move-result v6

    int-to-float v6, v6

    iget v7, v8, Landroid/graphics/Point;->x:I

    iget v8, v8, Landroid/graphics/Point;->y:I

    invoke-static {v7, v8}, Ljava/lang/Math;->max(II)I

    move-result v7

    int-to-float v7, v7

    mul-float v8, v7, v5

    div-float v12, v7, v6

    mul-float/2addr v12, v7

    mul-float/2addr v5, v12

    int-to-float v12, v3

    cmpg-float v12, v12, v8

    if-gtz v12, :cond_c

    int-to-float v12, v4

    cmpg-float v12, v12, v5

    if-gtz v12, :cond_c

    goto/16 :goto_9

    :cond_c
    iget-object v12, v0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->TAG:Ljava/lang/String;

    const-string v13, ", isTablet="

    const-string v14, ", allowedBmpShort="

    const-string/jumbo v15, "drawWarningTextIfNeeded: loose condition. isLand="

    invoke-static {v15, v13, v14, v11, v1}, Landroidx/compose/foundation/text/input/internal/TextFieldCoreModifier$$ExternalSyntheticOutline0;->m(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v11, ", allowedBmpLong="

    const-string v13, ", bmpShort="

    invoke-static {v1, v8, v11, v5, v13}, Landroidx/compose/animation/core/Motion$$ExternalSyntheticOutline0;->m(Ljava/lang/StringBuilder;FLjava/lang/String;FLjava/lang/String;)V

    const-string v11, ", bmpLong="

    const-string v13, ", shortMaxRes="

    invoke-static {v3, v4, v11, v13, v1}, Landroidx/compose/foundation/ClickableKt$$ExternalSyntheticOutline0;->m(IILjava/lang/String;Ljava/lang/String;Ljava/lang/StringBuilder;)V

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v3, ", longMaxRes="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v12, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move v4, v8

    goto :goto_8

    :cond_d
    move v5, v4

    :goto_8
    iget-object v1, v0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    invoke-interface {v1}, Landroid/view/SurfaceHolder;->getSurfaceFrame()Landroid/graphics/Rect;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/Rect;->centerX()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v1}, Landroid/graphics/Rect;->centerY()I

    move-result v6

    int-to-float v6, v6

    new-instance v7, Landroid/graphics/Paint;

    invoke-direct {v7}, Landroid/graphics/Paint;-><init>()V

    const/high16 v8, -0x1000000

    invoke-virtual {v7, v8}, Landroid/graphics/Paint;->setColor(I)V

    new-instance v8, Landroid/graphics/Path;

    invoke-direct {v8}, Landroid/graphics/Path;-><init>()V

    new-instance v11, Landroid/graphics/RectF;

    const/high16 v12, 0x42c80000    # 100.0f

    sub-float v13, v6, v12

    iget-object v14, v0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    invoke-interface {v14}, Landroid/view/SurfaceHolder;->getSurfaceFrame()Landroid/graphics/Rect;

    move-result-object v14

    invoke-virtual {v14}, Landroid/graphics/Rect;->width()I

    move-result v14

    int-to-float v14, v14

    const/high16 v15, 0x43160000    # 150.0f

    add-float/2addr v15, v6

    move/from16 p1, v12

    const/4 v12, 0x0

    invoke-direct {v11, v12, v13, v14, v15}, Landroid/graphics/RectF;-><init>(FFFF)V

    sget-object v13, Landroid/graphics/Path$Direction;->CCW:Landroid/graphics/Path$Direction;

    invoke-virtual {v8, v11, v13}, Landroid/graphics/Path;->addRect(Landroid/graphics/RectF;Landroid/graphics/Path$Direction;)V

    const/high16 v11, 0x41a00000    # 20.0f

    invoke-virtual {v7, v11}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    sget-object v11, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v7, v11}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    invoke-virtual {v2, v8, v7}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    invoke-virtual {v7, v12}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    sget-object v8, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v7, v8}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    const/high16 v8, 0x41f00000    # 30.0f

    invoke-virtual {v7, v8}, Landroid/graphics/Paint;->setTextSize(F)V

    const/high16 v8, -0x10000

    invoke-virtual {v7, v8}, Landroid/graphics/Paint;->setColor(I)V

    new-instance v8, Ljava/lang/StringBuilder;

    const-string/jumbo v11, "This wallpaper isn\'t supported size : ["

    invoke-direct {v8, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v11, "x"

    const-string/jumbo v12, "]"

    invoke-static {v9, v10, v11, v12, v8}, Landroidx/compose/foundation/layout/FixedDpInsets$$ExternalSyntheticOutline0;->m(IILjava/lang/String;Ljava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v8, v3, v6, v7}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    const/4 v9, -0x1

    invoke-virtual {v7, v9}, Landroid/graphics/Paint;->setColor(I)V

    new-instance v9, Ljava/lang/StringBuilder;

    const-string/jumbo v10, "Maximum supported size : ["

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    float-to-int v4, v4

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    float-to-int v4, v5

    invoke-static {v4, v9, v12}, Landroidx/appcompat/oneui/common/internal/semblurinfo/SemBlurInfoStateBuilder$$ExternalSyntheticOutline0;->m(ILjava/lang/StringBuilder;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const/high16 v5, 0x42480000    # 50.0f

    add-float/2addr v5, v6

    invoke-virtual {v2, v4, v3, v5, v7}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Current surface size : ["

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    add-float v6, v6, p1

    invoke-virtual {v2, v1, v3, v6, v7}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    iget-object v0, v0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "drawWarningTextIfNeeded: "

    invoke-virtual {v1, v8}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_e
    :goto_9
    return-void
.end method

.method public final dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 0

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string p2, "Engine="

    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    invoke-virtual {p3, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string/jumbo p2, "valid surface="

    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getSurfaceHolder()Landroid/view/SurfaceHolder;

    move-result-object p2

    const-string/jumbo p4, "null"

    if-eqz p2, :cond_0

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getSurfaceHolder()Landroid/view/SurfaceHolder;

    move-result-object p2

    invoke-interface {p2}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object p2

    if-eqz p2, :cond_0

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getSurfaceHolder()Landroid/view/SurfaceHolder;

    move-result-object p2

    invoke-interface {p2}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object p2

    invoke-virtual {p2}, Landroid/view/Surface;->isValid()Z

    move-result p2

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    goto :goto_0

    :cond_0
    move-object p2, p4

    :goto_0
    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string/jumbo p2, "surface frame="

    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getSurfaceHolder()Landroid/view/SurfaceHolder;

    move-result-object p2

    if-eqz p2, :cond_1

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getSurfaceHolder()Landroid/view/SurfaceHolder;

    move-result-object p0

    invoke-interface {p0}, Landroid/view/SurfaceHolder;->getSurfaceFrame()Landroid/graphics/Rect;

    move-result-object p4

    :cond_1
    invoke-virtual {p3, p4}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string/jumbo p0, "bitmap="

    invoke-virtual {p3, p0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    return-void
.end method

.method public final estimateDrawStateToDraw(I)Lcom/android/systemui/wallpaper/engines/image/ImageEngine$DrawState;
    .locals 8

    iget-object v1, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mSurfaceLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->isSurfaceCreated()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p0, 0x0

    monitor-exit v1

    return-object p0

    :catchall_0
    move-exception v0

    move-object p0, v0

    goto :goto_2

    :cond_0
    iget-object v0, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    invoke-interface {v0}, Landroid/view/SurfaceHolder;->getSurfaceFrame()Landroid/graphics/Rect;

    move-result-object v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {p0, p1}, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->getDimFilterColor(I)Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getAppContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/android/systemui/wallpaper/glwallpaper/ImageDarkModeFilter;->isEnable(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    :goto_0
    move v7, v1

    goto :goto_1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0

    :goto_1
    new-instance v2, Lcom/android/systemui/wallpaper/engines/image/ImageEngine$DrawState;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v5

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v6

    move-object v3, p0

    move v4, p1

    invoke-direct/range {v2 .. v7}, Lcom/android/systemui/wallpaper/engines/image/ImageEngine$DrawState;-><init>(Lcom/android/systemui/wallpaper/engines/image/ImageEngine;IIIZ)V

    return-object v2

    :goto_2
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public final getDimFilterColor(I)Ljava/lang/Integer;
    .locals 4

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/android/systemui/wallpaper/utils/WhichChecker;->isFlagEnabled(II)Z

    move-result v1

    const/16 v2, 0x10

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mSystemWallpaperColors:Lcom/android/systemui/wallpaper/colors/SystemWallpaperColors;

    invoke-virtual {v1, p1}, Lcom/android/systemui/wallpaper/colors/SystemWallpaperColors;->getColor(I)Landroid/app/SemWallpaperColors;

    move-result-object p1

    goto :goto_0

    :cond_0
    sget-boolean v1, Lcom/android/systemui/LsRune;->WALLPAPER_SUB_DISPLAY_MODE:Z

    if-eqz v1, :cond_1

    sget-boolean v1, Lcom/android/systemui/LsRune;->WALLPAPER_SUB_WATCHFACE:Z

    if-nez v1, :cond_1

    invoke-static {p1, v2}, Lcom/android/systemui/wallpaper/utils/WhichChecker;->isFlagEnabled(II)Z

    move-result p1

    invoke-static {p1}, Lcom/android/systemui/wallpaper/WallpaperUtils;->getCachedSemWallpaperColors(Z)Landroid/app/SemWallpaperColors;

    move-result-object p1

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mKeyguardWallpaper:Lcom/android/systemui/wallpaper/KeyguardWallpaper;

    check-cast p1, Lcom/android/systemui/wallpaper/KeyguardWallpaperController;

    invoke-virtual {p1}, Lcom/android/systemui/wallpaper/KeyguardWallpaperController;->getHints()Landroid/app/SemWallpaperColors;

    move-result-object p1

    :goto_0
    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getAppContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, p1}, Lcom/android/systemui/wallpaper/glwallpaper/ImageDarkModeFilter;->getWallpaperFilterColor(Landroid/content/Context;Landroid/app/SemWallpaperColors;)[F

    move-result-object p1

    const/4 v1, 0x0

    if-nez p1, :cond_2

    return-object v1

    :cond_2
    sget-boolean v3, Lcom/android/systemui/LsRune;->SUBSCREEN_LARGE_FRONT_SUB_DISPLAY:Z

    if-eqz v3, :cond_4

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getSourceWhich()I

    move-result p0

    invoke-static {p0, v2}, Lcom/android/systemui/wallpaper/utils/WhichChecker;->isFlagEnabled(II)Z

    move-result p0

    if-nez p0, :cond_3

    goto :goto_1

    :cond_3
    return-object v1

    :cond_4
    :goto_1
    const/4 p0, 0x3

    aget p0, p1, p0

    const/4 v1, 0x0

    aget v1, p1, v1

    aget v0, p1, v0

    const/4 v2, 0x2

    aget p1, p1, v2

    invoke-static {p0, v1, v0, p1}, Landroid/graphics/Color;->argb(FFFF)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public final isSurfaceCreated()Z
    .locals 1

    iget-object v0, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mSurfaceLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object p0, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    monitor-exit v0

    return p0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public final onApplyDarkModeDimSettingChanged()V
    .locals 2

    new-instance v0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object p0, v0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine$$ExternalSyntheticLambda0;->f$0:Lcom/android/systemui/wallpaper/engines/image/ImageEngine;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    iget-object v1, p0, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->mCallback:Lcom/android/systemui/wallpaper/engines/WallpaperEngineCallback;

    check-cast v1, Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine$2;

    iget-object v1, v1, Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine$2;->this$1:Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine;

    iget-object v1, v1, Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine;->this$0:Lcom/android/systemui/wallpapers/ImageWallpaper;

    iget-object v1, v1, Lcom/android/systemui/wallpapers/ImageWallpaper;->mWorker:Landroid/os/HandlerThread;

    if-nez v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Landroid/os/HandlerThread;->getThreadHandler()Landroid/os/Handler;

    move-result-object v1

    :goto_0
    if-nez v1, :cond_1

    iget-object p0, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->TAG:Ljava/lang/String;

    const-string/jumbo v0, "runAsWorkerThread: worker handler is null."

    invoke-static {p0, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_1
    invoke-virtual {v1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final onCommand(Ljava/lang/String;IIILandroid/os/Bundle;Z)V
    .locals 0

    iget-object p2, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->TAG:Ljava/lang/String;

    new-instance p3, Ljava/lang/StringBuilder;

    const-string/jumbo p4, "onCommand: action = "

    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p2, p3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string/jumbo p2, "samsung.android.wallpaper.resume"

    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p2

    const/4 p3, 0x2

    iget-object p4, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mWallpaperAnimator:Lcom/android/systemui/wallpaper/engines/WallpaperAnimator;

    if-eqz p2, :cond_0

    if-eqz p4, :cond_0

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getWhich()I

    move-result p2

    invoke-static {p2, p3}, Lcom/android/systemui/wallpaper/utils/WhichChecker;->isFlagEnabled(II)Z

    move-result p2

    if-eqz p2, :cond_0

    iget-object p0, p4, Lcom/android/systemui/wallpaper/engines/WallpaperAnimator;->TAG:Ljava/lang/String;

    const-string/jumbo p1, "changeToDownScaleImmediately"

    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p4}, Lcom/android/systemui/wallpaper/engines/WallpaperAnimator;->release()V

    const/high16 p0, 0x3f800000    # 1.0f

    invoke-virtual {p4, p0}, Lcom/android/systemui/wallpaper/engines/WallpaperAnimator;->onTransitionScaleChanged(F)V

    goto :goto_0

    :cond_0
    const-string/jumbo p2, "android.wallpaper.keyguardgoingaway"

    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_1

    if-eqz p4, :cond_1

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getWhich()I

    move-result p0

    invoke-static {p0, p3}, Lcom/android/systemui/wallpaper/utils/WhichChecker;->isFlagEnabled(II)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x0

    iput-boolean p0, p4, Lcom/android/systemui/wallpaper/engines/WallpaperAnimator;->mKeyguardState:Z

    :cond_1
    :goto_0
    return-void
.end method

.method public final onCreate(Landroid/view/SurfaceHolder;)V
    .locals 5

    iget-object v0, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Engine onCreate: which="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getWhich()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", displayId="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->mCallback:Lcom/android/systemui/wallpaper/engines/WallpaperEngineCallback;

    move-object v3, v2

    check-cast v3, Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine$2;

    iget-object v3, v3, Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine$2;->this$1:Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine;

    invoke-virtual {v3}, Landroid/service/wallpaper/WallpaperService$Engine;->getDisplayId()I

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v3, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mLogger:Lcom/android/systemui/wallpaper/log/WallpaperLogger;

    check-cast v3, Lcom/android/systemui/wallpaper/log/WallpaperLoggerImpl;

    invoke-virtual {v3, v0, v1}, Lcom/android/systemui/wallpaper/log/WallpaperLoggerImpl;->log(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "ImageWallpaper.ImageEngine#onCreate"

    invoke-static {v0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Surface;->isValid()Z

    move-result v0

    move-object v1, v2

    check-cast v1, Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine$2;

    iget-object v1, v1, Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine$2;->this$1:Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine;

    invoke-virtual {v1}, Landroid/service/wallpaper/WallpaperService$Engine;->isPreview()Z

    move-result v1

    iget-object v4, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mWallpaperSource:Lcom/android/systemui/wallpaper/engines/image/ImageSource;

    invoke-virtual {v4, v1}, Lcom/android/systemui/wallpaper/engines/image/ImageSource;->isFixedOrientation(Z)Z

    move-result v1

    check-cast v2, Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine$2;

    iget-object v2, v2, Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine$2;->this$1:Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine;

    invoke-static {v2, v1, v0}, Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine;->access$100(Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine;ZZ)V

    invoke-virtual {v4}, Lcom/android/systemui/wallpaper/engines/image/ImageSource;->getSupplier()Lcom/android/systemui/wallpaper/engines/image/ImageSource$ImageSupplier;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/systemui/wallpaper/engines/image/ImageSource$ImageSupplier;->supportWallpaperScrolling()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "onCreate: require fixed size surface"

    invoke-virtual {v3, v0, v1}, Lcom/android/systemui/wallpaper/log/WallpaperLoggerImpl;->log(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine$$ExternalSyntheticLambda2;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object p0, v0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine$$ExternalSyntheticLambda2;->f$0:Lcom/android/systemui/wallpaper/engines/image/ImageEngine;

    iput-object p1, v0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine$$ExternalSyntheticLambda2;->f$1:Landroid/view/SurfaceHolder;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {v4, v0}, Lcom/android/systemui/wallpaper/engines/image/ImageSource;->useBitmap(Ljava/util/function/Consumer;)V

    :cond_0
    iget-object p1, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mTiltColorController:Lcom/android/systemui/wallpaper/tilt/TiltColorController;

    if-eqz p1, :cond_tilt_create

    invoke-virtual {p1}, Lcom/android/systemui/wallpaper/tilt/TiltColorController;->start()V

    :cond_tilt_create
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mIsEngineAlive:Z

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getSourceWhich()I

    move-result p1

    invoke-static {}, Lcom/android/systemui/util/DeviceType;->isShipBuild()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    goto :goto_1

    :cond_1
    sget v0, Landroid/os/Build$VERSION;->SEM_FIRST_SDK_INT:I

    const/16 v2, 0x23

    if-ge v0, v2, :cond_2

    goto :goto_1

    :cond_2
    invoke-static {}, Lcom/android/systemui/util/DeviceType;->isFactoryBinary()Z

    move-result v0

    if-eqz v0, :cond_3

    goto :goto_1

    :cond_3
    iget-object v0, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mWallpaperManager:Landroid/app/WallpaperManager;

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getCurrentUserId()I

    move-result v2

    invoke-virtual {v0, p1, v2}, Landroid/app/WallpaperManager;->semGetWallpaperType(II)I

    move-result v0

    const/4 v2, 0x3

    if-eq v0, v2, :cond_7

    const/16 v2, 0x3e8

    if-ne v0, v2, :cond_4

    goto :goto_1

    :cond_4
    iget-object v0, v4, Lcom/android/systemui/wallpaper/engines/image/ImageSource;->mWallpaperManager:Landroid/app/WallpaperManager;

    iget v2, v4, Lcom/android/systemui/wallpaper/engines/image/ImageSource;->mWhich:I

    iget v3, v4, Lcom/android/systemui/wallpaper/engines/image/ImageSource;->mUserId:I

    invoke-virtual {v0, v2, v3}, Landroid/app/WallpaperManager;->getWallpaperExtras(II)Landroid/os/Bundle;

    move-result-object v0

    if-nez v0, :cond_5

    const/4 v0, 0x0

    goto :goto_0

    :cond_5
    const-string/jumbo v2, "imageCategory"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    iget-object v2, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string/jumbo v4, "isWallpaperSizeWarningEnabled: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const-string v2, "Graphical"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_7

    const-string v2, "Colors"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    goto :goto_1

    :cond_6
    iget-object v0, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mWallpaperManager:Landroid/app/WallpaperManager;

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getCurrentUserId()I

    move-result v1

    invoke-virtual {v0, p1, v1}, Landroid/app/WallpaperManager;->semIsPreloadedWallpaper(II)Z

    move-result v1

    :cond_7
    :goto_1
    iput-boolean v1, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mIsWallpaperSizeWarningEnabled:Z

    invoke-static {}, Landroid/os/Trace;->endSection()V

    return-void
.end method

.method public final onDestroy()V
    .locals 4

    iget-object v0, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mLogger:Lcom/android/systemui/wallpaper/log/WallpaperLogger;

    iget-object v1, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Engine onDestroy: which="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getWhich()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, ", displayId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->mCallback:Lcom/android/systemui/wallpaper/engines/WallpaperEngineCallback;

    check-cast v3, Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine$2;

    iget-object v3, v3, Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine$2;->this$1:Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine;

    invoke-virtual {v3}, Landroid/service/wallpaper/WallpaperService$Engine;->getDisplayId()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    check-cast v0, Lcom/android/systemui/wallpaper/log/WallpaperLoggerImpl;

    invoke-virtual {v0, v1, v2}, Lcom/android/systemui/wallpaper/log/WallpaperLoggerImpl;->log(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mWallpaperAnimator:Lcom/android/systemui/wallpaper/engines/WallpaperAnimator;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/android/systemui/wallpaper/engines/WallpaperAnimator;->release()V

    :cond_0
    iget-object v0, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mDownScaledSourceBitmapManager:Lcom/android/systemui/wallpaper/engines/image/DownScaledSourceBitmapManager;

    iget-object v1, v0, Lcom/android/systemui/wallpaper/engines/image/DownScaledSourceBitmapManager;->mSourceBitmapSet:Ljava/util/HashMap;

    monitor-enter v1

    :try_start_0
    iget-object v0, v0, Lcom/android/systemui/wallpaper/engines/image/DownScaledSourceBitmapManager;->mSourceBitmapSet:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/systemui/wallpaper/engines/image/DownScaledSourceBitmapManager$Item;

    if-eqz v2, :cond_1

    iget-object v3, v2, Lcom/android/systemui/wallpaper/engines/image/DownScaledSourceBitmapManager$Item;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz v3, :cond_1

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v3

    if-nez v3, :cond_1

    iget-object v2, v2, Lcom/android/systemui/wallpaper/engines/image/DownScaledSourceBitmapManager$Item;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->recycle()V

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_1

    :cond_2
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mTiltColorController:Lcom/android/systemui/wallpaper/tilt/TiltColorController;

    if-eqz v0, :cond_tilt_destroy

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/systemui/wallpaper/tilt/TiltColorController;->setEnable(Z)V

    invoke-virtual {v0}, Lcom/android/systemui/wallpaper/tilt/TiltColorController;->stop()V

    :cond_tilt_destroy
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mIsEngineAlive:Z

    return-void

    :goto_1
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public final onDisplayStateChanged(Lcom/samsung/android/wallpaper/live/sdk/data/DisplayState;Lcom/samsung/android/wallpaper/live/sdk/data/DisplayState;)V
    .locals 7

    iget-object v0, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "onDisplayStateChanged: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p2, " -> "

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getAppContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getCurrentUserId()I

    move-result v0

    sget-boolean v1, Lcom/android/systemui/wallpaper/WallpaperUtils;->mIsExternalLiveWallpaper:Z

    new-instance v1, Lcom/android/internal/widget/LockPatternUtils;

    invoke-direct {v1, p2}, Lcom/android/internal/widget/LockPatternUtils;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v0}, Lcom/android/internal/widget/LockPatternUtils;->isLockScreenDisabled(I)Z

    move-result p2

    iget-object v0, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mTiltColorController:Lcom/android/systemui/wallpaper/tilt/TiltColorController;

    if-eqz v0, :cond_tilt_disp_end

    sget-object v1, Lcom/samsung/android/wallpaper/live/sdk/data/DisplayState;->ON:Lcom/samsung/android/wallpaper/live/sdk/data/DisplayState;

    if-ne p1, v1, :cond_tilt_disp_off

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->isVisible()Z

    move-result v1

    if-eqz v1, :cond_tilt_disp_end

    iget-boolean v1, v0, Lcom/android/systemui/wallpaper/tilt/TiltColorController;->mPrevState:Z

    if-nez v1, :cond_tilt_disp_resume

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/systemui/wallpaper/tilt/TiltColorController;->updateDraw(Z)Z

    :cond_tilt_disp_resume
    invoke-virtual {v0}, Lcom/android/systemui/wallpaper/tilt/TiltColorController;->resumeSensor()V

    goto :goto_tilt_disp_end

    :cond_tilt_disp_off
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/systemui/wallpaper/tilt/TiltColorController;->updateDraw(Z)Z

    :cond_tilt_disp_end
    :goto_tilt_disp_end
    iget-object v0, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mWallpaperAnimator:Lcom/android/systemui/wallpaper/engines/WallpaperAnimator;

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getWhich()I

    move-result v0

    const/4 v1, 0x2

    invoke-static {v0, v1}, Lcom/android/systemui/wallpaper/utils/WhichChecker;->isFlagEnabled(II)Z

    move-result v0

    if-eqz v0, :cond_1

    if-nez p2, :cond_1

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getWhich()I

    move-result v3

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->isVisible()Z

    move-result v4

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getWhich()I

    move-result p2

    and-int/lit8 p2, p2, 0x3c

    invoke-static {p2}, Lcom/android/systemui/wallpaper/WallpaperUtils;->isShowWallpaperOnAodEnabled(I)Z

    move-result p2

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mDozeParameters:Lcom/android/systemui/statusbar/phone/DozeParameters;

    iget-boolean p2, p2, Lcom/android/systemui/statusbar/phone/DozeParameters;->mControlScreenOffAnimation:Z

    if-eqz p2, :cond_0

    const/4 p2, 0x1

    :goto_0
    move v5, p2

    goto :goto_1

    :cond_0
    const/4 p2, 0x0

    goto :goto_0

    :goto_1
    const/4 v6, 0x0

    iget-object v1, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mWallpaperAnimator:Lcom/android/systemui/wallpaper/engines/WallpaperAnimator;

    move-object v2, p1

    invoke-virtual/range {v1 .. v6}, Lcom/android/systemui/wallpaper/engines/WallpaperAnimator;->onDisplayStateChanged(Lcom/samsung/android/wallpaper/live/sdk/data/DisplayState;IZZZ)V

    :cond_1
    return-void
.end method

.method public final onGetScreenshot(Lcom/samsung/android/wallpaper/live/sdk/data/ScreenshotOptions;)Lcom/samsung/android/wallpaper/live/sdk/data/ScreenshotResults;
    .locals 13

    iget-object v0, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "onGetScreenshot"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getAppContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getSourceWhich()I

    move-result v1

    invoke-static {v1, v0}, Lcom/samsung/android/wallpaper/live/sdk/utils/DisplayUtils;->getDisplayStateByWhich(ILandroid/content/Context;)Lcom/samsung/android/wallpaper/live/sdk/utils/DisplayUtils$DisplayState;

    move-result-object v2

    const/4 v3, 0x0

    if-eqz v2, :cond_0

    iget v2, v2, Lcom/samsung/android/wallpaper/live/sdk/utils/DisplayUtils$DisplayState;->rotation:I

    goto :goto_0

    :cond_0
    move v2, v3

    :goto_0
    invoke-static {v0, v1, v2}, Lcom/samsung/android/wallpaper/live/sdk/utils/DisplayUtils;->getDisplaySize(Landroid/content/Context;II)Landroid/graphics/Point;

    move-result-object v4

    const/4 v5, 0x0

    if-nez v4, :cond_1

    iget-object p0, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->TAG:Ljava/lang/String;

    const-string/jumbo p1, "onGetScreenshot: failed to get display size. srcWhich="

    invoke-static {v1, p1, p0}, Lcom/android/keyguard/EmergencyButton$$ExternalSyntheticOutline0;->m(ILjava/lang/String;Ljava/lang/String;)V

    return-object v5

    :cond_1
    iget-object v1, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mWallpaperSource:Lcom/android/systemui/wallpaper/engines/image/ImageSource;

    iget-object v6, p0, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->mCallback:Lcom/android/systemui/wallpaper/engines/WallpaperEngineCallback;

    check-cast v6, Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine$2;

    iget-object v6, v6, Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine$2;->this$1:Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine;

    invoke-virtual {v6}, Landroid/service/wallpaper/WallpaperService$Engine;->isPreview()Z

    move-result v6

    invoke-virtual {v1, v6}, Lcom/android/systemui/wallpaper/engines/image/ImageSource;->isFixedOrientation(Z)Z

    move-result v1

    iget-object v6, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mWallpaperSource:Lcom/android/systemui/wallpaper/engines/image/ImageSource;

    invoke-virtual {v6}, Lcom/android/systemui/wallpaper/engines/image/ImageSource;->getSupplier()Lcom/android/systemui/wallpaper/engines/image/ImageSource$ImageSupplier;

    move-result-object v6

    invoke-interface {v6}, Lcom/android/systemui/wallpaper/engines/image/ImageSource$ImageSupplier;->supportWallpaperScrolling()Z

    move-result v6

    iget-object v7, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mSurfaceLock:Ljava/lang/Object;

    monitor-enter v7

    :try_start_0
    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->isSurfaceCreated()Z

    move-result v8

    if-eqz v8, :cond_4

    iget-object v8, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    invoke-interface {v8}, Landroid/view/SurfaceHolder;->getSurfaceFrame()Landroid/graphics/Rect;

    move-result-object v8

    invoke-virtual {v8}, Landroid/graphics/Rect;->width()I

    move-result v9

    invoke-virtual {v8}, Landroid/graphics/Rect;->height()I

    move-result v8

    if-eqz v6, :cond_3

    iget v6, v4, Landroid/graphics/Point;->x:I

    iget v10, v4, Landroid/graphics/Point;->y:I

    invoke-static {v9, v8, v6, v10}, Lcom/samsung/android/wallpaper/live/sdk/utils/GraphicsUtils;->getCenterCropRect(IIII)Landroid/graphics/Rect;

    move-result-object v6

    if-nez v6, :cond_2

    goto :goto_2

    :cond_2
    invoke-virtual {v6}, Landroid/graphics/Rect;->width()I

    move-result v8

    invoke-virtual {v6}, Landroid/graphics/Rect;->height()I

    move-result v9

    new-instance v10, Landroid/graphics/Point;

    invoke-direct {v10, v8, v9}, Landroid/graphics/Point;-><init>(II)V

    iget-boolean v11, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mIsFullQualityFrameDrawn:Z

    if-eqz v11, :cond_5

    iget-object v11, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    new-instance v12, Landroid/util/Size;

    invoke-direct {v12, v8, v9}, Landroid/util/Size;-><init>(II)V

    invoke-static {v11, v6, v12}, Lcom/samsung/android/wallpaper/live/sdk/utils/DisplayUtils;->copySurfaceToBitmapSync(Landroid/view/SurfaceHolder;Landroid/graphics/Rect;Landroid/util/Size;)Landroid/graphics/Bitmap;

    move-result-object v6

    goto :goto_3

    :catchall_0
    move-exception p0

    goto/16 :goto_5

    :cond_3
    new-instance v10, Landroid/graphics/Point;

    invoke-direct {v10, v9, v8}, Landroid/graphics/Point;-><init>(II)V

    iget-boolean v6, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mIsFullQualityFrameDrawn:Z

    if-eqz v6, :cond_5

    iget-object v6, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    new-instance v11, Landroid/util/Size;

    invoke-direct {v11, v9, v8}, Landroid/util/Size;-><init>(II)V

    invoke-static {v6, v5, v11}, Lcom/samsung/android/wallpaper/live/sdk/utils/DisplayUtils;->copySurfaceToBitmapSync(Landroid/view/SurfaceHolder;Landroid/graphics/Rect;Landroid/util/Size;)Landroid/graphics/Bitmap;

    move-result-object v6

    goto :goto_3

    :cond_4
    if-eqz v1, :cond_6

    new-instance v10, Landroid/graphics/Point;

    iget v6, v4, Landroid/graphics/Point;->x:I

    iget v8, v4, Landroid/graphics/Point;->y:I

    invoke-static {v6, v8}, Ljava/lang/Math;->min(II)I

    move-result v6

    iget v8, v4, Landroid/graphics/Point;->x:I

    iget v9, v4, Landroid/graphics/Point;->y:I

    invoke-static {v8, v9}, Ljava/lang/Math;->max(II)I

    move-result v8

    invoke-direct {v10, v6, v8}, Landroid/graphics/Point;-><init>(II)V

    :cond_5
    :goto_1
    move-object v6, v5

    goto :goto_3

    :cond_6
    :goto_2
    move-object v10, v4

    goto :goto_1

    :goto_3
    if-nez v6, :cond_8

    iget v8, v10, Landroid/graphics/Point;->x:I

    if-lez v8, :cond_8

    iget v8, v10, Landroid/graphics/Point;->y:I

    if-lez v8, :cond_8

    iget-object p1, p1, Lcom/samsung/android/wallpaper/live/sdk/data/ScreenshotOptions;->mPurpose:Ljava/lang/String;

    const-string/jumbo v6, "prev"

    invoke-static {p1, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_7

    iget p1, v4, Landroid/graphics/Point;->x:I

    iget v3, v4, Landroid/graphics/Point;->y:I

    invoke-static {v0, p1, v3, v2}, Lcom/android/systemui/wallpaper/WallpaperUtils;->getScreenShot(Landroid/content/Context;III)Landroid/graphics/Bitmap;

    move-result-object v6

    goto :goto_4

    :cond_7
    iget p1, v10, Landroid/graphics/Point;->x:I

    iget v0, v10, Landroid/graphics/Point;->y:I

    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p1, v0, v4, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    move-result-object v6

    new-instance p1, Landroid/graphics/Canvas;

    invoke-direct {p1, v6}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {p0, p1, v5}, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->drawFullQualityFrame(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V

    :cond_8
    :goto_4
    monitor-exit v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v6, :cond_9

    iget-object p0, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->TAG:Ljava/lang/String;

    const-string/jumbo p1, "onGetScreenshot: failed to generate screenshot"

    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-object v5

    :cond_9
    if-eqz v1, :cond_b

    invoke-static {v2}, Lcom/samsung/android/wallpaper/live/sdk/utils/DisplayUtils;->convertDisplayRotationToAngle(I)I

    move-result p0

    neg-int p0, p0

    const/high16 p1, 0x3f800000    # 1.0f

    const/4 v0, 0x1

    invoke-static {v6, v5, p0, p1, v0}, Lcom/samsung/android/wallpaper/live/sdk/utils/BitmapUtils;->cropRotateResizeBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;IFZ)Landroid/graphics/Bitmap;

    move-result-object p0

    if-eq p0, v6, :cond_a

    invoke-virtual {v6}, Landroid/graphics/Bitmap;->recycle()V

    :cond_a
    move-object v6, p0

    :cond_b
    new-instance p0, Lcom/samsung/android/wallpaper/live/sdk/data/ScreenshotResults;

    invoke-direct {p0, v6}, Lcom/samsung/android/wallpaper/live/sdk/data/ScreenshotResults;-><init>(Landroid/graphics/Bitmap;)V

    return-object p0

    :goto_5
    :try_start_1
    monitor-exit v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public final onStartedWakingUp()V
    .locals 1

    iget-object p0, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->TAG:Ljava/lang/String;

    const-string/jumbo v0, "onStartedWakingUp"

    invoke-static {p0, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public final onSurfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 0

    iget-object p0, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->TAG:Ljava/lang/String;

    const-string/jumbo p1, "onSurfaceChanged: width = "

    const-string p2, ", height = "

    invoke-static {p3, p4, p1, p2, p0}, Lcom/android/systemui/pluginlock/PluginLockProvider$$ExternalSyntheticOutline0;->m(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public final onSurfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 3

    iget-object v0, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, " onSurfaceCreated: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurfaceFrame()Landroid/graphics/Rect;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iput-object p1, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    return-void
.end method

.method public final onSurfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 1

    iget-object p1, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->TAG:Ljava/lang/String;

    const-string/jumbo v0, "onSurfaceDestroyed"

    invoke-static {p1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mSurfaceLock:Ljava/lang/Object;

    monitor-enter p1

    const/4 v0, 0x0

    :try_start_0
    iput-object v0, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    monitor-exit p1

    return-void

    :catchall_0
    move-exception p0

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public final onSurfaceRedrawNeeded(Landroid/view/SurfaceHolder;)V
    .locals 11

    const-string/jumbo p1, "onSurfaceRedrawNeeded: displayId="

    iget-boolean v0, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mIsEngineAlive:Z

    if-nez v0, :cond_0

    iget-object p0, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->TAG:Ljava/lang/String;

    const-string/jumbo p1, "onSurfaceRedrawNeeded: engine already destroyed"

    invoke-static {p0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getSourceWhich()I

    move-result v0

    iget-object v1, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mSurfaceLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->isSurfaceCreated()Z

    move-result v2

    if-nez v2, :cond_1

    iget-object p0, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->TAG:Ljava/lang/String;

    const-string/jumbo p1, "onSurfaceRedrawNeeded: the surface holder is invalid"

    invoke-static {p0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    move-object p0, v0

    goto/16 :goto_2

    :cond_1
    new-instance v6, Landroid/graphics/Rect;

    iget-object v2, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    invoke-interface {v2}, Landroid/view/SurfaceHolder;->getSurfaceFrame()Landroid/graphics/Rect;

    move-result-object v2

    invoke-direct {v6, v2}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v1, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string/jumbo v3, "onSurfaceRedrawNeeded: srcWhich="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, ", surfaceFrame="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0, v0}, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->estimateDrawStateToDraw(I)Lcom/android/systemui/wallpaper/engines/image/ImageEngine$DrawState;

    move-result-object v1

    iget-object v2, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mLock:Ljava/lang/Object;

    monitor-enter v2

    :try_start_1
    iget-object v3, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->mCallback:Lcom/android/systemui/wallpaper/engines/WallpaperEngineCallback;

    check-cast p1, Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine$2;

    iget-object p1, p1, Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine$2;->this$1:Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine;

    invoke-virtual {p1}, Landroid/service/wallpaper/WallpaperService$Engine;->getDisplayId()I

    move-result p1

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ", lastDrawn=("

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mLastDrawnState:Lcom/android/systemui/wallpaper/engines/image/ImageEngine$DrawState;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, "), toDraw=("

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, ")"

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v3, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mLastDrawnState:Lcom/android/systemui/wallpaper/engines/image/ImageEngine$DrawState;

    if-eqz p1, :cond_2

    invoke-virtual {p1, v1}, Lcom/android/systemui/wallpaper/engines/image/ImageEngine$DrawState;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p0, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->TAG:Ljava/lang/String;

    const-string/jumbo p1, "onSurfaceRedrawNeeded: not need redraw"

    invoke-static {p0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    monitor-exit v2

    return-void

    :catchall_1
    move-exception v0

    move-object p0, v0

    goto/16 :goto_1

    :cond_2
    iget-object p1, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mLastDrawnState:Lcom/android/systemui/wallpaper/engines/image/ImageEngine$DrawState;

    if-eqz p1, :cond_3

    if-eqz v1, :cond_3

    iget v3, p1, Lcom/android/systemui/wallpaper/engines/image/ImageEngine$DrawState;->mSurfaceWidth:I

    iget p1, p1, Lcom/android/systemui/wallpaper/engines/image/ImageEngine$DrawState;->mSurfaceHeight:I

    mul-int/2addr v3, p1

    iget p1, v1, Lcom/android/systemui/wallpaper/engines/image/ImageEngine$DrawState;->mSurfaceWidth:I

    iget v4, v1, Lcom/android/systemui/wallpaper/engines/image/ImageEngine$DrawState;->mSurfaceHeight:I

    mul-int/2addr p1, v4

    if-eq v3, p1, :cond_3

    iget-object p1, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mWallpaperSource:Lcom/android/systemui/wallpaper/engines/image/ImageSource;

    invoke-virtual {p1, v0}, Lcom/android/systemui/wallpaper/engines/image/ImageSource;->updateSupplier(I)V

    :cond_3
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    iget-object p1, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mDownScaledSourceBitmapManager:Lcom/android/systemui/wallpaper/engines/image/DownScaledSourceBitmapManager;

    invoke-virtual {p1, v0}, Lcom/android/systemui/wallpaper/engines/image/DownScaledSourceBitmapManager;->get(I)Lcom/android/systemui/wallpaper/engines/image/DownScaledSourceBitmapManager$Item;

    move-result-object p1

    if-eqz p1, :cond_6

    iget-object v10, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mLock:Ljava/lang/Object;

    monitor-enter v10

    :try_start_2
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    iget-object v7, p1, Lcom/android/systemui/wallpaper/engines/image/DownScaledSourceBitmapManager$Item;->mBitmap:Landroid/graphics/Bitmap;

    iget-object v8, p1, Lcom/android/systemui/wallpaper/engines/image/DownScaledSourceBitmapManager$Item;->mCropRects:Ljava/util/ArrayList;

    iget v9, p1, Lcom/android/systemui/wallpaper/engines/image/DownScaledSourceBitmapManager$Item;->mScale:F

    const/4 v3, 0x0

    move-object v2, p0

    invoke-virtual/range {v2 .. v9}, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->drawFrameOnCanvas(Landroid/graphics/Canvas;JLandroid/graphics/Rect;Landroid/graphics/Bitmap;Ljava/util/ArrayList;F)Lcom/android/systemui/wallpaper/engines/image/ImageEngine$DrawState;

    monitor-exit v10
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    iget-object p0, v2, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mLock:Ljava/lang/Object;

    monitor-enter p0

    :try_start_3
    iput-object v1, v2, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mLastDrawnState:Lcom/android/systemui/wallpaper/engines/image/ImageEngine$DrawState;

    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    new-instance p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine$$ExternalSyntheticLambda1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v2, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine$$ExternalSyntheticLambda1;->f$0:Lcom/android/systemui/wallpaper/engines/image/ImageEngine;

    iput-object v6, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine$$ExternalSyntheticLambda1;->f$1:Landroid/graphics/Rect;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    iget-object p1, v2, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->mCallback:Lcom/android/systemui/wallpaper/engines/WallpaperEngineCallback;

    check-cast p1, Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine$2;

    iget-object p1, p1, Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine$2;->this$1:Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine;

    iget-object p1, p1, Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine;->this$0:Lcom/android/systemui/wallpapers/ImageWallpaper;

    iget-object p1, p1, Lcom/android/systemui/wallpapers/ImageWallpaper;->mWorker:Landroid/os/HandlerThread;

    if-nez p1, :cond_4

    const/4 p1, 0x0

    goto :goto_0

    :cond_4
    invoke-virtual {p1}, Landroid/os/HandlerThread;->getThreadHandler()Landroid/os/Handler;

    move-result-object p1

    :goto_0
    if-nez p1, :cond_5

    iget-object p0, v2, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->TAG:Ljava/lang/String;

    const-string/jumbo p1, "runAsWorkerThread: worker handler is null."

    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_5
    invoke-virtual {p1, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :catchall_2
    move-exception v0

    move-object p1, v0

    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    throw p1

    :catchall_3
    move-exception v0

    move-object p0, v0

    :try_start_5
    monitor-exit v10
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    throw p0

    :cond_6
    move-object v2, p0

    invoke-virtual {v2, v6}, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->drawFrameSynchronized(Landroid/graphics/Rect;)V

    return-void

    :goto_1
    :try_start_6
    monitor-exit v2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    throw p0

    :goto_2
    :try_start_7
    monitor-exit v1
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    throw p0
.end method

.method public final onVisibilityChanged(Z)V
    .locals 5

    iget-object v0, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->TAG:Ljava/lang/String;

    const-string v1, " onVisibilityChanged: visible="

    const-string v2, " , displayId="

    invoke-static {v1, v2, p1}, Landroidx/appcompat/widget/SearchView$$ExternalSyntheticOutline0;->m(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->mCallback:Lcom/android/systemui/wallpaper/engines/WallpaperEngineCallback;

    check-cast v2, Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine$2;

    iget-object v2, v2, Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine$2;->this$1:Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine;

    invoke-virtual {v2}, Landroid/service/wallpaper/WallpaperService$Engine;->getDisplayId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getAppContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getCurrentUserId()I

    move-result v1

    sget-boolean v2, Lcom/android/systemui/wallpaper/WallpaperUtils;->mIsExternalLiveWallpaper:Z

    new-instance v2, Lcom/android/internal/widget/LockPatternUtils;

    invoke-direct {v2, v0}, Lcom/android/internal/widget/LockPatternUtils;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v1}, Lcom/android/internal/widget/LockPatternUtils;->isLockScreenDisabled(I)Z

    move-result v0

    iget-object v1, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mTiltColorController:Lcom/android/systemui/wallpaper/tilt/TiltColorController;

    if-eqz v1, :cond_tilt_vis_end

    if-eqz p1, :cond_tilt_vis_false

    iget-boolean v2, v1, Lcom/android/systemui/wallpaper/tilt/TiltColorController;->mPrevState:Z

    if-nez v2, :cond_tilt_vis_resume

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/android/systemui/wallpaper/tilt/TiltColorController;->updateDraw(Z)Z

    :cond_tilt_vis_resume
    invoke-virtual {v1}, Lcom/android/systemui/wallpaper/tilt/TiltColorController;->resumeSensor()V

    goto :goto_tilt_vis_end

    :cond_tilt_vis_false
    invoke-virtual {v1}, Lcom/android/systemui/wallpaper/tilt/TiltColorController;->pauseSensor()V

    :cond_tilt_vis_end
    :goto_tilt_vis_end
    const/4 v1, 0x0

    iget-object v2, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mWallpaperAnimator:Lcom/android/systemui/wallpaper/engines/WallpaperAnimator;

    if-eqz p1, :cond_0

    if-eqz v2, :cond_0

    if-eqz v0, :cond_0

    iput-boolean v1, v2, Lcom/android/systemui/wallpaper/engines/WallpaperAnimator;->mKeyguardState:Z

    :cond_0
    if-eqz v2, :cond_2

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getWhich()I

    move-result v3

    const/4 v4, 0x2

    invoke-static {v3, v4}, Lcom/android/systemui/wallpaper/utils/WhichChecker;->isFlagEnabled(II)Z

    move-result v3

    if-eqz v3, :cond_2

    if-nez v0, :cond_2

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getWhich()I

    move-result v0

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getWhich()I

    move-result v3

    and-int/lit8 v3, v3, 0x3c

    invoke-static {v3}, Lcom/android/systemui/wallpaper/WallpaperUtils;->isShowWallpaperOnAodEnabled(I)Z

    move-result v3

    if-eqz v3, :cond_1

    iget-object p0, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mDozeParameters:Lcom/android/systemui/statusbar/phone/DozeParameters;

    iget-boolean p0, p0, Lcom/android/systemui/statusbar/phone/DozeParameters;->mControlScreenOffAnimation:Z

    if-eqz p0, :cond_1

    const/4 p0, 0x1

    goto :goto_0

    :cond_1
    move p0, v1

    :goto_0
    invoke-virtual {v2, v0, p1, p0, v1}, Lcom/android/systemui/wallpaper/engines/WallpaperAnimator;->onEngineVisibilityChanged(IZZZ)V

    :cond_2
    return-void
.end method

.method public final onWhichChanged(I)V
    .locals 2

    const-string/jumbo v0, "[Image]"

    const-string v1, "ImageWallpaper_"

    invoke-static {p1, v1, v0}, Landroidx/compose/animation/core/Motion$$ExternalSyntheticOutline0;->m(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->TAG:Ljava/lang/String;

    invoke-static {p1}, Lcom/android/systemui/wallpaper/utils/WhichChecker;->getSourceWhich(I)I

    move-result p1

    iget-object p0, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mWallpaperSource:Lcom/android/systemui/wallpaper/engines/image/ImageSource;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string/jumbo v1, "[ImageSource]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/systemui/wallpaper/engines/image/ImageSource;->TAG:Ljava/lang/String;

    iput p1, p0, Lcom/android/systemui/wallpaper/engines/image/ImageSource;->mWhich:I

    iget-object v0, p0, Lcom/android/systemui/wallpaper/engines/image/ImageSource;->mWallpaperManager:Landroid/app/WallpaperManager;

    iget v1, p0, Lcom/android/systemui/wallpaper/engines/image/ImageSource;->mUserId:I

    invoke-virtual {v0, p1, v1}, Landroid/app/WallpaperManager;->semGetWallpaperType(II)I

    move-result v0

    iput v0, p0, Lcom/android/systemui/wallpaper/engines/image/ImageSource;->mWallpaperType:I

    invoke-virtual {p0, p1}, Lcom/android/systemui/wallpaper/engines/image/ImageSource;->updateSupplier(I)V

    return-void
.end method

.method public final putDownScaledSourceBitmap(ILcom/android/systemui/wallpaper/engines/image/ImageSource$WallpaperImage;)V
    .locals 12

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getAppContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p2, Lcom/android/systemui/wallpaper/engines/image/ImageSource$WallpaperImage;->mBitmap:Landroid/graphics/Bitmap;

    invoke-static {p1, v0}, Lcom/samsung/android/wallpaper/live/sdk/utils/DisplayUtils;->getDisplayStateByWhich(ILandroid/content/Context;)Lcom/samsung/android/wallpaper/live/sdk/utils/DisplayUtils$DisplayState;

    move-result-object v2

    const/4 v3, 0x0

    if-eqz v2, :cond_0

    iget v2, v2, Lcom/samsung/android/wallpaper/live/sdk/utils/DisplayUtils$DisplayState;->rotation:I

    goto :goto_0

    :cond_0
    move v2, v3

    :goto_0
    invoke-static {v0, p1, v2}, Lcom/samsung/android/wallpaper/live/sdk/utils/DisplayUtils;->getDisplaySize(Landroid/content/Context;II)Landroid/graphics/Point;

    move-result-object v0

    if-nez v0, :cond_1

    iget-object p0, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->TAG:Ljava/lang/String;

    const-string/jumbo p2, "putDownScaledSourceBitmap: failed to get display size. srcWhich="

    invoke-static {p1, p2, p0}, Lcom/android/keyguard/EmergencyButton$$ExternalSyntheticOutline0;->m(ILjava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    iget-object v2, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mDownScaledSourceBitmapManager:Lcom/android/systemui/wallpaper/engines/image/DownScaledSourceBitmapManager;

    iget-object p2, p2, Lcom/android/systemui/wallpaper/engines/image/ImageSource$WallpaperImage;->mCropRects:Ljava/util/ArrayList;

    iget-boolean v2, v2, Lcom/android/systemui/wallpaper/engines/image/DownScaledSourceBitmapManager;->mIsMemorySavingMode:Z

    const-string v4, "ImageWallpaper[DownScaledSourceBitmapManager]"

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getColorSpace()Landroid/graphics/ColorSpace;

    move-result-object v5

    const/4 v6, 0x0

    if-nez v5, :cond_2

    new-instance p2, Ljava/lang/StringBuilder;

    const-string/jumbo v0, "createDownScaledSourceBitmap: bitmap has no color space. org="

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v4, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_4

    :cond_2
    iget v5, v0, Landroid/graphics/Point;->x:I

    iget v0, v0, Landroid/graphics/Point;->y:I

    invoke-static {v5, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v7

    invoke-static {v5, v7}, Ljava/lang/Math;->min(II)I

    move-result v5

    if-eqz v2, :cond_3

    const/16 v7, 0x200

    goto :goto_1

    :cond_3
    int-to-float v7, v0

    const/high16 v8, 0x3f000000    # 0.5f

    mul-float/2addr v7, v8

    const/high16 v8, 0x44800000    # 1024.0f

    invoke-static {v8, v7}, Ljava/lang/Math;->max(FF)F

    move-result v7

    float-to-int v7, v7

    :goto_1
    int-to-float v8, v7

    int-to-float v9, v5

    div-float/2addr v8, v9

    const-string/jumbo v9, "createDownScaledSourceBitmap: longDisplay="

    const-string v10, ", shortBmpLen="

    const-string v11, ", resizedBitmapLen="

    invoke-static {v0, v5, v9, v10, v11}, Landroidx/appcompat/widget/SearchView$$ExternalSyntheticOutline0;->m(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v5, ", scale="

    const-string v9, ", saving="

    invoke-static {v8, v7, v5, v9, v0}, Landroidx/compose/ui/text/ParagraphInfo$$ExternalSyntheticOutline0;->m(FILjava/lang/String;Ljava/lang/String;Ljava/lang/StringBuilder;)V

    invoke-static {v0, v2, v4}, Landroidx/appcompat/widget/SearchView$$ExternalSyntheticOutline0;->m(Ljava/lang/StringBuilder;ZLjava/lang/String;)V

    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v0, v8, v0

    if-lez v0, :cond_4

    goto :goto_4

    :cond_4
    if-nez v0, :cond_5

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v0

    invoke-virtual {v1, v0, v3}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    move-result-object v0

    goto :goto_2

    :cond_5
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    int-to-float v0, v0

    mul-float/2addr v0, v8

    float-to-int v0, v0

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    int-to-float v2, v2

    mul-float/2addr v2, v8

    float-to-int v2, v2

    const/4 v3, 0x1

    invoke-static {v1, v0, v2, v3}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v0

    :goto_2
    if-eqz v0, :cond_7

    if-ne v0, v1, :cond_6

    goto :goto_3

    :cond_6
    new-instance v6, Lcom/android/systemui/wallpaper/engines/image/DownScaledSourceBitmapManager$Item;

    invoke-direct {v6, p1, v0, v8, p2}, Lcom/android/systemui/wallpaper/engines/image/DownScaledSourceBitmapManager$Item;-><init>(ILandroid/graphics/Bitmap;FLjava/util/ArrayList;)V

    goto :goto_4

    :cond_7
    :goto_3
    new-instance p2, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "createDownScaledSourceBitmap: Resized bitmap creation failed. org="

    invoke-direct {p2, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", resized="

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v4, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_4
    iget-object p0, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mDownScaledSourceBitmapManager:Lcom/android/systemui/wallpaper/engines/image/DownScaledSourceBitmapManager;

    invoke-virtual {p0, p1}, Lcom/android/systemui/wallpaper/engines/image/DownScaledSourceBitmapManager;->clear(I)V

    if-nez v6, :cond_8

    return-void

    :cond_8
    invoke-static {p1}, Lcom/android/systemui/wallpaper/utils/WhichChecker;->getSourceWhich(I)I

    move-result p1

    iget-object p2, p0, Lcom/android/systemui/wallpaper/engines/image/DownScaledSourceBitmapManager;->mSourceBitmapSet:Ljava/util/HashMap;

    monitor-enter p2

    :try_start_0
    iget-object p0, p0, Lcom/android/systemui/wallpaper/engines/image/DownScaledSourceBitmapManager;->mSourceBitmapSet:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, p1, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit p2

    return-void

    :catchall_0
    move-exception p0

    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public final requestDraw()V
    .locals 1

    iget-boolean v0, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mIsEngineAlive:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->mCallback:Lcom/android/systemui/wallpaper/engines/WallpaperEngineCallback;

    check-cast v0, Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine$2;

    iget-object v0, v0, Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine$2;->this$1:Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine;

    iget-object v0, v0, Lcom/android/systemui/wallpapers/ImageWallpaper$IntegratedEngine;->this$0:Lcom/android/systemui/wallpapers/ImageWallpaper;

    iget-object v0, v0, Lcom/android/systemui/wallpapers/ImageWallpaper;->mWorker:Landroid/os/HandlerThread;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getThreadHandler()Landroid/os/Handler;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_1
    return-void
.end method

.method public final run()V
    .locals 10

    iget-boolean v0, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mIsEngineAlive:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mSurfaceLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->isSurfaceCreated()Z

    move-result v1

    if-nez v1, :cond_1

    monitor-exit v0

    return-void

    :cond_1
    new-instance v6, Landroid/graphics/Rect;

    iget-object v1, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    invoke-interface {v1}, Landroid/view/SurfaceHolder;->getSurfaceFrame()Landroid/graphics/Rect;

    move-result-object v1

    invoke-direct {v6, v1}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    invoke-virtual {p0}, Lcom/android/systemui/wallpaper/engines/WallpaperEngine;->getSourceWhich()I

    move-result v0

    invoke-static {v0}, Lcom/android/systemui/wallpaper/utils/WhichChecker;->getSourceWhich(I)I

    move-result v0

    iget-object v1, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mDownScaledSourceBitmapManager:Lcom/android/systemui/wallpaper/engines/image/DownScaledSourceBitmapManager;

    iget-object v1, v1, Lcom/android/systemui/wallpaper/engines/image/DownScaledSourceBitmapManager;->mSourceBitmapSet:Ljava/util/HashMap;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/systemui/wallpaper/engines/image/DownScaledSourceBitmapManager$Item;

    if-eqz v0, :cond_2

    iget-object v1, p0, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->mLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    iget-object v7, v0, Lcom/android/systemui/wallpaper/engines/image/DownScaledSourceBitmapManager$Item;->mBitmap:Landroid/graphics/Bitmap;

    iget-object v8, v0, Lcom/android/systemui/wallpaper/engines/image/DownScaledSourceBitmapManager$Item;->mCropRects:Ljava/util/ArrayList;

    iget v9, v0, Lcom/android/systemui/wallpaper/engines/image/DownScaledSourceBitmapManager$Item;->mScale:F

    const/4 v3, 0x0

    move-object v2, p0

    invoke-virtual/range {v2 .. v9}, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->drawFrameOnCanvas(Landroid/graphics/Canvas;JLandroid/graphics/Rect;Landroid/graphics/Bitmap;Ljava/util/ArrayList;F)Lcom/android/systemui/wallpaper/engines/image/ImageEngine$DrawState;

    monitor-exit v1

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0

    :cond_2
    invoke-virtual {p0, v6}, Lcom/android/systemui/wallpaper/engines/image/ImageEngine;->drawFrameSynchronized(Landroid/graphics/Rect;)V

    return-void

    :catchall_1
    move-exception p0

    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw p0
.end method
