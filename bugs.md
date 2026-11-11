# Known Bugs & Active Issues — OneROM Delta 9.0

This document tracks verified active issues and bug hunting targets for **OneROM Delta 9.0** on the Samsung Galaxy S10 series (`beyond1lte` SM-G973F/SM-G973N and `beyond2lte` SM-G975F/SM-G975N, Exynos 9820).

> [!NOTE]
> Previously resolved issues from earlier builds (Front camera crash, Chromium/WebView isolated sandboxed process soft reboot, in-display fingerprint sensor overlapping PIN bouncer layout, official build status tag, and hardware JPEG screen recording acceleration) have been verified and integrated in source.

---

## Active Known Issues

### 1. Bluetooth Audio Crash (Galaxy Buds / A2DP Offload Assertion)
- **Devices**: Galaxy S10 (`beyond1lte`), Galaxy S10+ (`beyond2lte`).
- **Symptom**: Connecting Galaxy Buds or initiating Bluetooth A2DP audio streaming causes Bluetooth to suddenly turn off and restart a few seconds later.
- **Root Cause**: Exynos 9820 vendor does not implement Samsung's newer `vendor.samsung.hardware.bluetooth.a2dp@1.0` HIDL offload service. When `ISehBluetoothAudioOffload::getService()` returns `nullptr`, `btif_a2dp_audio_interface_start_session()` in `libbluetooth_jni.so` (inside `com.android.bt.apex`) triggers `FATAL:btif_a2dp_audio_interface.cc(303) Check failed: btAudio != nullptr`, killing `com.android.bluetooth` with `SIGABRT`.
- **Status / Fix**: Fixed in `com.android.bt.apex` by patching the assertion and bypassing the HIDL offload start call to enforce standard AOSP software A2DP streaming. Users can flash the `OneROM_Delta_9.0.1.1_Bluetooth_Buds_Fix.zip` hotfix package or update to OneROM Delta 9.0.1.1.

### 2. Galaxy S10+ Camera Launch Failure ("Warning: Camera failed")
- **Devices**: Galaxy S10+ (`beyond2lte`).
- **Symptom**: Opening the Samsung Camera app on Galaxy S10+ displays "Warning: Camera failed" and immediately closes.
- **Root Cause**: Galaxy S10+ features dual front cameras (wide + depth) and triple rear cameras. The donor S24 FE single front sensor framework expects a different sensor HAL mapping than the legacy Exynos 9820 camera provider configuration on S10+.
- **Status**: Under active investigation. Logcat from `android.hardware.camera.provider@2.4-service_64` and `cameraserver` is being analyzed.

### 3. Galaxy S10+ Dual Pill Cutout Status Bar Overlap
- **Devices**: Galaxy S10+ (`beyond2lte`).
- **Symptom**: On Galaxy S10+, the battery percentage/icon and top-right status bar icons overlap the wide dual-camera pill cutout.
- **Root Cause**: The status bar layout and cutout exclusion area are currently configured with single-circle punch hole metrics (matching the base S10) instead of the wider dual-camera pill cutout dimensions of `beyond2lte`.
- **Status**: Cutout dimension profiles and SystemUI overlay metrics for `beyond2lte` are being tuned.

### 4. Galaxy S10+ Fingerprint Enrollment Animation Freeze
- **Devices**: Galaxy S10+ (`beyond2lte`).
- **Symptom**: During initial fingerprint registration in Settings, the animated fingerprint placement indicator turns green and remains frozen.
- **Status**: Under active investigation. Biometric HAL communication logs are being reviewed.

### 5. Settings Search Bar Crash
- **Devices**: Galaxy S10 (`beyond1lte`), Galaxy S10+ (`beyond2lte`).
- **Symptom**: Tapping into or searching terms inside Settings search may occasionally cause `com.android.settings` to crash.
- **Root Cause**: Indexing inconsistency in dynamic search provider databases when parsing certain ported One UI 8 / 7 preference controllers.
- **Status**: Under active investigation.

