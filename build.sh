#!/usr/bin/env bash
#
# OneROM Build Helper
#

set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
cd "$DIR"

TARGET="beyond1lte"
MAKE_ARGS=()
IS_95=true

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
    echo "=========================================================="
    echo " Starting OneROM Zeta 9.5 Build for $TARGET"
    echo " Source Donor: Galaxy S26 Ultra Beta (SM-S948B / S948BXXU6ZZKN / Android 17 QPR2 / One UI 9.5)"
    echo " Target Base: ArtisanROM Exynos 9820 HALs / Kernel"
    echo " Build Engine: OneROM Native"
    echo " Channel: Public Testing Beta"
    echo "=========================================================="
    ENV_ARGS=("$TARGET" "--9.5")
    for a in "${MAKE_ARGS[@]}"; do
        [[ "$a" == "--debug" ]] && ENV_ARGS+=("--debug")
    done
    source buildenv.sh "${ENV_ARGS[@]}"
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
