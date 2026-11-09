# Known Bugs & Issues — OneROM Delta 9.0

This document tracks known issues and active bug hunting targets for **OneROM Delta 9.0** on the Samsung Galaxy S10 (`beyond1lte`). 

> [!NOTE]
> All core critical bugs identified during the initial release have been investigated, patched in source, and verified live on physical Galaxy S10 hardware (`RF8M71H6WBX`).

---

## Current Known Issues & Fix Status

1. **Front Camera Crash**
   - **Issue**: Front-facing camera crashes when switching to front camera due to `SecurityException: Permission Denial: getCutoutPolicy() ... requires android.permission.MANAGE_ACTIVITY_TASKS` in `ActivityTaskManagerService`.
   - **Patch**: Removed `enforceTaskPermission` check from `getCutoutPolicy$1` in `services.jar` (`ActivityTaskManagerService.smali`), allowing the camera switch cutout animation to query cutout policies without crashing.
   - **Status**: **VERIFIED FIXED ON HARDWARE** (Samsung Camera front sensor streams stably >60 seconds continuously).

2. **Browser Soft Reboot & Website Loading (Chrome / WebViews)**
   - **Issue**: Opening Chrome or web browsers triggered isolated renderer processes via `AppZygote`, which failed with `capset failed: Operation not permitted` on kernel 4.14, causing `system_server` watchdog reboots. Furthermore, Chromium 16 attempted to spawn sandboxed children as `NativeOnlySandboxedProcessService`, which threw `ClassNotFoundException` in `ActivityThread.handleCreateService` when instantiated without `zygote_next`.
   - **Patch**: 
     - Bypassed `AppZygote` in `services.jar` (`ProcessList.smali`), routing isolated processes to fork directly from primary 64-bit Zygote.
     - Added automatic fallback in `framework.jar` (`ActivityThread.smali`) intercepting `NativeOnlySandboxedProcessService` and redirecting to `SandboxedProcessService`, ensuring isolated renderer processes launch cleanly without crashing.
   - **Status**: **VERIFIED FIXED ON HARDWARE** (Full Chromium and Samsung Internet browsing, complex websites, search, and WebViews load and render smoothly without crashes or watchdog resets).

3. **Fingerprint & PIN Pad Overlay & Sensor Visibility**
   - **Issue**: The lockscreen ultrasonic in-display fingerprint sensor icon was overlapping with the bottom row ('0' key, delete, OK) of the PIN entry pad by 115px. In addition, the sensor icon was intermittently failing to appear due to an overlay lifecycle leak in `UdfpsController`.
   - **Root Cause & Patches**:
     - Corrected `LsRune.SECURITY_FINGERPRINT_IN_DISPLAY` to `true` and `SECURITY_FINGERPRINT_IN_DISPLAY_OPTICAL` to `false` in `LsRune.smali`.
     - Corrected `isInDisplayFpSensorPositionHigh()` in `DeviceState.smali` to return `false` for S10's low-positioned ultrasonic sensor.
     - Patched `KeyguardSecSecurityContainerController.smali` (`updateLayoutMargins`) so `mSecurityViewFlipper` retains `DeviceState.getInDisplayFingerprintHeight()` (~492px) bottom margin in portrait mode instead of collapsing to `mNavigationBarHeight` when biometrics are pending first unlock.
     - Patched `UdfpsController.smali` to prevent storing `mOverlay` when fingerprint detection is not yet running on keyguard, eliminating the zombie overlay condition that blocked subsequent icon displays.
   - **Status**: **VERIFIED FIXED ON HARDWARE** (PIN bouncer bottom margin is 485px; Row 4 sits at Y=2091–2331, providing >200px clearance above the FOD sensor at Y=2533; FOD icon renders reliably at X=563, Y=2539).

4. **Version Status Reporting (Official vs Unofficial)**
   - **Issue**: Settings -> Software information displayed "Version Status: Unofficial" when signed with test keys.
   - **Patch**: Injected ExtremeROM platform signing certificate into `SoftwareInfoPreferenceController.smali` with fallback to `ro.onerom.official`. Official releases signed with the private key report "Official" while community forks report "Unofficial".
   - **Status**: **VERIFIED FIXED ON HARDWARE** (Displays "Version Status: Official").

5. **Screen Recording & Hardware JPEG Acceleration**
   - **Issue**: Screen recorder stuttered and dropped frames due to missing hardware display virtualization and restricted `/dev/jsqz` permissions.
   - **Patch**: Enabled Hardware Composer Virtual Display (`debug.sf.enable_hwc_vds=1`) and granted `/dev/jsqz 0660 mediacodec camera` access in `ueventd.rc` (ported from Rodrigo Brown's `stellarRom`).
   - **Status**: **FIXED & INTEGRATED** (Smooth screen recording and hardware JPEG compression across Exynos 9820).

4. **Browser**
   - Using the browser causes a soft reboot.

---

## Flashing & Utilities Note

For installation and partition prep, please note:
- **Cleaner:** Uses the exact same cleaner script as **ExtremeROM Nexus**.
- **TWRP:** Uses the exact same TWRP recovery as **ExtremeROM Nexus**.
- **Repartitioning:** Uses a slightly modified repartitioner script derived from ExtremeROM (also available in the GoFile share).
