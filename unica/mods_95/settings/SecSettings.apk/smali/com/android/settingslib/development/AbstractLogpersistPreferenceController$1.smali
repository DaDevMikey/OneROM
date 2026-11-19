.class public final Lcom/android/settingslib/development/AbstractLogpersistPreferenceController$1;
.super Landroid/content/BroadcastReceiver;
.source "qb/117478588 ef68672984e5a659a7e5edd478bafa64e2bea021b15a07cfabf98fde6e4913cf"


# instance fields
.field public final synthetic this$0:Lcom/android/settings/development/LogPersistPreferenceController;


# direct methods
.method public constructor <init>(Lcom/android/settings/development/LogPersistPreferenceController;)V
    .locals 0

    iput-object p1, p0, Lcom/android/settingslib/development/AbstractLogpersistPreferenceController$1;->this$0:Lcom/android/settings/development/LogPersistPreferenceController;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    const-string p1, "CURRENT_LOGD_VALUE"

    invoke-virtual {p2, p1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iget-object p0, p0, Lcom/android/settingslib/development/AbstractLogpersistPreferenceController$1;->this$0:Lcom/android/settings/development/LogPersistPreferenceController;

    invoke-virtual {p0, p1}, Lcom/android/settingslib/development/AbstractLogpersistPreferenceController;->onLogdSizeSettingUpdate(Ljava/lang/String;)V

    return-void
.end method
