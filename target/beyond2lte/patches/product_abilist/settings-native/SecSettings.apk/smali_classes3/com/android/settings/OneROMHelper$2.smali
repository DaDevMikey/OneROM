.class Lcom/android/settings/OneROMHelper$2;
.super Ljava/lang/Object;
.source "OneROMHelper.java"

# interfaces
.implements Landroidx/preference/Preference$OnPreferenceChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/settings/OneROMHelper;->addSwitch(Landroidx/preference/PreferenceGroup;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Landroidx/preference/SecSwitchPreference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$key:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/android/settings/OneROMHelper$2;->val$context:Landroid/content/Context;

    iput-object p2, p0, Lcom/android/settings/OneROMHelper$2;->val$key:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreferenceChange(Landroidx/preference/Preference;Ljava/lang/Object;)Z
    .registers 6

    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p1, p2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result p1

    iget-object p2, p0, Lcom/android/settings/OneROMHelper$2;->val$context:Landroid/content/Context;

    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p2

    iget-object v0, p0, Lcom/android/settings/OneROMHelper$2;->val$key:Ljava/lang/String;

    invoke-static {p2, v0, p1}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    const-string p2, "onerom_vulkan"

    iget-object v0, p0, Lcom/android/settings/OneROMHelper$2;->val$key:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_check_unica_vk

    const-string p2, "unica_vulkan"

    iget-object v0, p0, Lcom/android/settings/OneROMHelper$2;->val$key:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_done

    :cond_check_unica_vk
    if-eqz p1, :set_vk_off

    const-string p2, "true"

    const-string v0, "skiavk"

    goto :apply_vk_prop

    :set_vk_off
    const-string p2, "false"

    const-string v0, "skiagl"

    :apply_vk_prop
    const-string v1, "persist.sys.unica.vulkan"

    invoke-static {v1, p2}, Landroid/os/SemSystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    const-string p2, "debug.hwui.renderer"

    invoke-static {p2, v0}, Landroid/os/SemSystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_dialog
    iget-object p2, p0, Lcom/android/settings/OneROMHelper$2;->val$context:Landroid/content/Context;

    invoke-static {p2}, Lio/mesalabs/unica/utils/Utils;->createRebootDialog(Landroid/content/Context;)Landroidx/appcompat/app/AlertDialog;

    move-result-object p2

    if-eqz p2, :cond_done

    invoke-virtual {p2}, Landroid/app/Dialog;->show()V
    :try_end_dialog
    .catch Ljava/lang/Throwable; {:try_start_dialog .. :try_end_dialog} :cond_done

    :cond_done
    const/4 p1, 0x1

    return p1
.end method
