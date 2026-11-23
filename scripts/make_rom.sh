#!/usr/bin/env bash
#
# Copyright (C) 2025 Salvo Giangreco
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

set -e

# [
source "$SRC_DIR/scripts/utils/build_utils.sh" || exit 1

FORCE=false
BUILD_ROM=false
BUILD_ZIP=true

START_TIME="$(date +%s)"

SOURCE_FIRMWARE_PATH="$(cut -d "/" -f 1 -s <<< "$SOURCE_FIRMWARE")_$(cut -d "/" -f 2 -s <<< "$SOURCE_FIRMWARE")"
TARGET_FIRMWARE_PATH="$(cut -d "/" -f 1 -s <<< "$TARGET_FIRMWARE")_$(cut -d "/" -f 2 -s <<< "$TARGET_FIRMWARE")"

GET_WORK_DIR_HASH()
{
    find "$SRC_DIR/unica" "$SRC_DIR/target/$TARGET_CODENAME" "$SRC_DIR/platform" -type f -print0 | \
        sort -z | xargs -0 sha1sum | sha1sum | cut -d " " -f 1
}

PREPARE_SCRIPT()
{
    while [ "$#" != 0 ]; do
        case "$1" in
            "-f" | "--force")
                FORCE=true
                ;;
            "--no-rom-zip")
                BUILD_ZIP=false
                ;;
            "--debug")
                export DEBUG=true
                ;;
            "--release")
                export DEBUG=false
                ;;
            "--9.5" | "--oneui9.5")
                export BUILD_ONEUI_95=true
                ;;
            *)
                echo "Usage: make_rom [options]"
                echo " -f, --force : Force build"
                echo " --no-rom-zip : Do not build ROM zip"
                echo " --debug : Enable early ADB & USB debugging for testing"
                echo " --release : Production release (USB debugging off by default)"
                echo " --9.5 : Build One UI 9.5 beta"
                exit 1
                ;;
        esac

        shift
    done
}

PRINT_BUILD_OUTCOME()
{
    local EXIT_CODE="$?"
    local END_TIME
    local ESTIMATED

    END_TIME="$(date +%s)"
    ESTIMATED="$((END_TIME - START_TIME))"

    if [ "$EXIT_CODE" != "0" ]; then
        echo -n -e '\n\033[1;31m'"Build failed "
    else
        echo -n -e '\n\033[1;32m'"Build completed "
    fi
    echo -e "in $((ESTIMATED / 3600))hrs $(((ESTIMATED / 60) % 60))min $((ESTIMATED % 60))sec."'\033[0m\n'
}

PRINT_USAGE()
{
    echo "Usage: make_rom [options]" >&2
    echo " -f, --force : Force ROM build" >&2
    echo " --no-rom-zip : Do not build ROM zip" >&2
    echo " --debug : Enable early ADB & USB debugging for testing" >&2
    echo " --release : Production release (USB debugging off by default)" >&2
    echo " --9.5 : Build One UI 9.5 beta" >&2
}

