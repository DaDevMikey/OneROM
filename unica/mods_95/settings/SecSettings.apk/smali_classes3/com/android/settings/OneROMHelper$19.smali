.class Lcom/android/settings/OneROMHelper$19;
.super Ljava/lang/Object;
.source "OneROMHelper.java"

# interfaces
.implements Landroidx/preference/Preference$OnPreferenceClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/settings/OneROMHelper;->buildUnicaScreen(Landroidx/preference/PreferenceFragmentCompat;)V
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

    .line 448
    iput-object p1, p0, Lcom/android/settings/OneROMHelper$19;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreferenceClick(Landroidx/preference/Preference;)Z
    .registers 4

    .line 451
    iget-object p1, p0, Lcom/android/settings/OneROMHelper$19;->val$context:Landroid/content/Context;

    const-string v0, "io.mesalabs.unica.settings.extra.ExtraSettingsFragment"

    const-string v1, "Extra options"

    invoke-static {p1, v0, v1}, Lcom/android/settings/OneROMHelper;->openSubSettings(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 452
    const/4 p1, 0x1

    return p1
.end method
