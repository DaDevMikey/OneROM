.class Lio/mesalabs/unica/settings/SoftwareInfoBannerPreferenceController$1;
.super Ljava/lang/Object;
.source "SoftwareInfoBannerPreferenceController.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/mesalabs/unica/settings/SoftwareInfoBannerPreferenceController;->displayPreference(Landroidx/preference/PreferenceScreen;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/mesalabs/unica/settings/SoftwareInfoBannerPreferenceController;


# direct methods
.method constructor <init>(Lio/mesalabs/unica/settings/SoftwareInfoBannerPreferenceController;)V
    .locals 0

    iput-object p1, p0, Lio/mesalabs/unica/settings/SoftwareInfoBannerPreferenceController$1;->this$0:Lio/mesalabs/unica/settings/SoftwareInfoBannerPreferenceController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    iget-object p0, p0, Lio/mesalabs/unica/settings/SoftwareInfoBannerPreferenceController$1;->this$0:Lio/mesalabs/unica/settings/SoftwareInfoBannerPreferenceController;

    iget-object p0, p0, Lcom/android/settingslib/core/AbstractPreferenceController;->mContext:Landroid/content/Context;

    if-eqz p0, :cond_0

    const-string p1, "io.mesalabs.unica.settings.UnicaSettingsFragment"

    const-string v0, "OneROM Zeta 9.5"

    invoke-static {p0, p1, v0}, Lcom/android/settings/OneROMHelper;->openSubSettings(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method
