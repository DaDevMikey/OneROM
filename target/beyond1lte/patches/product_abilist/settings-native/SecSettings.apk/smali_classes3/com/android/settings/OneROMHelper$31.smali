.class Lcom/android/settings/OneROMHelper$31;
.super Ljava/lang/Object;
.source "OneROMHelper.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/settings/OneROMHelper;->showChoiceDialog(Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;Lcom/android/settings/OneROMHelper$DialogCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$callback:Lcom/android/settings/OneROMHelper$DialogCallback;

.field final synthetic val$choices:[Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/android/settings/OneROMHelper$DialogCallback;[Ljava/lang/String;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 746
    iput-object p1, p0, Lcom/android/settings/OneROMHelper$31;->val$callback:Lcom/android/settings/OneROMHelper$DialogCallback;

    iput-object p2, p0, Lcom/android/settings/OneROMHelper$31;->val$choices:[Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 4

    .line 749
    iget-object p1, p0, Lcom/android/settings/OneROMHelper$31;->val$callback:Lcom/android/settings/OneROMHelper$DialogCallback;

    if-eqz p1, :cond_14

    if-ltz p2, :cond_14

    iget-object p1, p0, Lcom/android/settings/OneROMHelper$31;->val$choices:[Ljava/lang/String;

    array-length p1, p1

    if-ge p2, p1, :cond_14

    .line 750
    iget-object p1, p0, Lcom/android/settings/OneROMHelper$31;->val$callback:Lcom/android/settings/OneROMHelper$DialogCallback;

    iget-object v0, p0, Lcom/android/settings/OneROMHelper$31;->val$choices:[Ljava/lang/String;

    aget-object p2, v0, p2

    invoke-interface {p1, p2}, Lcom/android/settings/OneROMHelper$DialogCallback;->onValue(Ljava/lang/String;)V

    .line 752
    :cond_14
    return-void
.end method
