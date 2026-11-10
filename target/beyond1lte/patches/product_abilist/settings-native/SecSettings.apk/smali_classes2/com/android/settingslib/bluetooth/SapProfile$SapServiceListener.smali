.class public final Lcom/android/settingslib/bluetooth/SapProfile$SapServiceListener;
.super Ljava/lang/Object;
.source "qb/116059356 19e18cb65cd8c1b783c717bee809f29f548ee6c45e9e1aeeae375887cddbc863"

# interfaces
.implements Landroid/bluetooth/BluetoothProfile$ServiceListener;


# instance fields
.field public synthetic this$0:Lcom/android/settingslib/bluetooth/SapProfile;


# virtual methods
.method public final onServiceConnected(ILandroid/bluetooth/BluetoothProfile;)V
    .locals 2

    iget-object p1, p0, Lcom/android/settingslib/bluetooth/SapProfile$SapServiceListener;->this$0:Lcom/android/settingslib/bluetooth/SapProfile;

    check-cast p2, Landroid/bluetooth/BluetoothSap;

    iput-object p2, p1, Lcom/android/settingslib/bluetooth/SapProfile;->mService:Landroid/bluetooth/BluetoothSap;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    :goto_0
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_1

    const/4 p2, 0x0

    invoke-interface {p1, p2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/bluetooth/BluetoothDevice;

    iget-object v0, p0, Lcom/android/settingslib/bluetooth/SapProfile$SapServiceListener;->this$0:Lcom/android/settingslib/bluetooth/SapProfile;

    iget-object v0, v0, Lcom/android/settingslib/bluetooth/SapProfile;->mDeviceManager:Lcom/android/settingslib/bluetooth/CachedBluetoothDeviceManager;

    invoke-virtual {v0, p2}, Lcom/android/settingslib/bluetooth/CachedBluetoothDeviceManager;->findDevice(Landroid/bluetooth/BluetoothDevice;)Lcom/android/settingslib/bluetooth/CachedBluetoothDevice;

    move-result-object v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "SapProfile found new device: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "SapProfile"

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/settingslib/bluetooth/SapProfile$SapServiceListener;->this$0:Lcom/android/settingslib/bluetooth/SapProfile;

    iget-object v1, v0, Lcom/android/settingslib/bluetooth/SapProfile;->mDeviceManager:Lcom/android/settingslib/bluetooth/CachedBluetoothDeviceManager;

    iget-object v0, v0, Lcom/android/settingslib/bluetooth/SapProfile;->mProfileManager:Lcom/android/settingslib/bluetooth/LocalBluetoothProfileManager;

    invoke-virtual {v1, v0, p2}, Lcom/android/settingslib/bluetooth/CachedBluetoothDeviceManager;->addDevice(Lcom/android/settingslib/bluetooth/LocalBluetoothProfileManager;Landroid/bluetooth/BluetoothDevice;)Lcom/android/settingslib/bluetooth/CachedBluetoothDevice;

    move-result-object v0

    :cond_0
    iget-object p2, p0, Lcom/android/settingslib/bluetooth/SapProfile$SapServiceListener;->this$0:Lcom/android/settingslib/bluetooth/SapProfile;

    const/4 v1, 0x2

    invoke-virtual {v0, p2, v1}, Lcom/android/settingslib/bluetooth/CachedBluetoothDevice;->onProfileStateChanged(Lcom/android/settingslib/bluetooth/LocalBluetoothProfile;I)V

    invoke-virtual {v0}, Lcom/android/settingslib/bluetooth/CachedBluetoothDevice;->refresh()V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/android/settingslib/bluetooth/SapProfile$SapServiceListener;->this$0:Lcom/android/settingslib/bluetooth/SapProfile;

    iget-object p1, p1, Lcom/android/settingslib/bluetooth/SapProfile;->mProfileManager:Lcom/android/settingslib/bluetooth/LocalBluetoothProfileManager;

    invoke-virtual {p1}, Lcom/android/settingslib/bluetooth/LocalBluetoothProfileManager;->callServiceConnectedListeners()V

    iget-object p0, p0, Lcom/android/settingslib/bluetooth/SapProfile$SapServiceListener;->this$0:Lcom/android/settingslib/bluetooth/SapProfile;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/android/settingslib/bluetooth/SapProfile;->mIsProfileReady:Z

    return-void
.end method

.method public final onServiceDisconnected(I)V
    .locals 0

    iget-object p1, p0, Lcom/android/settingslib/bluetooth/SapProfile$SapServiceListener;->this$0:Lcom/android/settingslib/bluetooth/SapProfile;

    iget-object p1, p1, Lcom/android/settingslib/bluetooth/SapProfile;->mProfileManager:Lcom/android/settingslib/bluetooth/LocalBluetoothProfileManager;

    invoke-virtual {p1}, Lcom/android/settingslib/bluetooth/LocalBluetoothProfileManager;->callServiceDisconnectedListeners()V

    iget-object p0, p0, Lcom/android/settingslib/bluetooth/SapProfile$SapServiceListener;->this$0:Lcom/android/settingslib/bluetooth/SapProfile;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/settingslib/bluetooth/SapProfile;->mIsProfileReady:Z

    return-void
.end method
