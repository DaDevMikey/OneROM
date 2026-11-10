# OneROM Delta 9.0

**Official One UI 9 / Android 17 Port for the Samsung Galaxy S10 Exynos (`beyond1lte`)**

A fully native Samsung One UI 9 port for the Samsung Galaxy S10 LTE, built from Galaxy S24 FE (`SM-S721B`) donor firmware with customized Exynos 9820 hardware adaptations. This is a native One UI 9 port—not a Generic System Image (GSI) or AOSP build.

---

## Device Catalog

| Device | Platform | Codename | Model Number | Status |
| :--- | :--- | :--- | :--- | :--- |
| **Galaxy S10 LTE** | Exynos 9820 | `beyond1lte` | SM-G973F / SM-G973N | **Official** |
| **Galaxy S10+ LTE** | Exynos 9820 | `beyond2lte` | SM-G975F / SM-G975N | **OFFICIAL (WIP)** |
| **Galaxy S10 5G** | Exynos 9820 | `beyondx` | SM-G977F / SM-G977N | **NOT SUPPORTED** |
| **Galaxy S10e LTE** | Exynos 9820 | `beyond0lte` | SM-G970F / SM-G970N | **NOT SUPPORTED** |

> [!NOTE]
> This release natively supports the Exynos 9820 Galaxy S10 (`beyond1lte`) and Galaxy S10+ (`beyond2lte`). Snapdragon variants and other models (`beyond0lte`, `beyondx`) are not supported by this tree. Contributions are appreciated.

---

## Features

- **Native One UI 9 / Android 17 Stack**:
  - Full Samsung framework, services, and system applications running on the S10 hardware stack.
  - ARM64-only Zygote runtime with isolated 32-bit legacy multimedia / SoundTrigger compatibility.
  - Ultrasonic in-display fingerprint sensor fully functional.
  - 60 Hz display and cutout geometry tailored for the S10 right-side hole-punch display.
  - Extra Dim, AppLock, Samsung Camera, and restored FotaAgent.
