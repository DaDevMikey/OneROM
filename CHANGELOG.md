# OneROM Changelog

# 9.0.1.0
- Merged Galaxy S10+ (`beyond2lte`, SM-G975F/SM-G975N) target support from Rodrigo Brown's `stellarRom`:
  - Full hardware target integration featuring the dual front camera punch-hole cutout (`b2` pill) with native cutout animation assets.
  - Dual front camera (10 MP selfie + 8 MP RGB depth sensor) and triple rear camera configuration in `camera-feature.xml`.
  - Calibrated status bar right cutout padding in SystemUI (`port_statusbar_cutout.py`) so battery, clock, Wi-Fi, and signal icons render cleanly to the left of the wider pill cutout.
  - Virtual vibration and full WQHD+ dynamic display resolution support.
- Platform-Wide Exynos 9820 Performance & Thermal Enhancements (S10 & S10+):
  - Disabled `sead` (Environment Adaptive Display) daemon in package manifest, completely eliminating the ~10/sec background crash loop caused by missing RGB sensor arrays on legacy panels, saving substantial CPU overhead and heat.
  - Fixed SurfaceFlinger GPIS cpuset boost in `task_profiles.json` (`GpisSfCpuset` mapped to cores 0-7), eliminating blur stutter and dropped frames.
  - Enabled Hardware Composer Virtual Display (`debug.sf.enable_hwc_vds=1`) and configured `/dev/jsqz` ueventd permissions for stutter-free screen recording and hardware JPEG encoding.
  - Anti-thrashing LMKD memory tuning (`ro.lmk.thrashing_limit=30`, PSI thresholds) and background DEX2OAT CPU pinning (`0,1,2,3`) for 8 GB RAM longevity.
  - Disabled Android phantom process killer (`persist.sys.fflag.override.settings_enable_monitor_phantom_procs=false`) to prevent aggressive child process termination.
- Fixed Chromium Web Browser Crashes & Website Loading: resolved `ClassNotFoundException` in `ActivityThread.handleCreateService` by intercepting `NativeOnlySandboxedProcessService` instantiation and seamlessly falling back to `SandboxedProcessService`, enabling stable multi-process browsing in Chrome, Samsung Internet, and system WebViews.
- Dual Kernel Lineup Released for both Galaxy S10 (`beyond1lte`) and Galaxy S10+ (`beyond2lte`):
  - `OneKernel 9.0`: Stock frequency profile (2.73 GHz Cheetah M4, 2.31 GHz Cortex-A75, 1.95 GHz Cortex-A55, 702 MHz Mali-G76) for balanced performance and thermal efficiency.
  - `OneKernel+ 9.0`: High-performance overclock profile (3.02 GHz Cheetah M4, 2.40 GHz Cortex-A75, 2.11 GHz Cortex-A55, 806 MHz Mali-G76) for maximum compute throughput.
  - All kernels packaged with KernelSU Next v3.2.0 integration and delivered as flashable TWRP zips.
- Standardized OneROM Build Versioning: adopted consistent 4-part semantic version format `9(One UI major).0(One UI minor).1(OneROM major).0(OneROM minor)` across `build.prop`, `ro.onerom.version`, and Settings Software Information.
- Fixed In-Display Fingerprint Keyguard Overlap: calibrated lockscreen PIN layout (`KeyguardPINView`) to ensure the ultrasonic fingerprint sensor touch area does not overlap the keypad digit '0'.
- Fixed Front Camera Stability: corrected camera cutout protection bounds and hardware ISP stream parameters to prevent preview timeout crashes.
- UI Performance & Frame Pacing Optimizations:
  - Mitigated SurfaceFlinger backpressure (`debug.sf.enable_gl_backpressure=0`, `debug.sf.disable_backpressure=1`, `debug.sf.latch_unsignaled=1`) to eliminate micro-stutters and frame drops.
  - Tuned touch sampling rate (240 Hz) and multi-threaded DEX2OAT compilation parameters.
- Official Signature Verification: restored official build verification status checks (`ro.onerom.official`) while safeguarding release private keys.
- Clarified Good Lock Home Up availability and compatibility guidelines for One UI 9.0 on legacy hardware.

# 9.0
- Upgraded system base to OneROM 9.0 (One UI 8.5 foundation)
- Fixed Settings crash when opening Connections (resolved main-thread hang in TetheringManager by implementing non-blocking restriction checks)
- Fixed Battery & Device Care navigation by restoring SmartManager_v5 (com.samsung.android.lool) as a privileged system package
- Fixed Display Screen Resolution: restored dynamic resolution selector widget (HD+, FHD+, WQHD+) with forced size and density scaling
- Removed obsolete Motion Smoothness setting (Galaxy S10 hardware panel runs natively at 60Hz)
- Lowered status bar offset by calibrating cameraTopMargin for right punch-hole cutout geometry (icons vertically centered with camera)
- Restored device preview graphic in About Phone with offline S10 visual asset fallback
- Integrated official OneKernel v3.2.0+ with KernelSU Next driver and bundled ksud daemon for full root support
- Fixed Bixby hardware button customization: added scancode 703 layout mapping for gpio_keys and routed actions to OneROM action trampoline
- Fixed device codename display in Software Information to properly show beyond1lte instead of ROM codename Delta
- Calibrated touch panel power-on state transitions when waking from deep sleep without fullscreen AOD

