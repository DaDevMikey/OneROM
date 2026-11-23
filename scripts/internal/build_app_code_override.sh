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

if [[ "$app_name" == services.jar ]]; then
    face_classes=("$decoded"/smali/com/android/server/biometrics/sensors/face/aidl/S10FaceHal*.smali)
    if [[ -f "${face_classes[0]}" ]]; then
        index=2
        while [[ -d "$decoded/smali_classes$index" ]]; do
            index=$((index + 1))
        done
        face_directory="$decoded/smali_classes$index/com/android/server/biometrics/sensors/face/aidl"
        mkdir -p "$face_directory"
        mv "${face_classes[@]}" "$face_directory/"
    fi
fi

dex_count=0
dex_pids=()
for smali_directory in "$decoded"/smali*; do
    [[ -d "$smali_directory" ]] || continue
    name="$(basename "$smali_directory")"
    if [[ "$name" == smali ]]; then
        dex=classes.dex
    else
        dex="${name#smali_}.dex"
    fi
    smali assemble --api 34 --output "$temporary/$dex" "$smali_directory" &
    dex_pids+=("$!")
    dex_count=$((dex_count + 1))
done
failed=false
for pid in "${dex_pids[@]}"; do
    if ! wait "$pid"; then
        failed=true
    fi
done
if $failed; then
    printf 'DEX assembly failed for %s\n' "$decoded" >&2
    exit 1
fi
test -f "$temporary/classes.dex"
for ((index = 2; index <= dex_count; index++)); do
    if [[ ! -f "$temporary/classes$index.dex" ]]; then
        printf 'Non-contiguous DEX sequence: missing classes%s.dex in %s\n' "$index" "$decoded" >&2
        exit 1
    fi
done
for dex_file in "$temporary"/classes*.dex; do
    if [[ "$(od -An -tx1 -N4 "$dex_file" | tr -d '[:space:]')" != 6465780a ]]; then
        printf 'Invalid DEX header: %s in %s\n' "$(basename "$dex_file")" "$decoded" >&2
        exit 1
    fi
done
if [[ "$app_name" == services.jar ]]; then
    cp -p "$original" "$temporary/services.jar"
    zip -q -d "$temporary/services.jar" 'classes*.dex'
    (
        cd "$temporary"
        zip -q -0 services.jar classes*.dex
    )
    unzip -tq "$temporary/services.jar"
    mv "$temporary/services.jar" "$original"
    if [[ -f "$original.fsv_meta" ]]; then
        DELETE_FROM_WORK_DIR "system" "system/framework/services.jar.fsv_meta"
    fi
    SET_METADATA "system" "system/framework/services.jar" 0 0 644 "u:object_r:system_file:s0"
    exit 0
fi
mkdir -p "$destination"
pushd "$temporary" >/dev/null
zip -q classes.jar classes*.dex
popd >/dev/null
mv "$temporary/classes.jar" "$destination/classes.jar"
sha256sum "$original" | cut -d ' ' -f1 > "$destination/apk.sha256"
SET_METADATA "system" "system/framework/s10-app-overrides" 0 0 755 "u:object_r:system_file:s0"
SET_METADATA "system" "$relative" 0 0 755 "u:object_r:system_file:s0"
SET_METADATA "system" "$relative/classes.jar" 0 0 644 "u:object_r:system_file:s0"
SET_METADATA "system" "$relative/apk.sha256" 0 0 644 "u:object_r:system_file:s0"
echo "/system/framework/s10-app-overrides(/.*)? u:object_r:system_file:s0" >> "$WORK_DIR/configs/file_context-system"