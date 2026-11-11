#!/usr/bin/env python3
# Per-app device spoof in framework.jar: selected packages see a Galaxy S26 Ultra in
# android.os.Build (MODEL/DEVICE/PRODUCT) and in SystemProperties.get() / SemSystemProperties.get()
# for ro.product.*.model/.device/.name.
# Every other process (system_server, camera, fingerprint, RIL, audio, etc.) is untouched.

import os, re, shutil, subprocess, sys, tempfile, zipfile
from pathlib import Path

CLS = "Lcom/android/internal/util/crew/CrewSpoof;"
MODEL, DEVICE, PRODUCT = "SM-S948B", "q3q", "q3qxxx"

PKGS = [
    "com.sec.android.app.samsungapps",         # Galaxy Store
    "com.samsung.android.goodlock",            # Good Lock core
    "com.samsung.android.app.homestar",        # Home Up
    "com.samsung.android.themedesigner",       # Theme Park
    "com.samsung.android.app.cameraassistant", # Camera Assistant
    "com.samsung.android.multistar",           # MultiStar
    "com.samsung.android.keyscafe",            # Keys Cafe
    "com.samsung.android.sidegesturepad",      # One Hand Operation +
    "com.samsung.android.soundassistant",      # SoundAssistant
    "com.samsung.android.pentastic",           # Pentastic
    "com.samsung.android.wonderland",          # Wonderland
    "com.samsung.android.lockstar",            # LockStar
    "com.samsung.android.clockpack",           # ClockFace
    "com.samsung.android.navstar",             # NavStar
    "com.samsung.android.quickstar",           # QuickStar
    "com.samsung.android.notistar",            # NotiStar
    "com.samsung.android.app.routines",        # Modes & Routines
    "com.samsung.android.app.routineplus",     # Routines+
    "com.samsung.android.app.edgetouch",       # Edge Touch
    "com.sec.android.app.launcher",            # One UI Home
]

backups = {}
def die(m):
    for path, old in backups.items():
        path.write_text(old, encoding="utf-8")
    print("  ! " + m + ("  (reverted)" if backups else ""))
    sys.exit(2)

if len(sys.argv) < 3:
    print("Usage: port_appspoof.py <root_smali_dir> <out_list> [src_jar]")
    sys.exit(1)

root = Path(sys.argv[1])
out_list = Path(sys.argv[2])
src_jar = Path(sys.argv[3]) if len(sys.argv) > 3 else None

LIMIT = 65536
MARGIN = 24

dirs = sorted(d for d in root.iterdir() if d.is_dir() and d.name.startswith("smali"))
def find(rel):
    for d in dirs:
        f = d / rel
        if f.is_file():
            return d, f
    return None, None

d_ins, f_ins = find("android/app/Instrumentation.smali")
d_sp, f_sp = find("android/os/SystemProperties.smali")
d_ssp, f_ssp = find("com/samsung/android/os/SemSystemProperties.smali")
if not f_ins:
    die("Instrumentation not found in framework.jar")

# Measure dex usage from source jar if available
usage = {}
baksmali_cmd = shutil.which("baksmali")
if not baksmali_cmd and os.path.exists("/home/mikey/Data/OneROM-Native/out/tools/bin/baksmali"):
    baksmali_cmd = "/home/mikey/Data/OneROM-Native/out/tools/bin/baksmali"

if src_jar and src_jar.is_file() and baksmali_cmd:
    with zipfile.ZipFile(src_jar) as z:
        for name in sorted(z.namelist()):
            if name.startswith("classes") and name.endswith(".dex"):
                folder_name = "smali" if name == "classes.dex" else "smali_" + name[:-4]
                counts = {}
                for kind in ("methods", "fields", "types"):
                    r = subprocess.run([baksmali_cmd, "list", kind, f"{src_jar}/{name}"],
                                       stdout=subprocess.PIPE, stderr=subprocess.DEVNULL, text=True)
                    counts[kind] = len([l for l in r.stdout.splitlines() if l.strip()]) if r.returncode == 0 else LIMIT
                usage[folder_name] = counts

def room(d, methods, fields=0, types=0):
    if not usage:
        return True
    u = usage.get(d.name)
    if not u:
        return True
    return (u["methods"] + methods + MARGIN <= LIMIT and
            u["fields"] + fields + MARGIN <= LIMIT and
            u["types"] + types + MARGIN <= LIMIT)