# 8.5.0.3 DB
- Fixed front camera cutout animation: calibrated DISPLAY_CUTOUT_ANIMATION_INFO coordinate mapping for Galaxy S10 so the punch hole indicator ring centers directly around the physical camera cutout
- Added GPU overclock support up to 1144 MHz with custom PLL and DVFS voltage tables
- Improved app opening/closing transition smoothness by restoring schedtune cgroup bindings and top-app task boost
- Researched CPU overclock to 3.2 GHz: documented Exynos 9820 hardware and firmware limits (Cheetah M4 PLL and ACPM hardcoded tables capping at 3016 MHz)

# 8.5.0.2 DB
- Fixed the camera closing on launch: /system/etc/floating_feature.xml had no SELinux label, so apps could not read floating features (camera memory level, Smart Manager package, filter provider)
- Restored SELinux labels on /system/build.prop and the hardware key layouts (Generic.kl, Generic_internal.kl, Vendor_0075_Product_0100.kl, Vendor_04e8.kl)
- Fixed Bixby key actions: assistant, camera, flashlight, screenshot and play/pause now work on single, double and long press (actions run through a OneROM trampoline activity registered as a general key customization instead of the XCover-only path)
- Fixed Display > Screen resolution: HD+/FHD+/QHD+ now apply using forced display size and density (the S10 panel exposes a single display mode), and the active resolution is pre-selected
- Restored the Battery entry on the main Settings page (below Display)
- Removed the duplicate Developer options entry from the main Settings page (still available in OneROM Settings)
- Fixed Settings crashing when opening the OneROM guide (bytecode verification error)
- Fixed Settings crashing when enabling the Vulkan renderer or live blur (reboot prompt used removed AlertDialog builder methods)
- Fixed Settings crashing on the Setup Wizard Wi-Fi and Dark mode steps (illegal setTheme override)
- Fixed a background Settings crash from OneROM controllers during settings indexing (isControllable)
- Moved the Status information toggles (IMEI, serial number, phone number, Developer options) from Extra settings to Spoof settings
- In-Settings changelog now lists each change separately, grouped by version
- Fixed stale version strings: build number, ROM version, banner default and backup label now show 8.5.0.2 / OneROM 8.5

# 8.5.0.1 DB
- Upgraded base system firmware to One UI 8.5 (Android 16, S24 FE base S721BXXSCDZF3 / S721BXXSEDZH9)
- Fixed Galaxy S10 status bar right camera cutout padding in SystemUI (IndicatorGardenAlgorithmRightCutout) so battery and signal icons no longer overlap the punch hole
- Fixed SecSettings crashes caused by Android 16 ART DEX container header mismatch (112 vs 120 bytes)
- Fixed Setup Wizard agreement screen blockage, allowing smooth progression through Dark Mode setup to One UI Home launcher
- Fixed Developer options crash caused by register bytecode verification mismatch in AbstractLogpersistPreferenceController
- Fixed UI settings and Extra settings crashes caused by missing DropDownPreference.setEntryValues method and SubSettings AlertDialog theme attribute inflation
- Fixed Settings search query and indexing crash (implemented default concrete handlers for Samsung Cube command methods in BasePreferenceController)
- Added Samsung Native App Lock integration under Settings > Advanced features with full biometric and passcode protection
- Renamed "Customisation hub" to "Extra options" across OneROM Settings and OneROM Guide
- Removed obsolete Always On Display entry from OneROM Guide
- Integrated OneKernel v3.2.0+ (Linux 4.14.356) with KernelSU Next v1.0.9 root and APK v2 signature bypass
- Integrated fixed hardware composer (HWC) and gralloc vendor drivers for Exynos 9820 on Android 16
- Updated Settings branding with OneROM 8.5.0.1 DB banner, developer attribution (@DaManMikey), and accurate build info

# 8.0.1 Public Beta
- Added a native OneROM guide in place of the Remote management shortcut
- Added an in-Settings changelog opened by tapping ROM version
- Added One UI-style three-part ROM versions, beginning with 8.0.1
- Updated the bundled KernelSU Next manager from 3.1.0 to 3.3.0
- Added safe TikTok profile launching for @MikeyDoesTech without crashing Settings when no handler is installed
- Fixed Bixby single, double, and hold actions being blocked while the phone is locked or on AOD
- Fixed the Bixby key mapping used by the gpio_keys input device
- Fixed Software information banner crashes
- Fixed ROM build date and device codename reporting
- Restored single, double, and hold actions on the About phone row
- Restored the Galaxy S10 native AOD path and preserved fingerprint behavior
- Removed the unsupported face recognition HAL experiment
- Added native OneROM privacy controls, backup and restore, Setup Wizard choices, and product/banner customization
- Added OneKernel with KernelSU Next support and a 3.02 GHz CPU frequency table
- OneKernel 3.02 GHz Overclock: M4 Cheetah cores now run at 3.016 GHz
- S-Boot Recovery Bypass: Software reboot to recovery now uses FOTA reset reason to bypass Samsung S-Boot hardware button requirement
- OTA downloads save to /sdcard/OneROMupdates/ for easy access in TWRP recovery
- Added step-by-step manual installation guide inside the updater app
- Banner text uses Samsung native sec font family with weight 600
