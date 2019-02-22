#
# Copyright (C) 2015-2016 The CyanogenMod Project
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
LOCAL_PATH := device/lenovo/p1m

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi
PRODUCT_AAPT_PREBUILT_DPI := xhdpi hdpi mdpi

# Product common configurations
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.secure=0 \
    ro.adb.secure=0 \
    camera.disable_zsl_mode=1 \
    persist.service.acm.enable=0 \
    persist.sys.usb.config=mtp,adb \
    ro.allow.mock.location=0 \
    ro.debuggable=1 \
    ro.dalvik.vm.native.bridge=0 \
    ro.mount.fs=EXT4 \
    ro.kernel.android.checkjni=0 \
    ro.telephony.ril.config=fakeiccid \
    ro.com.android.mobiledata=false

# Hardware-specific permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.faketouch.xml:system/etc/permissions/android.hardware.faketouch.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml

# HIDL
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/manifest.xml:$(TARGET_COPY_OUT_VENDOR)/manifest.xml

# Device was launched with M
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.first_api_level=23

# Dalvik heap configurations
$(call inherit-product-if-exists, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Call hwui memory config
$(call inherit-product-if-exists, frameworks/native/build/phone-xhdpi-2048-hwui-memory.mk)

# RIL
PRODUCT_PACKAGES += \
   libccci_util

# Wifi
PRODUCT_PACKAGES += \
   android.hardware.wifi@1.0-service \
   libwpa_client \
   hostapd \
   wificond \
   wpa_supplicant \
   wpa_supplicant.conf \

# USB Hal
PRODUCT_PACKGES += \
    android.hardware.usb@1.0-service.mtk

DEVICE_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay

# Mediatek
PRODUCT_PACKAGES += \
    libstlport

# DRM
PRODUCT_PACKAGES += \
     android.hardware.drm@1.0-impl \
     android.hardware.drm@1.0-service

# RenderScript
PRODUCT_PACKAGES += \
    libRSDriver_mtk \
    android.hardware.renderscript@1.0-impl

# Graphics
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.memtrack@1.0-impl \
    android.hardware.graphics.mapper@2.0-impl

PRODUCT_PACKAGES += \
    libui_ext \
    libgralloc_extra \
    libgui_ext

# Wifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf

PRODUCT_PACKAGES += \
    Stk \
    libem_sensor_jni \
    wmt_loader

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal@1.0-impl \
    android.hardware.thermal@1.0-service \
    thermal_manager \
    thermal.mt6735m

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermal/ht120.mtc:$(TARGET_COPY_OUT_VENDOR)/etc/.tp/.ht120.mtc \
    $(LOCAL_PATH)/configs/thermal/thermal.conf:$(TARGET_COPY_OUT_VENDOR)/etc/.tp/thermal.conf \
    $(LOCAL_PATH)/configs/thermal/thermal.off.conf:$(TARGET_COPY_OUT_VENDOR)/etc/.tp/thermal.off.conf \
    $(LOCAL_PATH)/configs/thermal/thermal_policy:$(TARGET_COPY_OUT_VENDOR)/etc/.tp/.thermal_policy_00

# Ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/fstab.charger:root/fstab.charger \
    $(LOCAL_PATH)/rootdir/fstab.swap:root/fstab.swap \
    $(LOCAL_PATH)/rootdir/ueventd.mt6735.rc:root/ueventd.mt6735.rc \
    $(LOCAL_PATH)/rootdir/init.recovery.mt6735.rc:root/init.recovery.mt6735.rc

# Charger
PRODUCT_PACKAGES += \
    charger_res_images \
    charger

# Shims
PRODUCT_PACKAGES += \
    libmtkshim_gui \
    libmtkshim_audio \
    libmtkshim_camera

# Power
PRODUCT_PACKAGES += \
    power.default \
    power.mt6735m \
    android.hardware.power@1.0-impl

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-service \
    android.hardware.sensors@1.0-impl.mtk \
    android.hardware.sensors@1.0-service.mtk

# Media
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:system/etc/media_codecs_google_video_le.xml \
    $(LOCAL_PATH)/configs/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml

# Keymaster HAL
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl

# GNSS HAL
PRODUCT_PACKAGES += \
    android.hardware.gnss@1.0-impl \
    android.hardware.gnss@1.0-service

# GPS library
PRODUCT_PACKAGES += \
    libcurl

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/agps_profiles_conf2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/agps_profiles_conf2.xml

# Filesystem management tools
PRODUCT_PACKAGES += \
    e2fsck \
    fibmap.f2fs \
    fsck.f2fs \
    mkfs.f2fs \
    make_ext4fs \
    resize2fs \
    setup_fs \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat \
    fsck.ntfs \
    mkfs.ntfs \
    mount.ntfs

PRODUCT_PACKAGES += \
    android.hardware.broadcastradio@1.0-impl \
    libfmjni \
    FMRadio

# AGPS
PRODUCT_PACKAGES += \
    libandroid_net

# Trusted face
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full

# Display
PRODUCT_PACKAGES += \
    libion \
    WallpaperPicker

# Camera
PRODUCT_PACKAGES += \
    libcamera_parameters_mtk \
    libcam.client \
    libmmsdkservice.feature \
    camera.device@1.0-impl \
    camera.device@3.2-impl \
    android.hardware.camera.provider@2.4-service \
    android.hardware.camera.provider@2.4-impl

# Managers
PRODUCT_PACKAGES += \
    hwservicemanager \
    vndservicemanager \
    servicemanager

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-service.mtk

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.mtk

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-service.mtk

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@2.0-impl \
    android.hardware.audio@2.0-service \
    android.hardware.audio.effect@2.0-impl \
    audio.r_submix.default \
    libaudio-resampler \
    libtinyalsa \
    libtinycompress \
    libtinymix \
    libtinyxml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/audio_device.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_device.xml \
    $(LOCAL_PATH)/configs/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml

# Custom charger images
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/charger/res/values/charger/animation.txt:root/res/values/charger/animation.txt \
    $(LOCAL_PATH)/charger/res/images/my_battery_scale.png:root/res/images/my_battery_scale.png \
    $(LOCAL_PATH)/charger/res/images/font_log.png:root/res/images/font_log.png

# Tethering
PRODUCT_PROPERTY_OVERRIDES += \
    net.tethering.noprovisioning=true

# Vendor
$(call inherit-product, vendor/lenovo/p1m/p1m-vendor.mk)
