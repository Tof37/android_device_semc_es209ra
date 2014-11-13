# Copyright (C) 2014 The Overlay Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
USE_CAMERA_STUB := false

# inherit from the proprietary version
-include vendor/semc/es209ra/BoardConfigVendor.mk

TARGET_SPECIFIC_HEADER_PATH := device/semc/es209ra/include
PREBUILT_FOLDER := device/semc/es209ra/prebuilt

# Platform
TARGET_BOARD_PLATFORM := qsd8k
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
BOARD_USES_ADRENO_200 := true

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a8

# Additional architecture defines
ARCH_ARM_HAVE_NEON := true
ARCH_ARM_HAVE_ARMV7A_BUG := true
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_USE_SCORPION_BIONIC_OPTIMIZATION := true

#This is Qualcomm hardware
BOARD_USES_QCOM_HARDWARE := true
BOARD_NEEDS_MEMORYHEAPPMEM := true
BOARD_USES_LEGACY_RIL := true
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE -DBINDER_COMPAT -DANCIENT_GL
COMMON_GLOBAL_CFLAGS += -DQCOM_LEGACY_OMX
BOARD_USES_QCOM_LIBS := true
TARGET_HAVE_BYPASS := false
TARGET_GRALLOC_USES_ASHMEM := true
TARGET_USES_GENLOCK := true
BOARD_USES_LEGACY_OVERLAY := true

#Graphics
BOARD_EGL_CFG := device/semc/es209ra/config/egl.cfg
USE_OPENGL_RENDERER := true
TARGET_NO_HW_VSYNC := true
TARGET_NO_HW_OVERLAY := true
TARGET_QCOM_DISPLAY_VARIANT := legacy
TARGET_USES_ION := false
BOARD_EGL_NEEDS_LEGACY_FB := true
BOARD_HAVE_HDMI_SUPPORT := false
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true
COMMON_GLOBAL_CFLAGS += -DQCOM_NO_SECURE_PLAYBACK -DUSES_LEGACY_EGL #-DOLD_ION_API #-DQCOM_ICS_COMPAT

# Screenrecord
BOARD_SCREENRECORD_LANDSCAPE_ONLY := false

# Audio
BOARD_USES_GENERIC_AUDIO := false

#GPS
BOARD_USES_QCOM_GPS := true
TARGET_PROVIDES_GPS_LOC_API := false
BOARD_VENDOR_QCOM_AMSS_VERSION := 1240
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := es209ra
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 1240
TARGET_QCOM_GPS_VARIANT := legacy

# WiFi
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WLAN_DEVICE := ath6kl
WIFI_DRIVER_MODULE_PATH := "/modules/ar6000.ko"
WIFI_DRIVER_MODULE_NAME := ar6000
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_ath6kl

#Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/semc/es209ra/bluetooth

#Webkit
ENABLE_WEBGL := true
TARGET_FORCE_CPU_UPLOAD := true
BOARD_USE_QCOM_PMEM := true

# Sensors
#SOMC_CFG_DASH_INCLUDED := yes
SENSORS_COMPASS_AK8973 := true
SENSORS_ACCEL_BMA150_INPUT := true
SENSORS_ACCEL_BMA250_INPUT := false
SENSORS_PROXIMITY_APDS9120 := true
SENSORS_PRESSURE_BMP180 := false

#Use Legacy (PMEM) board
BOARD_USES_LEGACY_OVERLAY := true
BOARD_USES_LEGACY_RIL := true
#BOARD_USES_LEGACY_CAMERA := true

# Kernel
TARGET_KERNEL_SOURCE := kernel/semc/es209ra
TARGET_KERNEL_CONFIG := sde_es209ra_defconfig
TARGET_KERNEL_CUSTOM_TOOLCHAIN := es209ra
TARGET_KERNEL_LOADER := $(PREBUILT_FOLDER)/loader.sin
TARGET_KERNEL_MANIFEST := $(PREBUILT_FOLDER)/manifest.mf
BOARD_KERNEL_CMDLINE := console=null
BOARD_KERNEL_BASE := 0x20000000
TARGET_BOOTLOADER_BOARD_NAME := es209ra
TARGET_RELEASETOOLS_EXTENSIONS := device/semc/es209ra

#Recovery
SKIP_SET_METADATA := true
TARGET_NO_SEPARATE_RECOVERY := true
#BOARD_USES_RECOVERY_CHARGEMODE := false
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_USES_RECOVERY_CHARGEMODE := false
BOARD_CUSTOM_BOOTIMG_MK := device/semc/es209ra/custombootimg.mk
TARGET_RECOVERY_PRE_COMMAND := "/sbin/pre-recovery.sh"
TARGET_RECOVERY_FSTAB := device/semc/es209ra/rootdir/recovery.fstab
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/semc/es209ra/recovery/recovery_keys.c
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/msm_hsusb/gadget/lun0/file"
BOARD_UMS_LUNFILE := "/sys/devices/platform/msm_hsusb/gadget/lun0/file"
BOARD_SDCARD_INTERNAL_DEVICE := /dev/block/mmcblk0p1
TARGET_RECOVERY_DEVICE_DIRS += device/semc/es209ra

# We don't build bootloader and radio
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Boot Animation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

# CM Hardware tunables
BOARD_HARDWARE_CLASS += device/semc/es209ra/cmhw

# Assert
TARGET_OTA_ASSERT_DEVICE := X10i,X10a,es209ra,X10
