
.method public onBootSoundChanged(Landroid/view/View;)V
    .locals 2

    check-cast p1, Landroid/widget/CompoundButton;
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->isChecked()Z
    move-result p1
    const-string v0, "persist.sys.unica.bootsound"
    invoke-static {p1}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;
    move-result-object p1
    invoke-static {v0, p1}, Landroid/os/SemSystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V
    return-void
.end method

.method public onMaxRefreshRateChanged(Landroid/view/View;)V
    .locals 3

    check-cast p1, Landroid/widget/CompoundButton;
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->isChecked()Z
    move-result p1
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;
    move-result-object p0
    if-eqz p1, :refresh_off
    const-string p1, "ro.surface_flinger.default_refresh_rate"
    const/16 v0, 0x3c
    invoke-static {p1, v0}, Landroid/os/SemSystemProperties;->getInt(Ljava/lang/String;I)I
    move-result p1
    int-to-float p1, p1
    goto :write_refresh
    :refresh_off
    const/4 p1, 0x0
    :write_refresh
    const-string v0, "min_refresh_rate"
    invoke-static {p0, v0, p1}, Landroid/provider/Settings$System;->putFloat(Landroid/content/ContentResolver;Ljava/lang/String;F)Z
    return-void
.end method

.method public onImeiVisibilityChanged(Landroid/view/View;)V
    .locals 2

    check-cast p1, Landroid/widget/CompoundButton;
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->isChecked()Z
    move-result p1
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;
    move-result-object p0
    const-string v0, "onerom_show_imei"
    invoke-static {p0, v0, p1}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z
    return-void
.end method

.method public onSerialVisibilityChanged(Landroid/view/View;)V
    .locals 2

    check-cast p1, Landroid/widget/CompoundButton;
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->isChecked()Z
    move-result p1
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;
    move-result-object p0
    const-string v0, "onerom_show_serial"
    invoke-static {p0, v0, p1}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z
    return-void
.end method

