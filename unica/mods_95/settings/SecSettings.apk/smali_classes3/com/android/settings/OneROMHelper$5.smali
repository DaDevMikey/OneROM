.class Lcom/android/settings/OneROMHelper$5;
.super Ljava/lang/Object;
.source "OneROMHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/settings/OneROMHelper;->buildSoftwareInfoScreen(Landroidx/preference/PreferenceFragmentCompat;)V
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

    .line 248
    iput-object p1, p0, Lcom/android/settings/OneROMHelper$5;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 251
    iget-object v0, p0, Lcom/android/settings/OneROMHelper$5;->val$context:Landroid/content/Context;

    const-string v1, "io.mesalabs.unica.settings.UnicaSettingsFragment"

    const-string v2, "OneROM Zeta 9.5"

    invoke-static {v0, v1, v2}, Lcom/android/settings/OneROMHelper;->openSubSettings(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 252
    return-void
.end method
