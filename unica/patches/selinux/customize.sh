# UN1CA SELinux entries removal list
# - Append new type entries to the ENTRIES list
# - Add the EXACT type entry, DO NOT just add a common pattern (eg. "fabriccrypto", "fabriccrypto_exec" and NOT just "fabriccrypto")
# - DO NOT add the API version at the end of the entry (eg. "fabriccrypto" and NOT "fabriccrypto_30_0")
# - DO NOT add add any parenthesis or statements (eg. "fabriccrypto" and NOT "expanttypeattribute ... (fabriccrypto)")
# - DO NOT add unnecessary types or remove the existing ones unless they aren't necessary anymore for all devices

# One UI 7.0 additions
ENTRIES+="
attiqi_app
attiqi_app_data_file
ker_app
kpp_app
kpp_data_file
"

# One UI 6.1.1 additions
ENTRIES+="
hal_dsms_default
hal_dsms_default_exec
proc_compaction_proactiveness
sbauth
sbauth_exec
"

# One UI 5.1.1 additions
ENTRIES+="
audiomirroring
audiomirroring_exec
audiomirroring_service
fabriccrypto
fabriccrypto_exec
fabriccrypto_data_file
hal_dsms_service
uwb_regulation_skip_prop
"

# One UI 5.0.0 additions
ENTRIES+="
perf_prop
qb_id_prop
teeregistryd_app
"

# [
GET_SYSTEM_EXT()
{
    if $TARGET_HAS_SYSTEM_EXT; then
        echo "system_ext"
    else
        echo "system/system/system_ext"
    fi
}

CIL_NAME="$(head -n 1 "$WORK_DIR/vendor/etc/selinux/plat_sepolicy_vers.txt")"

VENDOR_API_LIST="$(find "$WORK_DIR/$(GET_SYSTEM_EXT)/etc/selinux/mapping" -type f -printf "%f\n" | \
                    sed '/.compat./d' | sed 's/.cil//' | sed 's/\./_/' | sort)"
# ]

for e in $ENTRIES; do
    if grep -q -F "($e)" "$WORK_DIR/$(GET_SYSTEM_EXT)/etc/selinux/mapping/$CIL_NAME.cil" || \
         grep -q -F "${e}_${CIL_NAME//./_}" "$WORK_DIR/$(GET_SYSTEM_EXT)/etc/selinux/mapping/$CIL_NAME.cil"; then
        # the problematic entry is currently present in system_ext, check if we need to remove it
        if ! grep -q -F "(type $e)" "$WORK_DIR/vendor/etc/selinux/plat_pub_versioned.cil"; then
            # the problematic entry is not supported by the target device
            LOG "- \"$e\" SELinux entry not supported. Removing"
            sed -i "/($e)/d" "$WORK_DIR/$(GET_SYSTEM_EXT)/etc/selinux/mapping/$CIL_NAME.cil"
            for a in $VENDOR_API_LIST; do
                sed -i "/${e}_${a}/d" "$WORK_DIR/$(GET_SYSTEM_EXT)/etc/selinux/mapping/$CIL_NAME.cil"
            done
            if grep -q "genfscon.*$e" "$WORK_DIR/$(GET_SYSTEM_EXT)/etc/selinux/system_ext_sepolicy.cil"; then
                sed -i "/genfscon.*$e/d" "$WORK_DIR/$(GET_SYSTEM_EXT)/etc/selinux/system_ext_sepolicy.cil"
            fi
            if grep -q "genfscon.*$e" "$WORK_DIR/system/system/etc/selinux/plat_sepolicy.cil"; then
                sed -i "/genfscon.*$e/d" "$WORK_DIR/system/system/etc/selinux/plat_sepolicy.cil"
            fi
        fi
    fi
done

# Dynamically clean all unsupported mapping statements from mapping CIL files
python3 - "$WORK_DIR" "$CIL_NAME" << 'EOF'
import sys, os, re

work_dir = sys.argv[1]
cil_name = sys.argv[2]

defined = set()
base_candidates = [
    'system/system/etc/selinux/plat_sepolicy.cil',
    'system_ext/etc/selinux/system_ext_sepolicy.cil',
    'system/system/system_ext/etc/selinux/system_ext_sepolicy.cil',
    'product/etc/selinux/product_sepolicy.cil',
    'vendor/etc/selinux/plat_pub_versioned.cil',
    'vendor/etc/selinux/vendor_sepolicy.cil',
    'odm/etc/selinux/odm_sepolicy.cil'
]
for bc in base_candidates:
    full_p = os.path.join(work_dir, bc)
    if os.path.exists(full_p):
        with open(full_p, 'r') as f:
            for line in f:
                sline = line.strip()
                if not sline or sline.startswith(';'): continue
                for m in re.findall(r'\((?:type|typeattribute|typealias)\s+([a-zA-Z0-9_-]+)', sline):
                    defined.add(m)

