LOG_STEP_IN "- Replacing camera blobs"
BLOBS_LIST="
system/lib64/libenn_wrapper_system.so
system/lib64/libpic_best.arcsoft.so
system/lib64/libarcsoft_dualcam_portraitlighting.so
system/lib64/libdualcam_refocus_gallery_54.so
system/lib64/libdualcam_refocus_gallery_48.so
system/lib64/libhybrid_high_dynamic_range.arcsoft.so
system/lib64/libae_bracket_hdr.arcsoft.so
system/lib64/libface_recognition.arcsoft.so
system/lib64/libDualCamBokehCapture.camera.samsung.so
"
for blob in $BLOBS_LIST
do
    DELETE_FROM_WORK_DIR "system" "$blob" &
done

# shellcheck disable=SC2046
wait $(jobs -p) || exit 1

BLOBS_LIST="
system/lib64/libPortraitDistortionCorrectionCali.arcsoft.so
system/lib64/libMultiFrameProcessing10.camera.samsung.so
system/lib64/libMultiFrameProcessing20.camera.samsung.so
system/lib64/libMultiFrameProcessing20Day.camera.samsung.so
system/lib64/libMultiFrameProcessing30.camera.samsung.so
system/lib64/libMultiFrameProcessing30Tuning.camera.samsung.so
system/lib64/vendor.samsung_slsi.hardware.iva@1.0.so
system/lib64/vendor.samsung_slsi.hardware.MultiFrameProcessing20@1.0.so
"
for blob in $BLOBS_LIST
do
    ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "system" "$blob" 0 0 644 "u:object_r:system_lib_file:s0" &
done

# shellcheck disable=SC2046
wait $(jobs -p) || exit 1

LOG_STEP_OUT

LOG_STEP_IN
LOG "- Patching Video SVC Check"
# Early jump after the log and abort functions when configureSVC fails
# b LAB_001dd448 -> b LAB_001ddc24
HEX_PATCH "$WORK_DIR/system/system/lib64/libstagefright.so" "da4a0594e0031a2a22feff17" "da4a0594e0031a2a19000014" || LOGW "Video SVC check pattern not found in libstagefright.so, skipping"

LOG "- Patching HDR10+ Check"
# Skip HDR10+ Recording ASSERT
# cbz this,LAB_001dde38 -> nop
HEX_PATCH "$WORK_DIR/system/system/lib64/libstagefright.so" "010140f90a4d0594604d0034" "010140f90a4d05941f2003d5" || LOGW "HDR10+ check pattern not found in libstagefright.so, skipping"
LOG_STEP_OUT

BLOBS_LIST="
system/lib64/libeden_wrapper_system.so
system/lib64/libsnap_aidl.snap.samsung.so
"
for blob in $BLOBS_LIST
do
    ADD_TO_WORK_DIR "r9sxxx" "system" "$blob" 0 0 644 "u:object_r:system_lib_file:s0"
done
LOG_STEP_OUT

LOG_STEP_IN "- Adding S21 FE (r9sxxx) SWISP models"
DELETE_FROM_WORK_DIR "vendor" "saiv/swisp_1.0"
ADD_TO_WORK_DIR "r9sxxx" "vendor" "saiv/swisp_1.0"

BLOBS_LIST="
system/lib64/libSwIsp_core.camera.samsung.so
system/lib64/libSwIsp_wrapper_v1.camera.samsung.so
"
for blob in $BLOBS_LIST
do
    ADD_TO_WORK_DIR "r9sxxx" "system" "$blob" 0 0 644 "u:object_r:system_lib_file:s0" &
done
LOG_STEP_OUT

LOG_STEP_IN "- Adding A26 (a26xxx) Polarr SDK blobs"
ADD_TO_WORK_DIR "a26xxx" "system" "system/etc/public.libraries-polarr.txt" 0 0 644 "u:object_r:system_file:s0"
ADD_TO_WORK_DIR "a26xxx" "system" "system/lib64/libBestComposition.polarr.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "a26xxx" "system" "system/lib64/libFeature.polarr.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "a26xxx" "system" "system/lib64/libTracking.polarr.so" 0 0 644 "u:object_r:system_lib_file:s0"
LOG_STEP_OUT

LOG_STEP_IN "- Cleaning SamsungCamera OAT"
DELETE_FROM_WORK_DIR "system" "system/priv-app/SamsungCamera/oat"
DELETE_FROM_WORK_DIR "system" "system/priv-app/SamsungCamera/SamsungCamera.apk.prof"
DELETE_FROM_WORK_DIR "system" "system/app/FilterProvider/oat"
LOG_STEP_OUT

LOG_STEP_IN "- Fixing AI Photo Editor"
cp -a --preserve=all \
    "$WORK_DIR/system/system/cameradata/portrait_data/single_bokeh_feature.json" \
    "$WORK_DIR/system/system/cameradata/portrait_data/nexus_bokeh_feature.json"
