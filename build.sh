#!/usr/bin/env bash
#
# OneROM Build Helper
#

set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
cd "$DIR"

TARGET="beyond1lte"
MAKE_ARGS=()
IS_95=false

for arg in "$@"; do
    case "$arg" in
        "beyond1lte" | "beyond2lte")
            TARGET="$arg"
            ;;
        "--9.5" | "--oneui9.5")
            IS_95=true
            MAKE_ARGS+=("$arg")
            ;;
        *)
            MAKE_ARGS+=("$arg")
            ;;
    esac
done

if $IS_95; then
    DEV_95_DIR="/home/mikey/oneui9.5/output_ZZKN"
    if [[ ! -d "$DEV_95_DIR" ]]; then
        echo "Error: --9.5 is restricted to the developer environment (missing $DEV_95_DIR)" >&2
        exit 1
    fi
    echo "=========================================================="
    echo " Starting OneROM 9.5 Test Build for $TARGET"
    echo " Source Donor: Galaxy S26 Ultra Beta (SM-S948B / S948BXXU6ZZKN / One UI 9.5)"
    echo " Target Base: ArtisanROM Exynos 9820 HALs / Kernel"
    echo " Build Engine: OneROM Native"
    echo " Developer Mode: Private 9.5 Beta Build"
    echo "=========================================================="
    source buildenv.sh "$TARGET" --9.5
else
    echo "=========================================================="
    echo " Starting OneROM Delta 9.0 Build for $TARGET"
    echo " Source Donor: Galaxy S24 FE (SM-S721B / r12s)"
    echo " Target Base: ArtisanROM Exynos 9820 HALs / Kernel"
    echo " Build Engine: OneROM Native"
    echo "=========================================================="
    source buildenv.sh "$TARGET"
fi

bash scripts/make_rom.sh "${MAKE_ARGS[@]}"
