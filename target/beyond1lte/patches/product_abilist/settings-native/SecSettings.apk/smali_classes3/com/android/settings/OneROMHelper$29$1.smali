.class Lcom/android/settings/OneROMHelper$29$1;
.super Ljava/lang/Object;
.source "OneROMHelper.java"

# interfaces
.implements Lcom/android/settings/OneROMHelper$DialogCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/settings/OneROMHelper$29;->onPreferenceClick(Landroidx/preference/Preference;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$key:Ljava/lang/String;

.field final synthetic val$preference:Landroidx/preference/Preference;


# direct methods
.method constructor <init>(Lcom/android/settings/OneROMHelper$29;Landroid/content/Context;Ljava/lang/String;Landroidx/preference/Preference;)V
    .registers 5

    iput-object p2, p0, Lcom/android/settings/OneROMHelper$29$1;->val$context:Landroid/content/Context;

    iput-object p3, p0, Lcom/android/settings/OneROMHelper$29$1;->val$key:Ljava/lang/String;

    iput-object p4, p0, Lcom/android/settings/OneROMHelper$29$1;->val$preference:Landroidx/preference/Preference;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onValue(Ljava/lang/String;)V
    .registers 5

    iget-object v0, p0, Lcom/android/settings/OneROMHelper$29$1;->val$context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/android/settings/OneROMHelper$29$1;->val$key:Ljava/lang/String;

    invoke-static {v0, v1, p1}, Landroid/provider/Settings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    iget-object v0, p0, Lcom/android/settings/OneROMHelper$29$1;->val$preference:Landroidx/preference/Preference;

    invoke-virtual {v0, p1}, Landroidx/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/android/settings/OneROMHelper$29$1;->val$context:Landroid/content/Context;

    iget-object v1, p0, Lcom/android/settings/OneROMHelper$29$1;->val$key:Ljava/lang/String;

    invoke-static {v0, v1, p1}, Lcom/android/settings/OneROMHelper;->applyBixbyCustomization(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
