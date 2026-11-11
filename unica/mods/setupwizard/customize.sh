#!/usr/bin/env bash

DECODE_APK "system" "system/priv-app/SecSetupWizard_Global/SecSetupWizard_Global.apk"
python3 "$MODPATH/patch_setupwizard.py" "$APKTOOL_DIR/system/priv-app/SecSetupWizard_Global/SecSetupWizard_Global.apk" "$MODPATH"