PREPARE_ONEUI_95_DONOR()
{
    local donor_dir="${ONEUI95_DONOR_DIR:-$ODIN_DIR/SM-S948B_OXM}"
    local cached_dir="$ODIN_DIR/SM-S948B_OXM"
    local extracted="$FW_DIR/SM-S948B_OXM/.extracted"
    local version="S948BXXU6ZZKN"
    local file destination pattern
    local files=()

    if [ -f "$extracted" ]; then
        if [[ "$(cut -d / -f 1 "$extracted")" != "$version" ]]; then
            echo "Error: extracted One UI 9.5 donor is not $version: $extracted" >&2
            return 1
        fi
        return 0
    fi

    if [ ! -d "$donor_dir" ]; then
        echo "Error: donor directory not found: $donor_dir" >&2
        echo "Set ONEUI95_DONOR_DIR to the directory containing the $version Odin files." >&2
        return 1
    fi
    for pattern in "AP_${version}*.tar.md5" "BL_${version}*.tar.md5" "CSC_OXM_S948BOXM6ZZKN*.tar.md5"; do
        mapfile -t files < <(find "$donor_dir" -maxdepth 1 \( -type f -o -type l \) -name "$pattern" -print)
        if [ "${#files[@]}" -ne 1 ] || [ ! -f "${files[0]}" ]; then
            echo "Error: expected exactly one readable $pattern in $donor_dir" >&2
            return 1
        fi
    done

    mkdir -p "$cached_dir"
    for file in "$donor_dir"/*.tar.md5; do
        [ -f "$file" ] || continue
        destination="$cached_dir/$(basename "$file")"
        if [ -e "$destination" ] || [ -L "$destination" ]; then
            if ! [ "$file" -ef "$destination" ]; then
                echo "Error: donor cache already contains a different file: $destination" >&2
                return 1
            fi
        else
            ln -s "$(realpath "$file")" "$destination"
        fi
    done
    if [ -f "$cached_dir/.downloaded" ] &&
            [[ "$(cut -d / -f 1 "$cached_dir/.downloaded")" != "$version" ]]; then
        echo "Error: donor cache marker does not describe $version" >&2
        return 1
    fi
    printf '%s' "$version/OXM/$version/$version" > "$cached_dir/.downloaded"
}
# ]

PREPARE_SCRIPT "$@"

if [[ "${BUILD_ONEUI_95:-false}" == "true" ]]; then
    PREPARE_ONEUI_95_DONOR || exit 1
fi

if $FORCE; then
    BUILD_ROM=true
    [ -d "$WORK_DIR" ] && rm -rf "$WORK_DIR"
else
    if [ -f "$WORK_DIR/.completed" ]; then
        if [[ "$(cat "$WORK_DIR/.completed")" == "$(GET_WORK_DIR_HASH)" ]]; then
            LOGW "No changes have been detected in the build environment"
            BUILD_ROM=false
        else
            LOGW "Changes detected in the build environment"
            BUILD_ROM=true
        fi
    else
        BUILD_ROM=true
    fi
fi

trap 'PRINT_BUILD_OUTCOME' EXIT
trap 'echo' INT

if $BUILD_ROM; then
    [ -d "$APKTOOL_DIR" ] && rm -rf "$APKTOOL_DIR"
    [ -f "$WORK_DIR/.completed" ] && rm -f "$WORK_DIR/.completed"

    if [ ! -f "$FW_DIR/$SOURCE_FIRMWARE_PATH/.extracted" ] || [ ! -f "$FW_DIR/$TARGET_FIRMWARE_PATH/.extracted" ]; then
        NEED_DOWNLOAD=false
        DOWNLOAD_ARGS=()
        if [ ! -f "$FW_DIR/$SOURCE_FIRMWARE_PATH/.extracted" ] && [ ! -f "$ODIN_DIR/$SOURCE_FIRMWARE_PATH/.downloaded" ]; then
            NEED_DOWNLOAD=true
        fi
        if [ ! -f "$FW_DIR/$TARGET_FIRMWARE_PATH/.extracted" ] && [ ! -f "$ODIN_DIR/$TARGET_FIRMWARE_PATH/.downloaded" ]; then
            NEED_DOWNLOAD=true
        fi

        if $NEED_DOWNLOAD; then
            if [ -f "$FW_DIR/$SOURCE_FIRMWARE_PATH/.extracted" ] || [ -f "$ODIN_DIR/$SOURCE_FIRMWARE_PATH/.downloaded" ]; then
                DOWNLOAD_ARGS+=("--ignore-source")
            fi
            if [ -f "$FW_DIR/$TARGET_FIRMWARE_PATH/.extracted" ] || [ -f "$ODIN_DIR/$TARGET_FIRMWARE_PATH/.downloaded" ]; then
                DOWNLOAD_ARGS+=("--ignore-target")
            fi
            LOG_STEP_IN true "Downloading required firmwares"
            "$SRC_DIR/scripts/download_fw.sh" "${DOWNLOAD_ARGS[@]}" || exit 1
            LOG_STEP_OUT
        fi
        LOG_STEP_IN true "Extracting required firmwares"
        "$SRC_DIR/scripts/extract_fw.sh" || exit 1
        LOG_STEP_OUT
    fi

    LOG_STEP_IN true "Creating work dir"
    "$SRC_DIR/scripts/internal/create_work_dir.sh" || exit 1
    LOG_STEP_OUT

    if [ -d "$SRC_DIR/unica/patches" ]; then
        LOG_STEP_IN true "Applying ROM patches"
        "$SRC_DIR/scripts/internal/apply_modules.sh" "$SRC_DIR/unica/patches" || exit 1
        LOG_STEP_OUT
    fi

    if [ -d "$SRC_DIR/platform/$TARGET_PLATFORM/patches" ]; then
        LOG_STEP_IN true "Applying platform patches"
        "$SRC_DIR/scripts/internal/apply_modules.sh" "$SRC_DIR/platform/$TARGET_PLATFORM/patches" || exit 1
        LOG_STEP_OUT
    fi
    if [ -d "$SRC_DIR/target/$TARGET_CODENAME/patches" ]; then
        LOG_STEP_IN true "Applying device patches"
        "$SRC_DIR/scripts/internal/apply_modules.sh" "$SRC_DIR/target/$TARGET_CODENAME/patches" || exit 1
        LOG_STEP_OUT
    fi

    MODS_DIR="$SRC_DIR/unica/mods"
    if $BUILD_ONEUI_95 && [ -d "$SRC_DIR/unica/mods_95" ]; then
        MODS_DIR="$SRC_DIR/unica/mods_95"
    fi

    if [ -d "$MODS_DIR" ]; then
        LOG_STEP_IN true "Applying ROM mods"
        "$SRC_DIR/scripts/internal/apply_modules.sh" "$MODS_DIR" || exit 1
        LOG_STEP_OUT
    fi

    if [ -d "$APKTOOL_DIR" ]; then
        LOG_STEP_IN true "Building APKs/JARs"

        APK_BUILD_PIDS=()
        while IFS= read -r f; do
            f="${f/$APKTOOL_DIR\//}"
            PARTITION="$(cut -d "/" -f 1 -s <<< "$f")"
            if [[ "$PARTITION" == "system" ]]; then
                "$SRC_DIR/scripts/apktool.sh" b "system" "$f" &
            else
                "$SRC_DIR/scripts/apktool.sh" b "$PARTITION" "$(cut -d "/" -f 2- -s <<< "$f")" &
            fi
            APK_BUILD_PIDS+=("$!")
        done < <(find "$APKTOOL_DIR" -type d \( -name "*.apk" -o -name "*.jar" \))

        APK_BUILD_FAILED=false
        for pid in "${APK_BUILD_PIDS[@]}"; do
            if ! wait "$pid"; then
                APK_BUILD_FAILED=true
            fi
        done
        $APK_BUILD_FAILED && exit 1

        LOG_STEP_OUT
    fi

    echo -n "$(GET_WORK_DIR_HASH)" > "$WORK_DIR/.completed"
fi

if [ -n "$GITHUB_ACTIONS" ]; then
    bash "$SRC_DIR/scripts/cleanup.sh" fw kernel
fi

if $BUILD_ZIP; then
    LOG_STEP_IN true "Creating zip"
    "$SRC_DIR/scripts/internal/build_flashable_zip.sh" || exit 1
    LOG_STEP_OUT
fi

exit 0
