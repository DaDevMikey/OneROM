#!/usr/bin/env python3
import sys
from pathlib import Path
import re

def patch_fota(decoded_dir):
    decoded = Path(decoded_dir)
    if not decoded.is_dir():
        print(f"Error: {decoded} is not a directory", file=sys.stderr)
        return 1

    uc_path = decoded / "smali/com/idm/fotaagent/enabler/ui/updatecheck/UpdateCheckActivity.smali"
    si_path = decoded / "smali/com/idm/fotaagent/scheduler/SchedulerInitiator.smali"

    if not uc_path.is_file():
        matches = list(decoded.glob("**/UpdateCheckActivity.smali"))
        if matches:
            uc_path = matches[0]
        else:
            print("Error: UpdateCheckActivity.smali not found", file=sys.stderr)
            return 1

    if not si_path.is_file():
        matches = list(decoded.glob("**/SchedulerInitiator.smali"))
        if matches:
            si_path = matches[0]
        else:
            print("Error: SchedulerInitiator.smali not found", file=sys.stderr)
            return 1

    # Patch UpdateCheckActivity.runInitByUser()
    uc_code = uc_path.read_text()
    new_run_init = """.method private runInitByUser()V
    .registers 5

    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "io.onerom.tracker.ACTION_CHECK"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    new-instance v1, Landroid/content/ComponentName;

    const-string v2, "io.onerom.tracker"

    const-string v3, "io.onerom.tracker.CheckActivity"

    invoke-direct {v1, v2, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method"""

    uc_code = re.sub(r"\.method private runInitByUser\(\)V.*?\n\.end method", new_run_init, uc_code, flags=re.S)
    uc_path.write_text(uc_code)
    print(f"Patched {uc_path}")

    # Patch SchedulerInitiator.initiateByUser() and initiateByDevice()
    si_code = si_path.read_text()
    new_init_by_user = """.method public initiateByUser()Z
    .registers 5

    :try_start_0
    invoke-static {}, Lcom/idm/fotaagent/IDMApplication;->idmGetContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_1e

    new-instance v1, Landroid/content/Intent;

    const-string v2, "io.onerom.tracker.ACTION_CHECK"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    new-instance v2, Landroid/content/ComponentName;

    const-string v3, "io.onerom.tracker"

    const-string v4, "io.onerom.tracker.CheckActivity"

    invoke-direct {v2, v3, v4}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    const/high16 v2, 0x10000000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :cond_1e

    :cond_1e
    const/4 v0, 0x1

    return v0
.end method"""

    new_init_by_device = """.method public initiateByDevice()V
    .registers 5

    :try_start_0
    invoke-static {}, Lcom/idm/fotaagent/IDMApplication;->idmGetContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_1e

    new-instance v1, Landroid/content/Intent;

    const-string v2, "io.onerom.tracker.ACTION_CHECK_UPDATE"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    new-instance v2, Landroid/content/ComponentName;

    const-string v3, "io.onerom.tracker"

    const-string v4, "io.onerom.tracker.AlarmReceiver"

    invoke-direct {v2, v3, v4}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    invoke-virtual {v0, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :cond_1e

    :cond_1e
    return-void
.end method"""

    si_code = re.sub(r"\.method public initiateByUser\(\)Z.*?\n\.end method", new_init_by_user, si_code, flags=re.S)
    si_code = re.sub(r"\.method public initiateByDevice\(\)V.*?\n\.end method", new_init_by_device, si_code, flags=re.S)
    si_path.write_text(si_code)
    print(f"Patched {si_path}")
    return 0

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: patch_fota.py <decoded_apk_dir>", file=sys.stderr)
        sys.exit(1)
    sys.exit(patch_fota(sys.argv[1]))
