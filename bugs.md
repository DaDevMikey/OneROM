# OneROM Zeta 9.5 Known Issues & Bug Tracker

This document tracks active known issues and bug reporting procedures for **OneROM Zeta 9.5** on Exynos Galaxy S10 (`beyond1lte`) and Galaxy S10+ (`beyond2lte`).

---

## Active Known Issues

### 1. Bluetooth Media Audio (A2DP)
- **Status:** Inoperative on both S10 and S10+.
- **Symptom:** Bluetooth devices (such as Galaxy Buds, wireless headphones, and car kits) pair and maintain connection, but media audio does not route through the Bluetooth sink and plays through device speakers or remains silent. Calls and general connectivity work.
- **Technical Detail:** The Exynos 9820 platform uses legacy Bluetooth audio routing. Android 17 QPR2 / One UI 9.5 audio policy routing expects newer offload HAL definitions (`vendor.samsung.hardware.bluetooth.a2dp@1.0::ISehBluetoothAudioOffload`). Work is underway to backport software A2DP policy fallbacks.

### 2. General Performance / Lag
- **Status:** Known limitation in 9.5.0.1 Beta.
- **Symptom:** Reduced UI smoothness and occasional lag compared to stable builds.
- **Technical Detail:** Based on the first Galaxy S26 Ultra One UI 9.5 Beta firmware; performance optimizations are planned for upcoming updates.

### 3. One UI 9.5 Stock Camera
- **Status:** Adapted from One UI 9.5 donor (replaces One UI 6.1 camera).
- **Symptom:** Minor camera edge-case bugs may occur while adaptation continues.

---

## Reporting Bugs

When reporting a new bug or unexpected behavior, provide:
1. Exact device model (`SM-G973F`, `SM-G973N`, `SM-G975F`, `SM-G975N`).
2. Exact ROM build date and package name.
3. Confirmation of clean flash (all bug reports require a clean installation on 13 GB repartitioned system storage).
4. Clear step-by-step reproduction instructions.
5. Logcat and crash dump attachments:
   ```bash
   adb logcat -d > logcat.txt
   adb shell dumpsys dropbox --print system_app_crash system_app_native_crash system_app_anr > crash_dumps.txt
   ```

