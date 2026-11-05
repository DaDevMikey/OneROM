# OneROM Delta Changelog

## 9.0.0.1 (Delta) — Official Initial Release

- **Initial Release**: Initial One UI 9 / Android 17 port for Samsung Galaxy S10 LTE (`beyond1lte`).
- **Base Architecture**: Native Samsung One UI 9 / Android 17 donor stack (Galaxy S24 FE `SM-S721B`) adapted to Exynos 9820 hardware.
- **Kernel**: Bundled **OneKernel 9.0** based on Creeeeger's ExtremeKRNL 2.6.5 (4.14.356 openela-rc1) with CPU overclock up to 3.04 GHz, GPU overclock, and KernelSU Next v3.2.0 integration.
- **Settings & OneROM Portal**:
  - Native resource-backed OneROM settings integration in `Settings -> Software information -> ROM Settings`.
  - Authentic Galaxy S10 wallpaper with static banner layout in `About phone` and `Software information`.
  - Version status updated to **Official**.
  - Restored **Fullscreen AOD** toggle (`aod_show_lockscreen_wallpaper`) in UI settings.
  - Enabled **Launcher animation type** selection (HighEnd, Mass, LowEnd, LowestEnd) and live blur effect toggles in UI settings.
  - Multi-User support enabled (up to 4 concurrent user accounts).
  - Identifier privacy masking (IMEI, Serial number, Phone number) with automatic SecSettings restart into `About phone`.
  - Built-in Bixby hardware key remapping support.
  - Added `--debug` build flag for early ADB / USB debugging bringup during boot and `--release` mode for production builds.
- **Multimedia & Compatibility**:
  - Fixed Android 17 Bionic FORTIFY buffer overflow in `libstagefright.so` `ACodec::reconfigEncoder4OtherApps`, enabling full hardware video encoding (`scrcpy`, screen recording, video calling).
  - Isolated 32-bit legacy audio/multimedia runtime under 64-bit Zygote.
  - S10 ultrasonic fingerprint sensor, camera cutout alignment, and 60 Hz display tuning.
  - Battery health and condition monitoring integration.
