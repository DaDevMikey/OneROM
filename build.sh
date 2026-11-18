#!/usr/bin/env bash
#
# OneROM Build Helper
#

set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
cd "$DIR"

TARGET="beyond1lte"
MAKE_ARGS=()

for arg in "$@"; do
    case "$arg" in
        "beyond1lte" | "beyond2lte")
            TARGET="$arg"
            ;;
        *)
            MAKE_ARGS+=("$arg")
            ;;
    esac
done

echo "=========================================================="
echo " Starting OneROM Delta 9.0 Build for $TARGET"
echo " Source Donor: Galaxy S24 FE (SM-S721B / r12s)"
echo " Target Base: ArtisanROM Exynos 9820 HALs / Kernel"
echo " Build Engine: OneROM Native"
echo "=========================================================="
source buildenv.sh "$TARGET"

bash scripts/make_rom.sh "${MAKE_ARGS[@]}"
