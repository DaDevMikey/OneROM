.class Lcom/android/settings/OneROMHelper$21;
.super Ljava/lang/Object;
.source "OneROMHelper.java"

# interfaces
.implements Landroidx/preference/Preference$OnPreferenceClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/settings/OneROMHelper;->buildUIScreen(Landroidx/preference/PreferenceFragmentCompat;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 493
    iput-object p1, p0, Lcom/android/settings/OneROMHelper$21;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreferenceClick(Landroidx/preference/Preference;)Z
    .registers 6

    .line 496
    iget-object v0, p0, Lcom/android/settings/OneROMHelper$21;->val$context:Landroid/content/Context;

    iget-object v1, p0, Lcom/android/settings/OneROMHelper$21;->val$context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "onerom_custom_banner"

    invoke-static {v1, v2}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/android/settings/OneROMHelper$21$1;

    iget-object v3, p0, Lcom/android/settings/OneROMHelper$21;->val$context:Landroid/content/Context;

    invoke-direct {v2, p0, v3, p1}, Lcom/android/settings/OneROMHelper$21$1;-><init>(Lcom/android/settings/OneROMHelper$21;Landroid/content/Context;Landroidx/preference/Preference;)V

    const-string p1, "Custom Banner Text"

    invoke-static {v0, p1, v1, v2}, Lcom/android/settings/OneROMHelper;->-$$Nest$smshowTextEditDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/android/settings/OneROMHelper$DialogCallback;)V

    .line 503
    const/4 p1, 0x1

    return p1
.end method
