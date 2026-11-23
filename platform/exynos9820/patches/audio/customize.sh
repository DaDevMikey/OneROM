BLOBS_LIST="
lib/android.hardware.audio.common@5.0-util.so
lib/hw/android.hardware.audio.effect@5.0-impl.so
lib/hw/android.hardware.audio@5.0-impl.so
lib64/android.hardware.audio.common@5.0-util.so
lib64/hw/android.hardware.audio.effect@5.0-impl.so
lib64/hw/android.hardware.audio@5.0-impl.so
"
for blob in $BLOBS_LIST
do
    DELETE_FROM_WORK_DIR "vendor" "$blob"
done

LOG_STEP_IN "- Disabling A2DP hardware offload for Bluetooth"
SET_PROP "vendor" "persist.bluetooth.a2dp_offload.disabled" "true"
SET_PROP "vendor" "ro.bluetooth.a2dp_offload.supported" "false"
SET_PROP "vendor" "persist.bluetooth.samsung.a2dp_offload.cap" "none"
LOG_STEP_OUT
