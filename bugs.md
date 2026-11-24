# OneROM Zeta 9.5 Known Issues & Status

This document tracks known issues and resolved fixes for the **OneROM Zeta 9.5** Public Beta on Exynos Galaxy S10 (`beyond1lte`) and Galaxy S10+ (`beyond2lte`). Both devices have been hardware-tested and verified functional on clean installs.

---

## Active Known Issues

### 1. Mobile Hotspot (Tethering)
- **Status:** Inoperative on both S10 and S10+.
- **Symptom:** Turning on Mobile Hotspot fails to start the AP interface or share mobile data with clients.
- **Root Cause / Investigation:** Kernel/netd tethering offload driver differences and routing incompatibilities between the Linux 4.14 kernel and the Android 17 / One UI 9.5 network stack. Under active investigation.

### 2. Bluetooth Media Audio (A2DP)
- **Status:** Inoperative on both S10 and S10+.
- **Symptom:** Bluetooth devices (including Galaxy Buds and headsets) pair and maintain connection, but media audio does not route through the Bluetooth sink and plays through device speakers or remains silent.
- **Root Cause / Investigation:** Exynos 9820 lacks Samsung's newer hardware A2DP offload HAL (`vendor.samsung.hardware.bluetooth.a2dp@1.0::ISehBluetoothAudioOffload`). While crash bypass patches in `com.android.bt.apex` prevent Bluetooth daemon aborts, software A2DP audio policy routing is suppressed by the audio policy server. Under active investigation.

---

## Resolved & Verified Working on Hardware (S10 & S10+)

- **Clean Flash & Boot:** Successfully tested and boots to setup wizard / launcher on both Galaxy S10 and Galaxy S10+.
- **KernelSU Next Module Execution:** Resolved via `/system/etc/init/init.ksu.rc`. Triggers `ksud post-fs-data`, `services`, and `boot-completed` during init stages. Modules apply cleanly on boot and persist across reboots.
- **KernelSU Next Manager:** ROM comes pre-installed with matching KernelSU Next Manager v3.4.2 (33355 / kernel API 12140).
- **Galaxy S10+ Camera:** Resolved by preserving pre-patched `SamsungCamera.apk` instead of reverting to donor stock APK. Both front and rear cameras initialize properly.
- **Galaxy S10+ Punch-Hole Cutout Animation:** Staged `punch_hole_ic_b2.json` and hooked `LottieCompositionFactory.fromAssetSync` in SystemUI to dynamically load dual-pill cutout assets for `beyond2lte`.
- **Face Unlock (S10 & S10+):** Full end-to-end face recognition enrollment and lockscreen unlock working via `faced` daemon, `S10FaceHal`, `BioFaceService`, and `libface_shim.so`.
- **Video Playback:** Resolved and verified on hardware (`validateBufferDescriptorInfo` bypass in Gralloc2 mapper `libui.so`).
- **Video Recording:** Resolved and verified on hardware via `libgui.so` buffer queue translation.
- **Chrome / Browser Rendering:** Resolved with full sandboxing (replaces unsupported `clone3` with `fork` under full SELinux enforcing).
- **Static Boot Animation:** Static neon OneROM logo verified without zoom artifacts.
- **OneROM Settings & Bixby Remap:** Verified functional (single, double, long-press actions).
- **Display Resolution Persistence:** Verified across reboots (720p, 1080p, 1440p).

---

## Reporting Bugs

When reporting an issue, provide:
1. Exact device model (`SM-G973F`, `SM-G973N`, `SM-G975F`, `SM-G975N`).
2. Exact ROM build filename and date.
3. Clean flash status (all beta testing must be conducted on a clean flash with 13 GB repartitioning).
4. Steps to reproduce the bug.
5. Logcat and crash dump attachments:
   ```bash
   adb logcat -d > logcat.txt
   adb shell dumpsys dropbox --print system_app_crash system_app_native_crash system_app_anr > crash_dumps.txt
   ```
