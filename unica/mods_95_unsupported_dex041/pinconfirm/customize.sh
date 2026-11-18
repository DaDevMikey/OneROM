LOCKSETTINGS_SERVICE="$(find "$APKTOOL_DIR/system/framework/services.jar" \
    -type f -path '*/com/android/server/locksettings/LockSettingsService.smali' -printf '%P\n' -quit)"
[ "$LOCKSETTINGS_SERVICE" ] || ABORT "LockSettingsService.smali not found"
SMALI_PATCH "system" "system/framework/services.jar" \
    "$LOCKSETTINGS_SERVICE" "replace" \
    'refreshStoredPinLength(I)Z' \
    'const/4 v0, 0x6' \
    'const/4 v0, 0x4'

SYNTHETIC_PASSWORD="$(find "$APKTOOL_DIR/system/framework/services.jar" \
    -type f -path '*/com/android/server/locksettings/SyntheticPasswordManager.smali' -printf '%P\n' -quit)"
[ "$SYNTHETIC_PASSWORD" ] || ABORT "SyntheticPasswordManager.smali not found"
# shellcheck disable=SC2016
SMALI_PATCH "system" "system/framework/services.jar" \
    "$SYNTHETIC_PASSWORD" "replace" \
    'createLskfBasedProtector(Landroid/service/gatekeeper/IGateKeeperService;Lcom/android/internal/widget/LockscreenCredential;JLcom/android/internal/widget/LockscreenCredential;Lcom/android/server/locksettings/SyntheticPasswordManager$SyntheticPassword;I)J' \
    'const/4 v12, 0x6' \
    'const/4 v12, 0x4'

# shellcheck disable=SC2016
DECODE_APK "system" "system/priv-app/SecSettings/SecSettings.apk"
CHOOSE_LOCK_PASSWORD="$(find "$APKTOOL_DIR/system/priv-app/SecSettings/SecSettings.apk" \
    -type f -path '*/com/android/settings/password/ChooseLockPassword$ChooseLockPasswordFragment.smali' -printf '%P\n' -quit)"
[ "$CHOOSE_LOCK_PASSWORD" ] || ABORT "ChooseLockPassword fragment not found"
SMALI_PATCH "system" "system/priv-app/SecSettings/SecSettings.apk" \
    "$CHOOSE_LOCK_PASSWORD" "replace" \
    'handleNext$2()V' \
    'const/4 v4, 0x6' \
    'const/4 v4, 0x4'
SMALI_PATCH "system" "system/priv-app/SecSettings/SecSettings.apk" \
    "$CHOOSE_LOCK_PASSWORD" "replace" \
    'setAutoPinConfirmOption(IZ)V' \
    'const/4 p2, 0x6' \
    'const/4 p2, 0x4'

unset LOCKSETTINGS_SERVICE SYNTHETIC_PASSWORD CHOOSE_LOCK_PASSWORD
