# OneROM Zeta 9.5 Known Issues

This document tracks known issues for the **OneROM Zeta 9.5** Public Beta on Exynos Galaxy S10 (`beyond1lte`) and Galaxy S10+ (`beyond2lte`). Both devices have been hardware-tested and verified working.

---

## Active Known Issues

### 1. Mobile Hotspot (Tethering)
- **Status:** Inoperative on both S10 and S10+.
- **Symptom:** Turning on Mobile Hotspot fails to start the AP interface or share data.
- **Root Cause / Investigation:** Kernel/netd tethering offload driver differences and routing incompatibilities with Android 17 / One UI 9.5 network stack. Under investigation.

### 2. Bluetooth Audio
- **Status:** Inoperative on both S10 and S10+.
- **Symptom:** Bluetooth devices (including Galaxy Buds and headsets) pair and maintain connection, but media audio does not route through the Bluetooth sink and plays through device speakers or remains silent.
- **Root Cause / Investigation:** Exynos 9820 lacks Samsung's newer hardware A2DP offload HAL (`vendor.samsung.hardware.bluetooth.a2dp@1.0::ISehBluetoothAudioOffload`). While crash bypass patches in `com.android.bt.apex` prevent Bluetooth daemon aborts, software A2DP audio policy routing is suppressed by the audio policy server. Under investigation.

### 3. Galaxy S10+ Camera Failure
- **Status:** Inoperative on Galaxy S10+ (`beyond2lte`); fully functional on base Galaxy S10 (`beyond1lte`).
- **Symptom:** Opening Samsung Camera on S10+ fails with "Warning: Camera failed" or crashes immediately.
- **Root Cause / Investigation:** Dual front camera / sensor driver mapping differences in S10+ Exynos 9820 camera HAL and provider under the S26 Ultra donor camera stack.

### 4. Camera Cutout for Face Unlock on Galaxy S10+
- **Status:** Incorrect pill positioning / animation on Galaxy S10+ (`beyond2lte`); verified correct on Galaxy S10 (`beyond1lte`).
- **Symptom:** Face recognition enrollment and unlock rings align properly on the single circle cutout of the Galaxy S10, but on the Galaxy S10+ the cutout ring does not correctly match the dual pill punch-hole dimensions (`punch_hole_ic_b2`).

---

## Resolved & Verified Working on Hardware (S10 & S10+)

- **Clean Flash & Boot:** Successfully tested and boots to setup wizard / launcher on both S10 and S10+.
- **Video Playback:** Fixed and verified on-device (`validateBufferDescriptorInfo` bypass in Gralloc2 `libui.so`).
- **Video Recording:** Fixed and verified on-device via `libgui.so` buffer queue translation.
- **Chrome / Browser Rendering:** Fixed and verified with full sandboxing (replaces unsupported `clone3` with `fork`).
- **Face Unlock (Base S10):** Verified working end-to-end on Galaxy S10 hardware with `faced`, `BioFaceService`, `S10FaceHal`, `libface_shim.so`, and external Lottie punch-hole assets.
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