.method private applyBixbyAction(Ljava/lang/String;I)V
    .locals 8

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;
    move-result-object v0
    const-string v1, "xcover_top_key_on_lockscreen"
    const/4 v2, 0x1
    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    const-string v0, "none"
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :check_camera
    new-instance v3, Landroid/content/Intent;
    invoke-direct {v3}, Landroid/content/Intent;-><init>()V
    const/4 v4, 0x4
    goto :install

    :check_camera
    const-string v0, "camera"
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :check_torch
    new-instance v3, Landroid/content/Intent;
    const-string v0, "android.media.action.STILL_IMAGE_CAMERA"
    invoke-direct {v3, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V
    const/4 v4, 0x1
    goto :install

    :check_torch
    const-string v0, "torch"
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :voice
    new-instance v3, Landroid/content/Intent;
    invoke-direct {v3}, Landroid/content/Intent;-><init>()V
    const-string v0, "torch/torch"
    invoke-static {v0}, Landroid/content/ComponentName;->unflattenFromString(Ljava/lang/String;)Landroid/content/ComponentName;
    move-result-object v0
    invoke-virtual {v3, v0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;
    const/4 v4, 0x0
    goto :install

    :voice
    new-instance v3, Landroid/content/Intent;
    const-string v0, "android.intent.action.VOICE_ASSIST"
    invoke-direct {v3, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V
    const/4 v4, 0x1

    :install
    :try_start
    move v6, v4
    move-object v7, v3
    new-instance v0, Lcom/samsung/android/view/SemWindowManager$KeyCustomizationInfo;
    move v1, p2
    const/16 v2, 0x44f
    const/16 v3, 0x437
    move v4, v6
    move-object v5, v7
    invoke-direct/range {v0 .. v5}, Lcom/samsung/android/view/SemWindowManager$KeyCustomizationInfo;-><init>(IIIILandroid/content/Intent;)V
    invoke-static {}, Landroid/view/WindowManagerGlobal;->getWindowManagerService()Landroid/view/IWindowManager;
    move-result-object v1
    invoke-interface {v1, v0}, Landroid/view/IWindowManager;->putKeyCustomizationInfo(Lcom/samsung/android/view/SemWindowManager$KeyCustomizationInfo;)V
    :try_end
    .catch Landroid/os/RemoteException; {:try_start .. :try_end} :catch
    .catch Ljava/lang/IllegalArgumentException; {:try_start .. :try_end} :catch
    return-void

    :catch
    move-exception v0
    const-string v1, "OneROMBixbySetup"
    const-string v2, "Unable to register key customization"
    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    return-void
.end method

.method private cycleBixbyAction(Ljava/lang/String;ILandroid/widget/Button;)V
    .locals 4

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;
    move-result-object v0
    invoke-static {v0, p1}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    if-nez v1, :value_ready
    const-string v1, "voice"

    :value_ready
    const-string v2, "voice"
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :check_camera
    const-string v1, "camera"
    const-string v2, "Camera"
    goto :save

    :check_camera
    const-string v2, "camera"
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :check_torch
    const-string v1, "torch"
    const-string v2, "Flashlight"
    goto :save

    :check_torch
    const-string v2, "torch"
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :voice
    const-string v1, "none"
    const-string v2, "No action"
    goto :save

    :voice
    const-string v1, "voice"
    const-string v2, "Voice assistant"

    :save
    invoke-static {v0, p1, v1}, Landroid/provider/Settings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z
    invoke-virtual {p3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    invoke-direct {p0, v1, p2}, Lcom/sec/android/app/SecSetupWizard/UI/DisclaimerActivity;->applyBixbyAction(Ljava/lang/String;I)V
    return-void
.end method

.method public onBixbySingleActionChanged(Landroid/view/View;)V
    .locals 2
    check-cast p1, Landroid/widget/Button;
    const-string v0, "onerom_bixby_single_action"
    const/4 v1, 0x3
    invoke-direct {p0, v0, v1, p1}, Lcom/sec/android/app/SecSetupWizard/UI/DisclaimerActivity;->cycleBixbyAction(Ljava/lang/String;ILandroid/widget/Button;)V
    return-void
.end method

.method public onBixbyDoubleActionChanged(Landroid/view/View;)V
    .locals 2
    check-cast p1, Landroid/widget/Button;
    const-string v0, "onerom_bixby_double_action"
    const/16 v1, 0x8
    invoke-direct {p0, v0, v1, p1}, Lcom/sec/android/app/SecSetupWizard/UI/DisclaimerActivity;->cycleBixbyAction(Ljava/lang/String;ILandroid/widget/Button;)V
    return-void
.end method

.method public onBixbyHoldActionChanged(Landroid/view/View;)V
    .locals 2
    check-cast p1, Landroid/widget/Button;
    const-string v0, "onerom_bixby_hold_action"
    const/4 v1, 0x4
    invoke-direct {p0, v0, v1, p1}, Lcom/sec/android/app/SecSetupWizard/UI/DisclaimerActivity;->cycleBixbyAction(Ljava/lang/String;ILandroid/widget/Button;)V
    return-void
.end method

.method protected onResume()V
    .locals 4

    invoke-super {p0}, Landroid/app/Activity;->onResume()V
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;
    move-result-object v0

    const-string v1, "onerom_bixby_single_action"
    invoke-static {v0, v1}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    if-nez v2, :single_ready
    const-string v2, "voice"
    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z
    :single_ready
    const/4 v3, 0x3
    invoke-direct {p0, v2, v3}, Lcom/sec/android/app/SecSetupWizard/UI/DisclaimerActivity;->applyBixbyAction(Ljava/lang/String;I)V

    const-string v1, "onerom_bixby_double_action"
    invoke-static {v0, v1}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    if-nez v2, :double_ready
    const-string v2, "voice"
    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z
    :double_ready
    const/16 v3, 0x8
    invoke-direct {p0, v2, v3}, Lcom/sec/android/app/SecSetupWizard/UI/DisclaimerActivity;->applyBixbyAction(Ljava/lang/String;I)V

    const-string v1, "onerom_bixby_hold_action"
    invoke-static {v0, v1}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    if-nez v2, :hold_ready
    const-string v2, "voice"
    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z
    :hold_ready
    const/4 v3, 0x4
    invoke-direct {p0, v2, v3}, Lcom/sec/android/app/SecSetupWizard/UI/DisclaimerActivity;->applyBixbyAction(Ljava/lang/String;I)V
    return-void
.end method