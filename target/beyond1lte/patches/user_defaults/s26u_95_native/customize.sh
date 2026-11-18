# Set persistent property triggers in init.rc
python3 - "$WORK_DIR/system/system/etc/init/hw/init.rc" <<'PY' || return 1
from pathlib import Path
import sys

path = Path(sys.argv[1])
text = path.read_text()
anchor = "    load_persist_props\n"
setting = "    setprop persist.bluetooth.a2dp_offload.disabled true\n"
if text.count(anchor) != 1:
    print("Warning: S10 defaults: could not locate unique load_persist_props anchor")
elif anchor + setting not in text:
    path.write_text(text.replace(anchor, anchor + setting, 1))
PY

SET_METADATA "system" "system/etc/init/s10-user-defaults.rc" 0 0 644 "u:object_r:system_file:s0" || return 1
SET_METADATA "system" "system/etc/s10-user-defaults.sh" 0 0 644 "u:object_r:system_file:s0" || return 1
