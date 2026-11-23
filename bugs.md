# OneROM Zeta 9.5 known issues

This list covers the One UI 9.5 beta on Exynos Galaxy S10 (`beyond1lte`) and
S10+ (`beyond2lte`). The S10 has been tested on hardware; the S10+ release
needs hardware validation. Reports from earlier builds are marked accordingly.

## Confirmed on S10

- **Bluetooth audio:** A2DP headsets can pair and connect, but audio does not
  route to them. The stock Bluetooth stack can also abort when Samsung's
  A2DP offload service is unavailable. A crash bypass has not fixed routing.
- **Browser:** Chrome page rendering is fixed and integrated into builds via
  `scripts/internal/patch_chrome_zygote.py` (replaces unsupported `clone3` with
  `fork` in `libzygote_sys.dylib.so`, and treats `cap_get_bound` `EINVAL` as an
  unsupported kernel capability in `libcap_rust.dylib.so`). Verified loading
  pages on S10 with SELinux enforcing and full renderer sandboxing (`CapBnd=0`,
  `NoNewPrivs=1`, `Seccomp=2`); patched libraries verified present after clean
  flash on S10.
- **Video recording:** Fixed and integrated into builds via
  `scripts/internal/patch_video_bufferqueue.py`. Retested on S10: Camera saved
  a 4K H.264/AAC recording (5.25s video / 5.29s audio, 125 frames) and played
  back in Samsung Video. Patched `libgui.so` is verified present after clean
  flash on S10; S10+ is untested. Separate screen recording still produced no
  frames. A local H.264 MP4 played and displayed advancing frames in Samsung
  Video on S10; other formats and streaming playback need testing.
- **OneROM Settings:** Bixby key customization is fixed and integrated into
  builds via `services.jar` (`KeyCustomizationManager` -> `OneROMBixbyHandler`);
  single press (flashlight), double press (camera), and long press (screenshot)
  were verified on S10. Both logo-only banners and the Software information link
  to OneROM Settings were verified on S10.
- **Camera cutout:** The camera's separate cutout ring is missing. A
  device-only compatibility test moved an overlapping Camera control clear
  of the cutout; that adjustment is not included in the ROM build.
- **Samsung KG client:** The client process aborts during startup because its
  SELinux process context cannot be set. Its practical impact is not yet known.

## Reported or requiring retesting

- **Display resolution:** A framework patch retained 1080p/420 DPI across
  reboots on the clean-flashed S10 with SELinux enforcing (and previously
  retained 720p/280 DPI and 1440p/560 DPI). S10+ hardware remains untested.
- **S10+ camera:** Camera launch failure was reported on an earlier build.
- **S10+ cutout:** Status bar icons were reported overlapping the camera pill.
- **S10+ fingerprint:** The enrollment animation was reported freezing.
- **Settings search:** Occasional crashes were reported on earlier builds.
- **Face unlock on S10+:** The S10 implementation is included but has not been
  validated on S10+ hardware.
- **Wallpaper tilt:** The S10 build contains the tilt classes and SystemUI has
  registered its gyroscope listener. Visual behavior and S10+ remain to be
  verified by testers.

## Installation notes

The unlocked-bootloader warning is normal on an unlocked Samsung device.
An `E1001` system-image write error can indicate insufficient system partition
space or mounted partitions. Back up data and follow the matching release's
repartitioning and recovery instructions; repartitioning and formatting erase
data. Do not use packages intended for another device model.

## Reporting a bug

Provide the exact device model, ROM build date, clean or dirty flash status,
and steps to reproduce. Capture logs immediately after reproducing the issue:

```bash
adb logcat -d > logcat.txt
adb shell dumpsys dropbox --print system_app_crash system_app_native_crash system_app_anr > crash_dumps.txt
adb shell getprop > props.txt
```

Logs and properties may contain private information. Review and remove
sensitive data before attaching them to a public issue or sharing them.
