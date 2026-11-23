.class public Lcom/samsung/android/settings/nfc/NfcAntennaGuideDialog;
.super Landroid/app/Activity;
.source "qb/117478588 ef68672984e5a659a7e5edd478bafa64e2bea021b15a07cfabf98fde6e4913cf"


# instance fields
.field public device_jpn_model:Landroid/widget/ImageView;

.field public jpnAnimation:Lcom/airbnb/lottie/LottieAnimationView;

.field public nfcDialogImage:Lcom/airbnb/lottie/LottieAnimationView;

.field public nfcJpnAntennaAnimationHelper:Lcom/samsung/android/settings/nfc/NfcJpnAntennaAnimationHelper;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1

    invoke-super {p0, p1}, Landroid/app/Activity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget p1, p1, Landroid/content/res/Configuration;->orientation:I

    const/4 v0, 0x2

    if-ne p1, v0, :cond_0

    const p1, 0x7f160329

    invoke-virtual {p0, p1}, Landroid/app/Activity;->setTheme(I)V

    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->recreate()V

    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .locals 4

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    invoke-static {p0}, Landroid/nfc/NfcAdapter;->getDefaultAdapter(Landroid/content/Context;)Landroid/nfc/NfcAdapter;

    move-result-object p1

    const-string/jumbo v0, "NfcAntennaGuideDialog"

    if-nez p1, :cond_0

    const-string/jumbo p1, "NFC Adapter is unavailable"

    invoke-static {v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void

    :cond_0
    const-string/jumbo p1, "Show NFC antenna position guide dialog from Tile"

    invoke-static {v0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/16 v1, 0x50

    invoke-virtual {p1, v1}, Landroid/view/Window;->setGravity(I)V

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/4 v1, -0x2

    const/4 v2, -0x1

    invoke-virtual {p1, v2, v1}, Landroid/view/Window;->setLayout(II)V

    const p1, 0x7f0e0477

    invoke-virtual {p0, p1}, Landroid/app/Activity;->setContentView(I)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/app/Activity;->setFinishOnTouchOutside(Z)V

    new-instance v1, Lcom/samsung/android/settings/nfc/NfcJpnAntennaAnimationHelper;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v1, v3}, Lcom/samsung/android/settings/nfc/NfcJpnAntennaAnimationHelper;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/samsung/android/settings/nfc/NfcAntennaGuideDialog;->nfcJpnAntennaAnimationHelper:Lcom/samsung/android/settings/nfc/NfcJpnAntennaAnimationHelper;

    const v1, 0x7f0b0b4d

    invoke-virtual {p0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/airbnb/lottie/LottieAnimationView;

    iput-object v1, p0, Lcom/samsung/android/settings/nfc/NfcAntennaGuideDialog;->nfcDialogImage:Lcom/airbnb/lottie/LottieAnimationView;

    const v1, 0x7f0b0596

    invoke-virtual {p0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/samsung/android/settings/nfc/NfcAntennaGuideDialog;->device_jpn_model:Landroid/widget/ImageView;

    const v1, 0x7f0b06f3

    invoke-virtual {p0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/airbnb/lottie/LottieAnimationView;

    iput-object v1, p0, Lcom/samsung/android/settings/nfc/NfcAntennaGuideDialog;->jpnAnimation:Lcom/airbnb/lottie/LottieAnimationView;

    const v1, 0x7f0b15ca

    invoke-virtual {p0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    const v3, 0x7f1521fe

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(I)V

    iget-object v1, p0, Lcom/samsung/android/settings/nfc/NfcAntennaGuideDialog;->nfcJpnAntennaAnimationHelper:Lcom/samsung/android/settings/nfc/NfcJpnAntennaAnimationHelper;

    invoke-virtual {v1}, Lcom/samsung/android/settings/nfc/NfcJpnAntennaAnimationHelper;->isJpnModel()Z

    move-result v1

    if-nez v1, :cond_2

    const-string/jumbo v1, "ro.vendor.nfc.info.antpos"

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v1

    const-string/jumbo v3, "NfcAntSpf - 29 NfcAntProp "

    invoke-static {v1, v3, v0}, Landroidx/appcompat/widget/SeslTipPopup$$ExternalSyntheticOutline0;->m(ILjava/lang/String;Ljava/lang/String;)V

    if-eq v1, v2, :cond_2

    const/16 v2, 0x1d

    goto :goto_0

    goto :goto_0

    :cond_1
    const-string/jumbo p0, "SEC_PRODUCT_FEATURE_NFC_CONFIG_ANTENNA_POSITION Value=29 must be equal to value of ro.vendor.nfc.info.antpos="

    invoke-static {v1, p0}, Landroidx/appcompat/util/SeslRoundedCorner$$ExternalSyntheticOutline0;->m(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lokio/Buffer$$ExternalSyntheticBUOutline0;->m(Ljava/lang/String;)V

    return-void

    :cond_2
    :goto_0
    invoke-static {}, Lcom/samsung/android/settings/nfc/NfcAntennaInfo;->values()[Lcom/samsung/android/settings/nfc/NfcAntennaInfo;

    move-result-object v1

    aget-object v1, v1, p1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Antenna Position : "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/samsung/android/settings/nfc/NfcAntennaGuideDialog;->nfcJpnAntennaAnimationHelper:Lcom/samsung/android/settings/nfc/NfcJpnAntennaAnimationHelper;

    invoke-virtual {v0}, Lcom/samsung/android/settings/nfc/NfcJpnAntennaAnimationHelper;->isJpnModel()Z

    move-result v0

    iget-object v2, p0, Lcom/samsung/android/settings/nfc/NfcAntennaGuideDialog;->jpnAnimation:Lcom/airbnb/lottie/LottieAnimationView;

    const/16 v3, 0x8

    if-eqz v0, :cond_3

    invoke-virtual {v2, p1}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object v0, p0, Lcom/samsung/android/settings/nfc/NfcAntennaGuideDialog;->nfcDialogImage:Lcom/airbnb/lottie/LottieAnimationView;

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object v0, p0, Lcom/samsung/android/settings/nfc/NfcAntennaGuideDialog;->device_jpn_model:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object p1, p0, Lcom/samsung/android/settings/nfc/NfcAntennaGuideDialog;->jpnAnimation:Lcom/airbnb/lottie/LottieAnimationView;

    new-instance v0, Lcom/samsung/android/settings/nfc/NfcAntennaGuideDialog$2;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object p0, v0, Lcom/samsung/android/settings/nfc/NfcAntennaGuideDialog$2;->this$0:Lcom/samsung/android/settings/nfc/NfcAntennaGuideDialog;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->post(Ljava/lang/Runnable;)Z

    goto :goto_1

    :cond_3
    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object v0, p0, Lcom/samsung/android/settings/nfc/NfcAntennaGuideDialog;->device_jpn_model:Landroid/widget/ImageView;

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object v0, p0, Lcom/samsung/android/settings/nfc/NfcAntennaGuideDialog;->nfcDialogImage:Lcom/airbnb/lottie/LottieAnimationView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object p1, p0, Lcom/samsung/android/settings/nfc/NfcAntennaGuideDialog;->nfcDialogImage:Lcom/airbnb/lottie/LottieAnimationView;

    iget v0, v1, Lcom/samsung/android/settings/nfc/NfcAntennaInfo;->animationJSONValue:I

    invoke-virtual {p1, v0}, Lcom/airbnb/lottie/LottieAnimationView;->setAnimation(I)V

    iget-object p1, p0, Lcom/samsung/android/settings/nfc/NfcAntennaGuideDialog;->nfcDialogImage:Lcom/airbnb/lottie/LottieAnimationView;

    invoke-virtual {p1}, Lcom/airbnb/lottie/LottieAnimationView;->playAnimation$1()V

    :goto_1
    const p1, 0x7f0b02f5

    invoke-virtual {p0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    new-instance v0, Lcom/samsung/android/settings/nfc/NfcAntennaGuideDialog$1;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object p0, v0, Lcom/samsung/android/settings/nfc/NfcAntennaGuideDialog$1;->this$0:Lcom/samsung/android/settings/nfc/NfcAntennaGuideDialog;

    invoke-static {}, Ljava/lang/invoke/VarHandle;->storeStoreFence()V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method