for d in dirs:
    if d.name in usage:
        u = usage[d.name]
        print(f"      {d.name}: methods={u['methods']} fields={u['fields']} types={u['types']}")

existing = next((d / "com/android/internal/util/crew/CrewSpoof.smali" for d in dirs
                 if (d / "com/android/internal/util/crew/CrewSpoof.smali").is_file()), None)

def pkg_checks():
    s = """    const-string v0, "goodlock"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :yes

"""
    for p in PKGS:
        s += f"""    const-string v0, "{p}"

    invoke-virtual {{v0, p0}}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :yes

"""
    return s

def prop_case(suffix, value, nxt):
    return f"""    const-string v0, "{suffix}"

    invoke-virtual {{p0, v0}}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :{nxt}

    const-string v0, "{value}"

    return-object v0

    :{nxt}
"""

CLASS_SMALI = f""".class public final {CLS}
.super Ljava/lang/Object;
.source "CrewSpoof.java"


# static fields
.field private static volatile sActive:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {{p0}}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static isTarget(Ljava/lang/String;)Z
    .locals 1

    if-nez p0, :check

    const/4 v0, 0x0

    return v0

    :check
{pkg_checks()}    const/4 v0, 0x0

    return v0

    :yes
    const/4 v0, 0x1

    return v0
.end method

.method private static setField(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    :try_start_0
    const-class v0, Landroid/os/Build;

    invoke-virtual {{v0, p0}}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {{v0, v1}}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    const/4 v1, 0x0

    invoke-virtual {{v0, v1, p1}}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {{:try_start_0 .. :try_end_0}} :catch_0

    return-void

    :catch_0
    move-exception v0

    return-void
.end method

.method public static apply(Landroid/content/Context;)V
    .locals 2

    if-nez p0, :has_ctx

    return-void

    :has_ctx
    :try_start_0
    invoke-virtual {{p0}}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Throwable; {{:try_start_0 .. :try_end_0}} :catch_0

    invoke-static {{v0}}, {CLS}->isTarget(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :spoof

    return-void

    :spoof
    const/4 v1, 0x1

    sput-boolean v1, {CLS}->sActive:Z

    const-string v0, "MODEL"

    const-string v1, "{MODEL}"

    invoke-static {{v0, v1}}, {CLS}->setField(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "DEVICE"

    const-string v1, "{DEVICE}"

    invoke-static {{v0, v1}}, {CLS}->setField(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "PRODUCT"

    const-string v1, "{PRODUCT}"

    invoke-static {{v0, v1}}, {CLS}->setField(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :catch_0
    move-exception v0

    return-void
.end method

.method public static prop(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    sget-boolean v0, {CLS}->sActive:Z

    if-eqz v0, :none

    if-eqz p0, :none

    const-string v0, "ro.product."

    invoke-virtual {{p0, v0}}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :none

{prop_case(".model", MODEL, "not_model")}{prop_case(".device", DEVICE, "not_device")}{prop_case(".name", PRODUCT, "none")}:none
    const/4 v0, 0x0

    return-object v0
.end method
"""

def inject(text, sig_re, code_fn, maxlocals):
    m = re.search(r"^\.method " + sig_re + r"\n(?P<body>.*?)^\.end method$", text, re.M | re.S)
    if not m:
        return None
    body = m.group("body")
    if "# crew: appspoof" in body:
        return text
    lm = re.search(r"^(\s*)\.locals (\d+)\n", body, re.M)
    if not lm or int(lm.group(2)) > maxlocals:
        return None
    n = int(lm.group(2))
    new_locals, code = code_fn(n)
    lines = body[lm.end():].split("\n")
    i = 0
    while i < len(lines):
        t = lines[i].strip()
        if t == "":
            i += 1; continue
        if t.startswith(".annotation"):
            while i < len(lines) and lines[i].strip() != ".end annotation":
                i += 1
            i += 1; continue
        if t.startswith(".param"):
            if i + 1 < len(lines) and lines[i + 1].strip().startswith(".annotation"):
                while i < len(lines) and lines[i].strip() != ".end param":
                    i += 1
            i += 1; continue
        break
    head = body[:lm.start()] + f"{lm.group(1)}.locals {new_locals}\n" + "\n".join(lines[:i])
    tail = "\n".join(lines[i:])
    nb = head + ("\n" if head and not head.endswith("\n") else "") + "\n    # crew: appspoof\n" + code + tail
    return text[:m.start("body")] + nb + text[m.end("body"):]

