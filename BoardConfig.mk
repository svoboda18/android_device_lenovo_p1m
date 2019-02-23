#
# Copyright (C) 2016 The CyanogenMod Project
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
#

# Device path
LOCAL_PATH := device/lenovo/p1m

# Dont build seperate vendor img
TARGET_COPY_OUT_VENDOR := system/vendor

# Device board elements
include $(LOCAL_PATH)/board/*.mk

# Device vendor board
-include vendor/lenovo/p1m/BoardConfigVendor.mk

TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

#######################################################################

# Kernel
TARGET_KMODULES := false
BOARD_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK
BOARD_MKBOOTIMG_ARGS := --base 0x40078000 --pagesize 2048 --kernel_offset 0x00008000 --ramdisk_offset 0x03f88000 --second_offset 0x00e88000 --tags_offset 0x0df88000 --board A7010a48
BOARD_KERNEL_PAGESIZE := 2048
TARGET_USES_64_BIT_BINDER := true
TARGET_IS_64_BIT := true
TARGET_KERNEL_SOURCE := kernel/lenovo/p1m
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_CONFIG := p1m_defconfig
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
MTK_APPENDED_DTB_SUPPORT := yes
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 firmware_class.path=/system/vendor/firmware androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x40078000
BOARD_NAME := p1m

# Disable memcpy opt (for audio libraries)
TARGET_CPU_MEMCPY_OPT_DISABLE := true

# LDPRELOAD
TARGET_LDPRELOAD += libmtk_symbols.so

# EGL
BOARD_EGL_CFG := $(LOCAL_PATH)/configs/egl.cfg
USE_OPENGL_RENDERER := true
BOARD_EGL_WORKAROUND_BUG_10194508 := true

# Flags
BOARD_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD

# Gatekeeper
BOARD_USE_SOFT_GATEKEEPER := true

# Fonts
EXTENDED_FONT_FOOTPRINT := true

# Platform
TARGET_BOARD_PLATFORM := mt6735m
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := mt6735m

# Legacy blobs
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true

# Images
TARGET_NO_BOOTLOADER := true

# HIDL
DEVICE_MANIFEST_FILE := $(LOCAL_PATH)/manifest.xml

# Architecture
ARCH := arm64
TARGET_ARCH := arm64
KERNEL_ARCH := arm64
TARGET_KERNEL_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53
TARGET_USES_64_BIT_BINDER := true
TARGET_IS_64_BIT :=true
TARGET_BOARD_SUFFIX := _64
TARGET_CPU_ABI_LIST := arm64-v8a,armeabi-v7a,armeabi
TARGET_CPU_ABI_LIST_32_BIT := armeabi-v7a,armeabi
TARGET_CPU_ABI_LIST_64_BIT := arm64-v8a
TARGET_SUPPORTS_32_BIT_APPS := true
TARGET_SUPPORTS_64_BIT_APPS := true
BOARD_KERNEL_OFFSET := 0x00080000

# Architecture Extensions
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_NEON := true
ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_HAVE_VFP := true

# System.prop
TARGET_SYSTEM_PROP := $(LOCAL_PATH)/system.prop

# Shims
TARGET_LD_SHIM_LIBS := /system/lib/libgui.so|/system/vendor/lib/libmtkshim_gui.so:/system/lib64/libgui.so|/system/vendor/lib64/libmtkshim_gui.so:/system/vendor/lib/hw/audio.primary.mt6735m.so|/system/vendor/lib/libmtkshim_audio.so:/system/vendor/lib64/hw/audio.primary.mt6735m.so|/system/vendor/lib64/libmtkshim_audio.so:/system/vendor/lib/libcam.camadapter.so|/system/vendor/lib/libmtkshim_camera.so:/system/vendor/lib64/libcam.camadapter.so|/system/vendor/lib64/libmtkshim_camera.so

# SELinux
SELINUX_IGNORE_NEVERALLOWS := true
BOARD_SEPOLICY_DIRS := $(LOCAL_PATH)/sepolicy

# Block based ota
# see http://review.cyanogenmod.org/#/c/78849/1/core/Makefile
BLOCK_BASED_OTA := false
