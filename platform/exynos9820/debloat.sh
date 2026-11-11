#
# Copyright (C) 2023 Salvo Giangreco
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

# Debloat list for the Exynos 9820 platform
# - Add entries inside the specific partition containing that file (<PARTITION>_DEBLOAT+="")
# - DO NOT add the partition name at the start of any entry (eg. "/system/dpolicy_system")
# - DO NOT add a slash at the start of any entry (eg. "/dpolicy_system")

# Camera SDK
SYSTEM_DEBLOAT+="
system/etc/default-permissions/default-permissions-com.samsung.android.globalpostprocmgr.xml
system/etc/default-permissions/default-permissions-com.samsung.petservice.xml
system/etc/default-permissions/default-permissions-com.samsung.videoscan.xml
system/etc/permissions/cameraservice.xml
system/etc/permissions/privapp-permissions-com.samsung.android.globalpostprocmgr.xml
system/etc/permissions/privapp-permissions-com.samsung.petservice.xml
system/etc/permissions/privapp-permissions-com.samsung.videoscan.xml
system/etc/permissions/sec_camerax_impl.xml
system/etc/permissions/sec_camerax_service.xml
system/framework/sec_camerax_impl.jar
system/framework/scamera_sep.jar
system/priv-app/GlobalPostProcMgr
system/priv-app/PetService
system/priv-app/SCameraSDKService
system/priv-app/sec_camerax_service
system/priv-app/VideoScan
"

# Wi-Fi Hotspot Overlays
PRODUCT_DEBLOAT+="
overlay/SoftapOverlay6GHz
overlay/SoftapOverlayDualAp
overlay/SoftapOverlayOWE
"

# StorageShare (kSMBd)
SYSTEM_DEBLOAT+="
system/bin/ksmbd.addshare
system/bin/ksmbd.adduser
system/bin/ksmbd.control
system/bin/ksmbd.mountd
system/bin/ksmbd.tools
system/etc/default-permissions/default-permissions-com.samsung.android.hwresourceshare.storage.xml
system/etc/init/ksmbd.rc
system/etc/permissions/privapp-permissions-com.samsung.android.hwresourceshare.storage.xml
system/etc/sysconfig/preinstalled-packages-com.samsung.android.hwresourceshare.storage.xml
system/etc/ksmbd.conf
system/priv-app/StorageShare
"

# BudsUniteManager (dead on Exynos 9820, causes Settings ANR and crashes with Galaxy Buds)
SYSTEM_DEBLOAT+="
system/etc/default-permissions/default-permissions-com.samsung.accessory.budsunitemgr.xml
system/etc/sysconfig/preinstalled-packages-com.samsung.accessory.budsunitemgr.xml
system/etc/permissions/privapp-permissions-com.samsung.accessory.budsunitemgr.xml
system/priv-app/BudsUniteManager
"

# MediaSearch & Context Analyzer (takes 358MB and causes search indexing failures)
SYSTEM_DEBLOAT+="
system/etc/mediacontextanalyzer
system/etc/permissions/privapp-permissions-com.samsung.android.mediasearch.xml
system/etc/sysconfig/preinstalled-packages-com.samsung.android.mediasearch.xml
system/priv-app/MediaSearch
"

# Unused S24 FE camera processing blobs (incompatible with Exynos 9820 camera pipeline)
SYSTEM_DEBLOAT+="
system/lib64/libdigital_tele_scope_rawsr.arcsoft.so
"

# Third-party stubs / promo
SYSTEM_DEBLOAT+="
system/app/Netflix_activationCommon
system/app/Netflix_stub
system/app/LinkedIn_SamsungStub
system/app/MSSkype_stub
system/app/Spotify
system/app/SpotifyStub
system/app/AmazonShopping
system/app/Booking
system/app/TikTok_stub
system/priv-app/MSOfficeHub_stub
system/priv-app/Microsoft365_stub
system/preload/Netflix_stub_preload
system/app/SamsungTVPlus
system/priv-app/SamsungTVPlus
system/priv-app/MinusOnePage
system/priv-app/SamsungFree
system/app/Upday
system/app/SamsungGlobalGoals
system/priv-app/SamsungGlobalGoals
system/app/GlobalGoals
system/priv-app/Tips
system/app/Tips
system/priv-app/SamsungMembers
system/app/SamsungMembers
system/priv-app/MateAgent
"

# Telemetry / diagnostics / factory test / non-essential heavy tools
SYSTEM_DEBLOAT+="
system/priv-app/DeviceDiagnostics
system/priv-app/DeviceQualityAgent
system/priv-app/DeviceQualityAgent36
system/priv-app/DeviceQualityAgent38
system/priv-app/DiagMonAgent97
system/priv-app/SEMFactoryApp
system/app/FactoryCameraFB
system/app/FactoryAirCommandManager
system/app/WlanTest
system/app/SilentLog
system/priv-app/AutomationTest_FB
system/app/AutomationTest_FB
system/app/SmartReminder
system/app/SketchBook
system/app/SamsungTTSVoice_en_US_l03
system/app/LiveTranscribe
system/app/VoiceAccess
system/app/FacAtFunction
system/app/ParentalCare
system/app/TalkBack
system/app/HiyaService
system/app/BBCAgent
system/app/DRParser
system/app/DsmsAPK
system/app/AASAservice
system/app/HMT
system/app/AllShareAware
system/app/AllshareMediaShare
"
