#
# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# inherit from the proprietary version
-include vendor/huawei/g630/BoardConfigVendor.mk

LOCAL_PATH := device/huawei/g630

# Platform
TARGET_NO_BOOTLOADER := true

TARGET_BOARD_PLATFORM_GPU := qcom-adreno302
TARGET_BOARD_PLATFORM := msm8610
TARGET_BOOTLOADER_BOARD_NAME := MSM8610

TARGET_ARCH := arm
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := cortex-a7
TARGET_ARCH_VARIANT := armv7-a-neon

TARGET_GLOBAL_CFLAGS += -mtune=cortex-a7 -mfpu=neon-vfpv4 -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a7 -mfpu=neon-vfpv4 -mfloat-abi=softfp

TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

# Inline kernel building
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/kernel
TARGET_KERNEL_SOURCE := kernel/huawei/g630
TARGET_KERNEL_CONFIG := cm_msm8610-perf_defconfig
BOARD_CUSTOM_BOOTIMG_MK := device/huawei/g630/mkbootimg.mk
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_SEPARATED_DT := true
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --tags_offset 0x01E00000

# Audio
TARGET_QCOM_AUDIO_VARIANT := caf
BOARD_USES_ALSA_AUDIO := true
AUDIO_FEATURE_DISABLED_ANC_HEADSET := true
AUDIO_FEATURE_DISABLED_SSR := true
AUDIO_FEATURE_DISABLED_DS1_DOLBY_DDP := true

# Bionic
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth


# Build
TARGET_SYSTEMIMAGE_USE_SQUISHER := true

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS
COMMON_GLOBAL_CFLAGS += -DHUAWEI_MSM8610_CAMERA


# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true

# Dalvik
#TARGET_ARCH_LOWMEM := true

# Graphics
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
TARGET_QCOM_DISPLAY_VARIANT := caf-legacy
TARGET_USES_ION := true
BOARD_EGL_CFG := $(LOCAL_PATH)/prebuilt/system/lib/egl/egl.cfg
USE_OPENGL_RENDERER := true
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024

# CMHW
BOARD_HARDWARE_CLASS := $(LOCAL_PATH)/cmhw/

# Init
TARGET_UNIFIED_DEVICE := true
TARGET_INIT_VENDOR_LIB := libinit_msm

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Media
TARGET_QCOM_MEDIA_VARIANT := caf-legacy
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

#Partition
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 1073741824
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1073741824
BOARD_BOOTIMAGE_PARTITION_SIZE     := 0x00FA0000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00FA0000
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true

# Power
TARGET_POWERHAL_VARIANT := qcom

# QCOM BSP
TARGET_USES_QCOM_BSP := true
COMMON_GLOBAL_CFLAGS += -DQCOM_BSP

# QCOM hardware
BOARD_USES_QCOM_HARDWARE := true
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE

# Recovery
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/recovery/recovery.fstab
TARGET_RECOVERY_INITRC := $(LOCAL_PATH)/recovery/init.rc
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_LCD_BACKLIGHT_PATH := \"/sys/class/leds/lcd-backlight/brightness\"
BOARD_HAS_NO_SELECT_BUTTON := true
DEVICE_RESOLUTION := 720x1280
BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS := true
BOARD_RECOVERY_SWIPE := true

# Time services
BOARD_USES_QC_TIME_SERVICES := true

# Vold
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_MAX_PARTITIONS := 40
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/msm_hsusb/gadget/lun%d/file"
TARGET_USE_CUSTOM_SECOND_LUN_NUM := 1

# Wifi
BOARD_HAS_QCOM_WLAN := true
BOARD_WLAN_DEVICE := qcwcn
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
TARGET_USES_WCNSS_CTRL := true
TARGET_USES_QCOM_WCNSS_QMI := true
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_AP := "ap"