### 6. Bootloader Unlocked Warning on Boot
- **Devices**: All Exynos 9820 models.
- **Symptom**: Samsung standard bootloader unlocked warning splash screen appears during cold boots.
- **Status / Fix**: Normal Knox unlock behavior. Users can optionally suppress this warning by flashing `OneROM_Hide_Bootloader_Warning_Exynos9820.zip` via TWRP.

### 7. Recovery Flashing Error E1001 (Failed to update system image)
- **Devices**: Galaxy S10 (`beyond1lte`), Galaxy S10+ (`beyond2lte`).
- **Symptom**: Flashing the ROM zip in TWRP halts with:
  ```
  Patching system image unconditionally...
  E1001: Failed to update system image.
  Updater process ended with ERROR: 1
  Failed to mount '/system_root' (Invalid argument)
  ```
- **Cause**: The device has stock Samsung partition sizes (~5.2 GB for `/system`) or an outdated 7GB layout. OneROM Delta Android 16 system image is ~7.5 GB, so it runs out of space mid-write on unrepartitioned devices. Additionally, TWRP may keep partitions mounted during package installation.
- **Solution**:
  1. Boot into TWRP Recovery.
  2. Flash the official 13GB `Exynos9820_Repartition.zip` (available in the release folder / GoFile share).
  3. Reboot recovery (`Reboot -> Recovery`).
  4. Perform data format (`Wipe -> Format Data -> type 'yes'`).
  5. Flash the OneROM Delta ROM zip.
- **ROM Updater Safety**: The flashable zip generator now automatically unmounts `/system`, `/system_root`, `/vendor`, `/product`, `/odm`, `/prism`, and `/optics` before executing `block_image_update`.

---

## How to Report Bugs

To help diagnose and resolve issues efficiently, please follow these instructions when reporting a bug.

### 1. Required Information
Always include the following basic details with your report:
- **Device Model**: Exact model number (e.g., `SM-G973F`, `SM-G973N`, `SM-G975F`, `SM-G975N`).
- **ROM Version**: Go to `Settings -> About phone -> Software information` and note the OneROM version and build date, or run `adb shell getprop ro.build.display.id`.
- **Clean Flash Status**: State whether you formatted data before flashing or upgraded dirty.
- **Reproduction Steps**: Step-by-step description of what you did right before the bug occurred.

### 2. Capturing Logs via ADB

Logs are required for any crash, freeze, or hardware component failure.

#### A. Standard Logcat (App crashes, UI glitches, connection failures)
Connect your device to a PC with USB debugging enabled, reproduce the issue, and immediately execute:
```bash
adb logcat -d > logcat.txt
```

#### B. Crash Dumps & Native Aborts (Dropbox / Tombstones)
If an app crashes with "has stopped" or quietly disappears (such as Bluetooth or SystemUI):
```bash
adb shell dumpsys dropbox --print system_app_crash system_app_native_crash system_app_anr > crash_dumps.txt
```

#### C. Kernel Dmesg (Random reboots, kernel panics, sensor lockups)
If the phone unexpectedly reboots or reboots into recovery:
```bash
adb shell dmesg > dmesg.txt
```
If the phone rebooted, grab the previous kernel boot log:
```bash
adb shell cat /proc/last_kmsg > last_kmsg.txt 2>/dev/null || adb shell cat /sys/fs/pstore/console-ramoops > ramoops.txt 2>/dev/null
```

#### D. Device Properties
To confirm exact build configurations and feature flags:
```bash
adb shell getprop > props.txt
```

### 3. Submission
Attach your generated log files (`logcat.txt`, `crash_dumps.txt`) along with the step-by-step description to the Telegram testing group or submit an issue on the GitHub repository.

---

## Flashing & Utilities Note

For installation and partition prep, please note:
- **Cleaner**: Uses the exact same cleaner script as **ExtremeROM Nexus** (`Exynos9820_Cleaner.zip`).
- **TWRP**: Uses the exact same TWRP recovery as **ExtremeROM Nexus** (`ExtremeROM_Nexus_G973_TWRP_OdinPack_v2.tar`).
- **Repartitioning**: Uses the dedicated repartitioner script (`Exynos9820_Repartition.zip`), available in the GoFile share. Repartitioning is mandatory when installing OneROM for the first time.
