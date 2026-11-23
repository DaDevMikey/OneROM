# S10 Kernel: OneKERNEL+ 9.5

## Overview

OneROM Zeta 9.5 packages **OneKERNEL+ 9.5** for the Samsung Galaxy S10 LTE (`beyond1lte`, Exynos 9820).

- **Kernel Name**: OneKERNEL+ 9.5
- **Kernel Source**: [OneKernel-9820, onerom-zeta-9.5](https://github.com/DaDevMikey/OneKernel-9820/tree/onerom-zeta-9.5)
- **Credits**: Credits to **AaronB** (`aaronthetechie1`) for the kernel fork, KernelSU-Next legacy integration, and Exynos 9820 overclocking work.
- **Upstream Base**: ExtremeKRNL 2.6.5 by Creeeeger ([Creeeeger/9820_kernel](https://github.com/Creeeeger/9820_kernel))
- **Linux Base**: 4.14.356 (openela-rc1)
- **Features**:
  - Exynos 9820 CPU overclock up to 3.04 GHz
  - GPU frequency optimizations (806 MHz GPU default)
  - Integrated KernelSU Next (v3.4.0-legacy, ksuver 33294, UAPI 4)
  - Full compatibility with One UI 9.5 / Android 17 QPR2 on Exynos 9820

## Bundled Kernel Binaries

The repository provides the validated kernel binaries:
- `boot.img`
- `dtb.img`
- `dtbo.img`

Verified checksums are tracked in `SHA256SUMS`.

The source branch includes the matching KernelSU-Next source as a submodule.
Firmware binaries and prebuilt tools are not included in that branch; obtain
the required inputs separately, including `npu/NPU.bin` for the kernel config.
The source snapshot is based on [Creeeeger's upstream tree](https://github.com/Creeeeger/9820_kernel).
