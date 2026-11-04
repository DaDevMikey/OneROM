#!/usr/bin/env bash
set -euo pipefail

source "$SRC_DIR/scripts/utils/build_utils.sh"
decoded="${1:?decoded APK directory required}"
original="${2:?original signed APK required}"
app_name="$(basename "$original")"
relative="system/framework/s10-app-overrides/$app_name"
destination="$WORK_DIR/system/$relative"
temporary="$(mktemp -d)"
trap 'rm -rf "$temporary"' EXIT
mkdir -p "$destination"

dex_count=0
for smali_directory in "$decoded"/smali*; do
    [[ -d "$smali_directory" ]] || continue
    name="$(basename "$smali_directory")"
    if [[ "$name" == smali ]]; then
        dex=classes.dex
    else
        dex="${name#smali_}.dex"
    fi
    smali assemble --api 34 --output "$temporary/$dex" "$smali_directory"
    dex_count=$((dex_count + 1))
done
test -f "$temporary/classes.dex"
for ((index = 2; index <= dex_count; index++)); do
    if [[ ! -f "$temporary/classes$index.dex" ]]; then
        printf 'Non-contiguous DEX sequence: missing classes%s.dex in %s\n' "$index" "$decoded" >&2
        exit 1
    fi
done
pushd "$temporary" >/dev/null
zip -q classes.jar classes*.dex
popd >/dev/null
mv "$temporary/classes.jar" "$destination/classes.jar"
sha256sum "$original" | cut -d ' ' -f1 > "$destination/apk.sha256"
SET_METADATA "system" "system/framework/s10-app-overrides" 0 0 755 "u:object_r:system_file:s0"
SET_METADATA "system" "$relative" 0 0 755 "u:object_r:system_file:s0"
SET_METADATA "system" "$relative/classes.jar" 0 0 644 "u:object_r:system_file:s0"
SET_METADATA "system" "$relative/apk.sha256" 0 0 644 "u:object_r:system_file:s0"