.class public Lcom/android/systemui/wallpaper/tilt/SequentialAnimator$AnimatedValue;
.super Ljava/lang/Object;
.source "SequentialAnimator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/wallpaper/tilt/SequentialAnimator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AnimatedValue"
.end annotation


# instance fields
.field currentValue:F

.field delta:F

.field name:Ljava/lang/String;

.field startValue:F

.field targetValue:F


# direct methods
.method public constructor <init>(F)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/systemui/wallpaper/tilt/SequentialAnimator$AnimatedValue;->currentValue:F

    iput v0, p0, Lcom/android/systemui/wallpaper/tilt/SequentialAnimator$AnimatedValue;->startValue:F

    iput v0, p0, Lcom/android/systemui/wallpaper/tilt/SequentialAnimator$AnimatedValue;->targetValue:F

    iput v0, p0, Lcom/android/systemui/wallpaper/tilt/SequentialAnimator$AnimatedValue;->delta:F

    iput p1, p0, Lcom/android/systemui/wallpaper/tilt/SequentialAnimator$AnimatedValue;->currentValue:F

    return-void
.end method

.method public constructor <init>(FLjava/lang/String;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/systemui/wallpaper/tilt/SequentialAnimator$AnimatedValue;->currentValue:F

    iput v0, p0, Lcom/android/systemui/wallpaper/tilt/SequentialAnimator$AnimatedValue;->startValue:F

    iput v0, p0, Lcom/android/systemui/wallpaper/tilt/SequentialAnimator$AnimatedValue;->targetValue:F

    iput v0, p0, Lcom/android/systemui/wallpaper/tilt/SequentialAnimator$AnimatedValue;->delta:F

    iput p1, p0, Lcom/android/systemui/wallpaper/tilt/SequentialAnimator$AnimatedValue;->currentValue:F

    iput-object p2, p0, Lcom/android/systemui/wallpaper/tilt/SequentialAnimator$AnimatedValue;->name:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method calculateValue(F)V
    .locals 2

    iget v0, p0, Lcom/android/systemui/wallpaper/tilt/SequentialAnimator$AnimatedValue;->startValue:F

    iget v1, p0, Lcom/android/systemui/wallpaper/tilt/SequentialAnimator$AnimatedValue;->delta:F

    mul-float/2addr v1, p1

    add-float/2addr v0, v1

    iput v0, p0, Lcom/android/systemui/wallpaper/tilt/SequentialAnimator$AnimatedValue;->currentValue:F

    return-void
.end method

.method public get()F
    .locals 0

    iget p0, p0, Lcom/android/systemui/wallpaper/tilt/SequentialAnimator$AnimatedValue;->currentValue:F

    return p0
.end method

.method public set(F)V
    .locals 0

    iput p1, p0, Lcom/android/systemui/wallpaper/tilt/SequentialAnimator$AnimatedValue;->currentValue:F

    invoke-virtual {p0, p1}, Lcom/android/systemui/wallpaper/tilt/SequentialAnimator$AnimatedValue;->setTarget(F)V

    return-void
.end method

.method public setTarget(F)V
    .locals 1

    iput p1, p0, Lcom/android/systemui/wallpaper/tilt/SequentialAnimator$AnimatedValue;->targetValue:F

    iget v0, p0, Lcom/android/systemui/wallpaper/tilt/SequentialAnimator$AnimatedValue;->currentValue:F

    iput v0, p0, Lcom/android/systemui/wallpaper/tilt/SequentialAnimator$AnimatedValue;->startValue:F

    sub-float/2addr p1, v0

    iput p1, p0, Lcom/android/systemui/wallpaper/tilt/SequentialAnimator$AnimatedValue;->delta:F

    return-void
.end method