SET_METADATA "system" "system/cameradata/portrait_data/nexus_bokeh_feature.json" 0 0 644 "u:object_r:system_file:s0"
sed -i "s/MODEL_TYPE_INSTANCE_CAPTURE/MODEL_TYPE_OBJ_INSTANCE_CAPTURE/g" \
    "$WORK_DIR/system/system/cameradata/portrait_data/single_bokeh_feature.json"
sed -i \
    's/system\/cameradata\/portrait_data\/single_bokeh_feature.json/system\/cameradata\/portrait_data\/nexus_bokeh_feature.json\x00/g' \
    "$WORK_DIR/system/system/lib64/libPortraitSolution.camera.samsung.so"
LOG_STEP_OUT

LOG_STEP_IN "- Adding S21 FE (r9sxxx) SingleTake models"
DELETE_FROM_WORK_DIR "vendor" "etc/singletake"
ADD_TO_WORK_DIR "r9sxxx" "vendor" "etc/singletake"

BLOBS_LIST="
system/priv-app/SingleTakeService/SingleTakeService.apk
system/cameradata/singletake/service-feature.xml
"
for blob in $BLOBS_LIST
do
    ADD_TO_WORK_DIR "r9sxxx" "system" "$blob" 0 0 644 "u:object_r:system_file:s0" &
done

# shellcheck disable=SC2046
wait $(jobs -p) || exit 1

LOG_STEP_IN "- Configuring One UI 6 SamsungCamera"
local CAM_APK="$WORK_DIR/system/system/priv-app/SamsungCamera/SamsungCamera.apk"
if [ -f "$CAM_APK" ]; then
    zip -d "$CAM_APK" "META-INF/*" > /dev/null 2>&1 || true

    if [[ "$TARGET_CODENAME" == "beyond2lte" ]]; then
        LOG "- Adding stock cutout assets for beyond2lte"
        local TMP_DIR
        TMP_DIR=$(mktemp -d)
        mkdir -p "$TMP_DIR/res/raw"
        cp -a "$MODPATH/assets/lottie_camera_punchcut_timer_b2.json" "$TMP_DIR/res/raw/lottie_camera_punchcut_timer_b0.json"
        cp -a "$MODPATH/assets/face_unlocking_cutout_ic_b2.json" "$TMP_DIR/res/raw/face_unlocking_cutout_ic_b0.json"
        zip -d "$CAM_APK" "res/raw/lottie_camera_punchcut_timer_b0.json" "res/raw/face_unlocking_cutout_ic_b0.json" > /dev/null 2>&1 || true
        (cd "$TMP_DIR" && zip -0 "$CAM_APK" res/raw/lottie_camera_punchcut_timer_b0.json res/raw/face_unlocking_cutout_ic_b0.json > /dev/null)
        rm -rf "$TMP_DIR"
    elif [[ "$TARGET_CODENAME" == "beyondx" ]]; then
        LOG "- Adding stock cutout assets for beyondx"
        local TMP_DIR
        TMP_DIR=$(mktemp -d)
        mkdir -p "$TMP_DIR/res/raw"
        cp -a "$MODPATH/assets/lottie_camera_punchcut_timer_bx.json" "$TMP_DIR/res/raw/lottie_camera_punchcut_timer_b0.json"
        cp -a "$MODPATH/assets/face_unlocking_cutout_ic_bx.json" "$TMP_DIR/res/raw/face_unlocking_cutout_ic_b0.json"
        zip -d "$CAM_APK" "res/raw/lottie_camera_punchcut_timer_b0.json" "res/raw/face_unlocking_cutout_ic_b0.json" > /dev/null 2>&1 || true
        (cd "$TMP_DIR" && zip -0 "$CAM_APK" res/raw/lottie_camera_punchcut_timer_b0.json res/raw/face_unlocking_cutout_ic_b0.json > /dev/null)
        rm -rf "$TMP_DIR"
    fi

    local CERT_PREFIX="aosp"
    $ROM_IS_OFFICIAL && CERT_PREFIX="extremerom"

    LOG "- Signing SamsungCamera.apk"
    signapk "$SRC_DIR/security/${CERT_PREFIX}_platform.x509.pem" "$SRC_DIR/security/${CERT_PREFIX}_platform.pk8" "$CAM_APK" "$CAM_APK.signed"
    zipalign -p -f 4 "$CAM_APK.signed" "$CAM_APK"
    rm -f "$CAM_APK.signed"

    SET_METADATA "system" "system/priv-app/SamsungCamera" 0 0 755 "u:object_r:system_file:s0"
    SET_METADATA "system" "system/priv-app/SamsungCamera/SamsungCamera.apk" 0 0 644 "u:object_r:system_file:s0"
fi
LOG_STEP_OUT