def write(path, text):
    backups.setdefault(path, path.read_text(encoding="utf-8"))
    path.write_text(text, encoding="utf-8")

added = {}
def reserve(d):
    n = added.get(d.name, 0)
    if n == 0 and not room(d, 1, 0, 1):
        return False
    added[d.name] = n + 1
    return True

# Hook Instrumentation.newApplication
if not reserve(d_ins):
    die(f"{d_ins.name} (Instrumentation) has no room for newApplication hook")
t = inject(f_ins.read_text(encoding="utf-8"),
    r"public (?:[a-z-]+ )*newApplication\(Ljava/lang/ClassLoader;Ljava/lang/String;Landroid/content/Context;\)Landroid/app/Application;",
    lambda n: (n, f"    invoke-static {{p3}}, {CLS}->apply(Landroid/content/Context;)V\n\n"), 12)
if t is None:
    die("Instrumentation.newApplication not found or unsupported signature")
write(f_ins, t)

# Hook property getters
PROP_HOOK = lambda n: (n + 1,
    f"    invoke-static {{p0}}, {CLS}->prop(Ljava/lang/String;)Ljava/lang/String;\n\n"
    f"    move-result-object v{n}\n\n    if-eqz v{n}, :crew_sp_orig\n\n    return-object v{n}\n\n    :crew_sp_orig\n")
GETTERS = (r"public static (?:[a-z-]+ )*get\(Ljava/lang/String;\)Ljava/lang/String;",
           r"public static (?:[a-z-]+ )*get\(Ljava/lang/String;Ljava/lang/String;\)Ljava/lang/String;")
hooked = []
for label, d, f in (("SystemProperties", d_sp, f_sp), ("SemSystemProperties", d_ssp, f_ssp)):
    if not f:
        print(f"      - {label}: not found, skipped"); continue
    if not reserve(d):
        print(f"      - {label}: {d.name} is full, skipped"); continue
    t = f.read_text(encoding="utf-8"); ok = 0
    for sig in GETTERS:
        r = inject(t, sig, PROP_HOOK, 12)
        if r is not None:
            t = r; ok += 1
    if ok:
        write(f, t); hooked.append((label, d, f))
    else:
        added[d.name] -= 1

# Placement for CrewSpoof: select candidate dex with the lowest method count (e.g. smali_classes7)
if existing:
    d_cls = existing.parents[5]
else:
    cands = [d for d in dirs if room(d, 16, 2, 12)]
    if not cands:
        die("no framework dex has room for CrewSpoof")
    if usage:
        d_cls = min(cands, key=lambda d: usage.get(d.name, {}).get("methods", LIMIT))
    else:
        # Default to highest numbered smali directory
        d_cls = dirs[-1]
    dst = d_cls / "com/android/internal/util/crew/CrewSpoof.smali"
    dst.parent.mkdir(parents=True, exist_ok=True)
    dst.write_text(CLASS_SMALI, encoding="utf-8")
    existing = dst

smali_cmd = shutil.which("smali")
if not smali_cmd and os.path.exists("/home/mikey/Data/OneROM-Native/out/tools/bin/smali"):
    smali_cmd = "/home/mikey/Data/OneROM-Native/out/tools/bin/smali"

files = [f_ins, existing] + [f for _, _, f in hooked]
if smali_cmd:
    with tempfile.TemporaryDirectory() as t:
        r = subprocess.run([smali_cmd, "a", "-a", "34", "-o", f"{t}/t.dex"] + [str(f) for f in files],
                           stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
        if r.returncode != 0:
            for p, old in backups.items():
                p.write_text(old, encoding="utf-8")
            if existing.is_file() and "CrewSpoof" in existing.name and existing not in backups:
                existing.unlink()
            die("smali assembly validation failed, reverted:\n" + r.stdout[-2000:])

dex_touched = {d_ins.name, d_cls.name} | {d.name for _, d, _ in hooked}
out_list.write_text("".join(sorted(x + "\n" for x in dex_touched)), encoding="utf-8")
print(f"  + Instrumentation ({d_ins.name}), CrewSpoof ({d_cls.name}), props: "
      + (", ".join(f"{l} ({d.name})" for l, d, _ in hooked) or "none"))
print(f"  + S26 Ultra spoofer ({MODEL}/{DEVICE}/{PRODUCT}) enabled for: {', '.join(PKGS)}")
