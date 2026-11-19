.class Lcom/android/settings/OneROMHelper$21$1;
.super Ljava/lang/Object;
.source "OneROMHelper.java"

# interfaces
.implements Lcom/android/settings/OneROMHelper$DialogCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/settings/OneROMHelper$21;->onPreferenceClick(Landroidx/preference/Preference;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$preference:Landroidx/preference/Preference;


# direct methods
.method constructor <init>(Lcom/android/settings/OneROMHelper$21;Landroid/content/Context;Landroidx/preference/Preference;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 496
    iput-object p2, p0, Lcom/android/settings/OneROMHelper$21$1;->val$context:Landroid/content/Context;

    iput-object p3, p0, Lcom/android/settings/OneROMHelper$21$1;->val$preference:Landroidx/preference/Preference;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onValue(Ljava/lang/String;)V
    .registers 4

    .line 499
    iget-object v0, p0, Lcom/android/settings/OneROMHelper$21$1;->val$context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "onerom_custom_banner"

    invoke-static {v0, v1, p1}, Landroid/provider/Settings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 500
    iget-object v0, p0, Lcom/android/settings/OneROMHelper$21$1;->val$preference:Landroidx/preference/Preference;

    invoke-virtual {v0, p1}, Landroidx/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 501
    return-void
.end method
