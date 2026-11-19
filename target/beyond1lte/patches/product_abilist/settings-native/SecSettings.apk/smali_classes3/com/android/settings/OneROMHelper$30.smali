.class Lcom/android/settings/OneROMHelper$30;
.super Ljava/lang/Object;
.source "OneROMHelper.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/settings/OneROMHelper;->showTextEditDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/android/settings/OneROMHelper$DialogCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$callback:Lcom/android/settings/OneROMHelper$DialogCallback;

.field final synthetic val$input:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/android/settings/OneROMHelper$DialogCallback;Landroid/widget/EditText;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 731
    iput-object p1, p0, Lcom/android/settings/OneROMHelper$30;->val$callback:Lcom/android/settings/OneROMHelper$DialogCallback;

    iput-object p2, p0, Lcom/android/settings/OneROMHelper$30;->val$input:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 3

    .line 734
    iget-object p1, p0, Lcom/android/settings/OneROMHelper$30;->val$callback:Lcom/android/settings/OneROMHelper$DialogCallback;

    if-eqz p1, :cond_13

    .line 735
    iget-object p1, p0, Lcom/android/settings/OneROMHelper$30;->val$callback:Lcom/android/settings/OneROMHelper$DialogCallback;

    iget-object p2, p0, Lcom/android/settings/OneROMHelper$30;->val$input:Landroid/widget/EditText;

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, p2}, Lcom/android/settings/OneROMHelper$DialogCallback;->onValue(Ljava/lang/String;)V

    .line 737
    :cond_13
    return-void
.end method