- **OneKernel 9.0 Integration**:
  - Based on Creeeeger's overclocked ExtremeKRNL 2.6.5 base (`openela-rc1` 4.14.356).
  - CPU big-cluster overclock up to 3.04 GHz and GPU frequency optimizations.
  - Integrated KernelSU Next (v3.2.0) root management.
  - Upstream Kernel Source Reference: [https://github.com/Creeeeger/9820_kernel](https://github.com/Creeeeger/9820_kernel).
- **OneROM Custom Settings & Features**:
  - **Static S10 Banner**: High-resolution authentic Galaxy S10 wallpaper banner in `About phone` and `Software information`.
  - **OneROM Settings**: Dedicated portal accessible via `Settings -> Software information -> ROM Settings`.
  - **UI Settings**: Fullscreen AOD toggle (display lockscreen wallpaper on Always On Display), custom device name, custom banner text, and optional Vulkan UI renderer toggle.
  - **Spoof & Privacy Settings**: Masking for IMEI, serial number, and phone number (`********`), with automatic restart directly into `About phone` upon modification.
  - **Multi-User Support**: Full multi-user profiles and guest account management (up to 4 switchable users).
  - **Hardware Bixby Remapping**: Built-in Bixby key action activity.
- **Multimedia & Video Streaming**:
  - Patched `libstagefright.so` FORTIFY buffer check in `ACodec::reconfigEncoder4OtherApps`.
  - Full hardware video encoding support (`scrcpy` display mirroring, native screen recording, VoIP).

---

## Flashing Instructions (From Stock to OneROM)

> [!IMPORTANT]
> **F2FS Userdata Requirement**:
> Android 17 / One UI 9 requires `/data` to be formatted as **F2FS**. Formatting as `ext4` will trigger `rescueparty_by_bootchecker` bootloops.
>
> **Prerequisites & Tooling**:
> The ROM package, TWRP Odin pack, cleaner, and repartitioner are all available on the [GoFile Release Folder](https://gofile.io/d/EMEHIYG6).
> - **TWRP Recovery**: Uses the exact same TWRP as ExtremeROM Nexus (`ExtremeROM_Nexus_G973_TWRP_OdinPack_v2.tar`).
> - **Cleaner**: Uses the exact same cleaner script as ExtremeROM Nexus (`Exynos9820_Cleaner.zip`).
> - **Repartitioning**: Uses the slightly modified repartitioner script from ExtremeROM (`Exynos9820_Repartition.zip`).

---

### Step-by-Step Installation Guide (From Stock)

#### Step 1: Unlock Bootloader & Flash TWRP via Odin
1. On your phone running stock firmware, enable **Developer options** and turn on **OEM unlocking**.
2. Power off the device, then hold **Volume Down + Bixby** and connect the USB cable to a PC to enter **Download Mode**.
3. Long-press **Volume Up** to unlock the bootloader (this wipes user data).
4. Boot back into Download Mode (**Volume Down + Bixby + USB**).
5. Open **Odin** on your PC:
   - Untick **Auto Reboot** in Odin Options.
   - Slot `ExtremeROM_Nexus_G973_TWRP_OdinPack_v2.tar` into the **AP** slot.
   - Click **Start** to flash TWRP.
6. Force reboot into TWRP immediately: hold **Volume Down + Power**, and as soon as the screen goes black, instantly switch to holding **Volume Up + Bixby + Power** until the TWRP splash screen appears.

#### Step 2: Wipe & Repartition
1. In TWRP, go to **Wipe** -> **Format Data**, type `yes`, and confirm.
2. Flash `Exynos9820_Repartition.zip` (via USB OTG, MicroSD, or `adb sideload`):
   ```bash
   adb sideload Exynos9820_Repartition.zip
   ```
3. Once repartitioning completes, reboot recovery (**Reboot** -> **Recovery**).

#### Step 3: Clean Partitions & Format Data as F2FS
1. In TWRP, flash the cleaner script:
   ```bash
   adb sideload Exynos9820_Cleaner.zip
   ```
2. **Format `/data` as F2FS**:
   - In TWRP GUI: **Wipe** -> **Advanced Wipe** -> Select **Data** -> **Repair or Change File System** -> **Change File System** -> **F2FS** -> Swipe.
   - *Alternatively via ADB shell*:
     ```bash
     adb shell "make_f2fs -f -O extra_attr,inode_checksum,sb_checksum,quota,compression /dev/block/by-name/userdata"
     ```

#### Step 4: Flash OneROM Delta 9.0
1. Put TWRP into sideload mode:
   - Tap **Advanced** -> **ADB Sideload** -> Swipe to Start Sideload (or run `adb shell twrp sideload`).
2. Flash the ROM package:
   ```bash
   adb sideload OneROM_Delta_9.0.0.1_20261105-4_beyond1lte-sign.zip
   ```
3. Once flashing completes successfully, tap **Reboot System**.
   *(First boot takes approximately 2-4 minutes while Android 17 initializes).*

---

## Building from Source

### Prerequisites
- 64-bit Linux distribution (Ubuntu 22.04+ or Debian 12 recommended).
- Dependencies: `openjdk-17-jdk`, `python3`, `git`, `bash`, `7z`, `rsync`, `clang`, `lld`, `patchelf`, `erofs-utils`, `e2fsprogs`, `f2fs-tools`.
- Android build-tools (`aapt2`, `d8`, `apktool`, `smali`, `baksmali`).

### Build Command
```bash
./build.sh -f
```
Or manually:
```bash
source buildenv.sh beyond1lte
bash scripts/make_rom.sh -f
```

#### Build Flags
- `--debug` : Enables early ADB and USB debugging (`ro.debuggable=1`, `persist.sys.usb.config=mtp,adb`) before `sys.boot_completed` for rapid development and kernel bringup testing.
- `--release` : Default production mode with USB debugging disabled (`ro.debuggable=0`, `persist.sys.usb.config=mtp`).
- `-f, --force` : Force complete re-execution and re-packaging of the ROM.
- `--no-rom-zip` : Extracts and patches partitions without assembling the flashable zip.

The final flashable package will be created in `out/OneROM_Delta_9.0.0.1_..._beyond1lte-sign.zip`.

---

## Credits & Upstream Attribution

- **ExtremeROM / ExtremeXT**: For the foundation of the Samsung One UI porting toolkit.
- **UN1CA / Salvo Giangreco**: For the UN1CA modular ROM framework and build tools.
- **Creeeeger**: For the [Exynos 9820 Extreme Kernel](https://github.com/Creeeeger/9820_kernel) CPU/GPU overclock and kernel tree.
- **ArtisanROM**: For the Exynos 9820 kernel lineage and vendor bringup reference.
- **Rodrigo Brown / @rodrigonbrown-rgb**: For stellarRom, Galaxy S10+ (`beyond2lte`) bringup patches, dual front camera punch-hole assets, and Exynos 9820 platform optimizations.
- **KernelSU Next Team**: For modern root support on Android 17.
- **OneROM Contributors & @DaManMikey**: For the OneROM port, patches, and native One UI 9 adaptation.

---

## License

This project is licensed under [GNU General Public License v3.0](LICENSE). Upstream components, tools, and proprietary blobs retain their respective licenses and copyrights.
