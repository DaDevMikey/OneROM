.class public Lcom/android/settings/OneROMHelper$RebootCallback;
.super Ljava/lang/Object;
.source "OneROMHelper.java"

# interfaces
.implements Lcom/android/settings/OneROMHelper$DialogCallback;

.field final val$context:Landroid/content/Context;

.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/android/settings/OneROMHelper$RebootCallback;->val$context:Landroid/content/Context;
    return-void
.end method

.method public onValue(Ljava/lang/String;)V
    .registers 4
    if-nez p1, :cond_0
    return-void

    :cond_0
    const-string v0, "Recovery"
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :cond_rec
    iget-object p0, p0, Lcom/android/settings/OneROMHelper$RebootCallback;->val$context:Landroid/content/Context;
    const-string v0, "recovery"
    invoke-static {p0, v0}, Lcom/android/settings/OneROMHelper;->-$$Nest$smrebootDevice(Landroid/content/Context;Ljava/lang/String;)V
    return-void

    :cond_rec
    const-string v0, "Download"
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :cond_dl
    iget-object p0, p0, Lcom/android/settings/OneROMHelper$RebootCallback;->val$context:Landroid/content/Context;
    const-string v0, "download"
    invoke-static {p0, v0}, Lcom/android/settings/OneROMHelper;->-$$Nest$smrebootDevice(Landroid/content/Context;Ljava/lang/String;)V
    return-void

    :cond_dl
    const-string v0, "Quick Reboot"
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :cond_quick
    iget-object p0, p0, Lcom/android/settings/OneROMHelper$RebootCallback;->val$context:Landroid/content/Context;
    const-string v0, "userspace"
    invoke-static {p0, v0}, Lcom/android/settings/OneROMHelper;->-$$Nest$smrebootDevice(Landroid/content/Context;Ljava/lang/String;)V
    return-void

    :cond_quick
    iget-object p0, p0, Lcom/android/settings/OneROMHelper$RebootCallback;->val$context:Landroid/content/Context;
    const/4 v0, 0x0
    invoke-static {p0, v0}, Lcom/android/settings/OneROMHelper;->-$$Nest$smrebootDevice(Landroid/content/Context;Ljava/lang/String;)V
    return-void
.end method
