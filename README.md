# OneROM Zeta 9.5 (seventeenqpr2)

> [!NOTE]
> **Android 17 QPR2 / One UI 9.5 Beta - Galaxy S26 Ultra donor**
> This branch (`seventeenqpr2`) contains One UI 9.5 ported from the Galaxy S26 Ultra Beta (`SM-S948B / S948BXXU6ZZKN / Android 17 QPR2 / One UI 9.5`).
> The Galaxy S10 (`beyond1lte`) has been tested on hardware. Galaxy S10+ (`beyond2lte`) builds require further hardware testing.

**One UI 9.5 Port for the Samsung Galaxy S10 / S10+ Exynos (`beyond1lte` / `beyond2lte`)**

An authentic native Samsung One UI 9.5 port for the Samsung Galaxy S10 / S10+ Exynos, built from Galaxy S26 Ultra (`SM-S948B`) donor firmware with customized Exynos 9820 hardware adaptations.

---

## Device Catalog

| Device | Platform | Codename | Model Number | Status |
| :--- | :--- | :--- | :--- | :--- |
| **Galaxy S10 LTE** | Exynos 9820 | `beyond1lte` | SM-G973F / SM-G973N | S10 hardware tested |
| **Galaxy S10+ LTE** | Exynos 9820 | `beyond2lte` | SM-G975F / SM-G975N | Hardware testing required |
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
- **OneKernel 9.5 Integration**:
  - Based on Creeeeger's overclocked ExtremeKRNL 2.6.5 base (`openela-rc1` 4.14.356).
  - CPU big-cluster overclock up to 3.04 GHz and GPU frequency optimizations.
  - Integrated KernelSU Next legacy root management.
  - Full compatibility with One UI 9.5 / Android 17 QPR2 on Exynos 9820.
  - Kernel source: [OneKernel-9820, onerom-zeta-9.5](https://github.com/DaDevMikey/OneKernel-9820/tree/onerom-zeta-9.5). Its upstream base is [Creeeeger/9820_kernel](https://github.com/Creeeeger/9820_kernel).
- **OneROM Custom Settings & Features**:
  - S10 wallpaper tilt support and a static OneROM boot animation.
  - S10 face unlock compatibility; enrollment and unlock have been tested on an S10.
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
> Obtain the matching ROM and recovery files from the release's download folder.
> - **TWRP Recovery**: Use the ExtremeROM Nexus Odin pack for your exact model: `G973` for S10 or `G975` for S10+.
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
   - Slot the appropriate G973 or G975 TWRP Odin pack into the **AP** slot.
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

#### Step 4: Flash OneROM Zeta 9.5
1. Put TWRP into sideload mode:
   - Tap **Advanced** -> **ADB Sideload** -> Swipe to Start Sideload (or run `adb shell twrp sideload`).
2. Flash the ROM package:
   ```bash
   adb sideload <matching-ROM-zip>
   ```
3. Once flashing completes successfully, tap **Reboot System**.
   *(First boot takes approximately 2-4 minutes while Android 17 initializes).*

---

## Building from Source

### Prerequisites

- 64-bit Linux, substantial free disk space, an Internet connection, and
  sudo access for extracting ext4 firmware images.
- Java 17 or 21, Python 3 with `venv`, Go, CMake, Clang, Make, and the
  command-line tools listed in `scripts/utils/build_utils.sh`. On Debian/Ubuntu,
  common packages include `build-essential`, `clang`, `cmake`, `openjdk-17-jdk`,
  `python3-venv`, `golang`, `git`, `curl`, `p7zip-full`, `brotli`, `lz4`,
  `zstd`, `pcre2-utils`, `protobuf-compiler`, `attr`, `zip`, and `unzip`.
  The external tools also need their native build dependencies. Tool and Gradle
  dependency downloads occur during the first build.
- Obtain Samsung Odin firmware independently and in accordance with its
  license. The required donor is **SM-S948B OXM S948BXXU6ZZKN**. Its `AP`,
  `BL`, and `CSC_OXM` `.tar.md5` files must be in one directory. The donor
  firmware is not included in this repository.
- Obtain the target's **AUT XXUHHXJ1** Odin firmware: `G973FXXUHHXJ1` for S10
  or `G975FXXUHHXJ1` for S10+. Place its `AP`, `BL`, and `CSC_OXM` files in
  `out/odin/SM-G973F_AUT/` or `out/odin/SM-G975F_AUT/`, respectively.

### Clone and prepare firmware

```bash
git clone --branch seventeenqpr2 --recurse-submodules https://github.com/DaDevMikey/OneROM.git
cd OneROM
```

After placing the target Odin files in the appropriate directory, create the
matching marker so the extractor uses the local firmware:

```bash
# S10
printf '%s' 'G973FXXUHHXJ1/G973FOXMHHXJ1/G973FXXUHHXJ1/G973FXXUHHXJ1' > out/odin/SM-G973F_AUT/.downloaded
# S10+; use this instead when preparing beyond2lte
printf '%s' 'G975FXXUHHXJ1/G975FOXMHHXJ1/G975FXXUHHXJ1/G975FXXUHHXJ1' > out/odin/SM-G975F_AUT/.downloaded
```

Alternatively, the downloader can use a matching device identifier supplied
privately as `ONEROM_TARGET_ID`; do not commit it or share build logs containing
it. The downloader may fetch a different firmware revision, so the exact local
Odin files above are recommended for reproducing this build.

### Build commands

Set the donor directory to your own path, then build each target separately:

```bash
export ONEUI95_DONOR_DIR="/absolute/path/to/S948BXXU6ZZKN"
./build.sh beyond1lte --9.5 --release
./build.sh beyond2lte --9.5 --release
```

An already extracted, matching donor in `out/fw/SM-S948B_OXM/` can be reused.
For manual use, set up the environment and call the build script:

```bash
source buildenv.sh beyond1lte --9.5
bash scripts/make_rom.sh --9.5 --release
```

#### Build Flags
- `--debug` : Enables early ADB and USB debugging (`ro.debuggable=1`, `persist.sys.usb.config=mtp,adb`) before `sys.boot_completed` for rapid development and kernel bringup testing.
- `--release` : Default production mode with USB debugging disabled (`ro.debuggable=0`, `persist.sys.usb.config=mtp`).
- `-f, --force` : Force complete re-execution and re-packaging of the ROM.
- `--no-rom-zip` : Extracts and patches partitions without assembling the flashable zip.

The signed ZIP is created in `out/` with the target codename in its name.
See [bugs.md](bugs.md) before testing. These steps do not build the kernel
from source; they package the boot images in `target/<device>/kernel/`.
The matching kernel source and its KernelSU submodule are in the linked
OneKernel branch. Proprietary firmware and prebuilt tools are separate inputs;
see the kernel README for details. Clones without the release signing key use
the public AOSP test key and will not produce byte-identical release ZIPs.

---

## Credits & Upstream Attribution

- **ExtremeROM / ExtremeXT**: For the foundation of the Samsung One UI porting toolkit.
- **UN1CA / Salvo Giangreco**: For the UN1CA modular ROM framework and build tools.
- **Creeeeger**: For the [Exynos 9820 Extreme Kernel](https://github.com/Creeeeger/9820_kernel) CPU/GPU overclock and kernel tree.
- **ArtisanROM**: For the Exynos 9820 kernel lineage and vendor bringup reference.
- **Rodrigo Brown / @rodrigonbrown-rgb**: For stellarRom, Galaxy S10+ (`beyond2lte`) bringup patches, dual front camera punch-hole assets, and Exynos 9820 platform optimizations.
- **KernelSU Next Team**: For modern root support on Android 17.
- **AaronB (`aaronthetechie1`)**: For the updated KernelSU integration,
  wallpaper tilt effect, and help with the face-unlock port.
- **Joshua Malava**: For the original Note10 One UI 9.5 app adapted for S10.
- **OneROM Contributors & @DaManMikey**: For the OneROM port, patches, and native One UI 9 adaptation.

---

## License

This project is licensed under [GNU General Public License v3.0](LICENSE). Upstream components, tools, and proprietary blobs retain their respective licenses and copyrights.
