.class Lcom/android/settings/OneROMHelper$22$1;
.super Ljava/lang/Object;
.source "OneROMHelper.java"

# interfaces
.implements Lcom/android/settings/OneROMHelper$DialogCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/settings/OneROMHelper$22;->onPreferenceClick(Landroidx/preference/Preference;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$preference:Landroidx/preference/Preference;


# direct methods
.method constructor <init>(Lcom/android/settings/OneROMHelper$22;Landroid/content/Context;Landroidx/preference/Preference;)V
    .registers 4

    iput-object p2, p0, Lcom/android/settings/OneROMHelper$22$1;->val$context:Landroid/content/Context;

    iput-object p3, p0, Lcom/android/settings/OneROMHelper$22$1;->val$preference:Landroidx/preference/Preference;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onValue(Ljava/lang/String;)V
    .registers 5

    iget-object v0, p0, Lcom/android/settings/OneROMHelper$22$1;->val$context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "unica_launcher_anim_type"

    invoke-static {v0, v1, p1}, Landroid/provider/Settings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    iget-object v0, p0, Lcom/android/settings/OneROMHelper$22$1;->val$preference:Landroidx/preference/Preference;

    invoke-virtual {v0, p1}, Landroidx/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    const-string v0, "Flagship"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_check_mass

    const-string v0, "0"

    goto :set_prop

    :cond_check_mass
    const-string v0, "Mass"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_check_budget

    const-string v0, "1"

    goto :set_prop

    :cond_check_budget
    const-string v0, "Budget"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_check_lowest

    const-string v0, "2"

    goto :set_prop

    :cond_check_lowest
    const-string v0, "3"

    :set_prop
    const-string v1, "persist.sys.unica.launcher_anim_type"

    invoke-static {v1, v0}, Landroid/os/SemSystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_kill
    iget-object v0, p0, Lcom/android/settings/OneROMHelper$22$1;->val$context:Landroid/content/Context;

    const-string v1, "activity"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    if-eqz v0, :catch_kill

    const-string v1, "com.sec.android.app.launcher"

    invoke-virtual {v0, v1}, Landroid/app/ActivityManager;->forceStopPackage(Ljava/lang/String;)V
    :try_end_kill
    .catch Ljava/lang/Throwable; {:try_start_kill .. :try_end_kill} :catch_kill

    :catch_kill
    return-void
.end method