mapping_candidates = [
    f'system/system/etc/selinux/mapping/{cil_name}.cil',
    f'system_ext/etc/selinux/mapping/{cil_name}.cil',
    f'system/system/system_ext/etc/selinux/mapping/{cil_name}.cil',
    f'product/etc/selinux/mapping/{cil_name}.cil'
]

for mc in mapping_candidates:
    full_p = os.path.join(work_dir, mc)
    if not os.path.exists(full_p): continue
    with open(full_p, 'r') as f:
        lines = f.readlines()
    removed = 0
    clean_lines = []
    for line in lines:
        sline = line.strip()
        if not sline or sline.startswith(';'):
            clean_lines.append(line)
            continue
        m_exp = re.match(r'^\(expandtypeattribute\s+\(([a-zA-Z0-9_-]+)\)', sline)
        if m_exp:
            t = m_exp.group(1)
            if t not in defined:
                removed += 1
                continue
        m_set = re.match(r'^\(typeattributeset\s+([a-zA-Z0-9_-]+)\s+\((.+)\)\)', sline)
        if m_set:
            target = m_set.group(1)
            sources = m_set.group(2).split()
            if target not in defined:
                removed += 1
                continue
            bad = False
            for s in sources:
                s_clean = s.strip('()')
                if s_clean and s_clean not in defined and s_clean not in ['and', 'or', 'not']:
                    bad = True
                    break
            if bad:
                removed += 1
                continue
        clean_lines.append(line)
    if removed > 0:
        with open(full_p, 'w') as f:
            f.writelines(clean_lines)
        print(f'- Removed {removed} unsupported sepolicy mapping statements from {mc}')

# Deduplicate plat_sepolicy.cil
plat_p = os.path.join(work_dir, 'system/system/etc/selinux/plat_sepolicy.cil')
if os.path.exists(plat_p):
    with open(plat_p, 'r') as f:
        plat_lines = f.readlines()
    clean_plat = []
    seen_sys_vend = False
    for line in plat_lines:
        if line.strip() == '(typeattribute system_and_vendor_property_type)':
            if seen_sys_vend:
                continue
            seen_sys_vend = True
        clean_plat.append(line)
    if len(clean_plat) != len(plat_lines):
        with open(plat_p, 'w') as f:
            f.writelines(clean_plat)
        print('- Deduplicated system_and_vendor_property_type in plat_sepolicy.cil')

# Clean duplicate declarations from product_sepolicy.cil
prod_p = os.path.join(work_dir, 'product/etc/selinux/product_sepolicy.cil')
if os.path.exists(prod_p):
    with open(prod_p, 'r') as f:
        prod_lines = f.readlines()
    clean_prod = []
    for line in prod_lines:
        if line.strip() in ['(typeattribute system_and_vendor_property_type)', '(typeattribute cil_gen_require)']:
            continue
        clean_prod.append(line)
    if len(clean_prod) != len(prod_lines):
        with open(prod_p, 'w') as f:
            f.writelines(clean_prod)
        print('- Cleaned duplicate declarations from product_sepolicy.cil')

# Sanitize mac_permissions.xml files (fix Android 17 ignore_mac_permissions_package crash on signer stanzas without seinfo)
import glob, xml.etree.ElementTree as ET
for mac_file in glob.glob(os.path.join(work_dir, '**/etc/selinux/*mac_permissions.xml'), recursive=True):
    try:
        m_tree = ET.parse(mac_file)
        m_root = m_tree.getroot()
        m_changed = False
        for s in m_root.findall('signer'):
            seinfos = s.findall('seinfo')
            packages = s.findall('package')
            if not seinfos and packages:
                val = 'default'
                for p in packages:
                    psi = p.find('seinfo')
                    if psi is not None and psi.attrib.get('value'):
                        val = psi.attrib.get('value')
                        break
                new_se = ET.SubElement(s, 'seinfo')
                new_se.set('value', val)
                for p in packages:
                    s.remove(p)
                m_changed = True
        if m_changed:
            m_tree.write(mac_file, encoding='utf-8', xml_declaration=True)
            print(f'- Sanitized signer stanzas in {os.path.relpath(mac_file, work_dir)}')
    except Exception as e:
        print(f'Failed to sanitize {mac_file}: {e}')
EOF

