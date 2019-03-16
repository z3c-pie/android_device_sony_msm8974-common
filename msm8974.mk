# Copyright (C) 2014 The CyanogenMod Project
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

COMMON_PATH := device/sony/msm8974-common

# Include HW subsystem-specific makefiles
-include $(LOCAL_PATH)/hardware/*/packages.mk
-include $(LOCAL_PATH)/hardware/*/copy.mk
-include $(LOCAL_PATH)/hardware/*/prop.mk

# Include msm8974-common system properties
-include $(LOCAL_PATH)/systemprop.mk

# AID/fs configs
PRODUCT_PACKAGES += \
    fs_config_files \
    liboemaids

# Apps
PRODUCT_PACKAGES += \
    Snap \
    Jelly

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.primary.msm8974 \
    audio.r_submix.default \
    audio.usb.default \
    audio_policy.msm8974

PRODUCT_PACKAGES += \
    libaudio-resampler \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessingdescriptors \
    libqcomvoiceprocessing \
    tinymix

PRODUCT_PACKAGES += \
    android.hardware.audio@2.0-impl \
    android.hardware.audio.effect@2.0-impl

# Audio configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-service

# Camera (stock blobs)
PRODUCT_PACKAGES += \
    camera.qcom \
    libshim_camera \
    libshim_cald \
    libshims_signal \
    libshims_idd \
    libsonycamera

PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl \
    camera.device@1.0-impl

# Display
PRODUCT_PACKAGES += \
    hwcomposer.msm8974 \
    gralloc.msm8974 \
    copybit.msm8974 \
    memtrack.msm8974 \
    libgenlock \
    libmemalloc \
    liboverlay \
    libqdutils \
    libtilerenderer \
    libI420colorconvert

PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.mapper@2.0-impl \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.composer@2.1-service \
    android.hardware.renderscript@1.0-impl

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl \
    android.hardware.drm@1.0-service

# Dumpstate
PRODUCT_PACKAGES += \
    android.hardware.dumpstate@1.0-service.sony

# FM
PRODUCT_PACKAGES += \
    android.hardware.broadcastradio@1.0-impl

# GNSS
PRODUCT_PACKAGES += \
    android.hardware.gnss@1.1-impl-qti \
    android.hardware.gnss@1.1-service-qti

# GPS
PRODUCT_PACKAGES += \
    libgnss \
    libgnsspps\
    libgps.utils \
    libloc_api_v02 \
    libloc_core \
    libloc_ds_api \
    libloc_pla \
    liblocation_api

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/gps/gps.conf:$(TARGET_COPY_OUT_VENDOR)/etc/gps_debug.conf \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.0-impl \
    android.hardware.health@2.0-service

# Ion
PRODUCT_PACKAGES += \
    libion

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl \
    android.hardware.keymaster@3.0-service

# Lights
PRODUCT_PACKAGES += \
    lights.msm8974

PRODUCT_PACKAGES += \
    android.hardware.light@2.0-impl \
    android.hardware.light@2.0-service

# Media profile
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml \
    $(COMMON_PATH)/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles.xml

# Memtrack
PRODUCT_PACKAGES += \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service

# Net
PRODUCT_PACKAGES += \
    android.system.net.netd@1.0 \
    netutils-wrapper-1.0

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.0-impl \
    android.hardware.nfc@1.0-service

# Omx
PRODUCT_PACKAGES += \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVenc \
    libOmxVdecHevc \
    libc2dcolorconvert \
    libdivxdrmdecrypt \
    libstagefrighthw

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(COMMON_PATH)/overlay \
    $(COMMON_PATH)/overlay-lineage

ifneq ($(BOARD_HAVE_RADIO),false)
    DEVICE_PACKAGE_OVERLAYS += $(COMMON_PATH)/overlay-radio
    $(call inherit-product, $(COMMON_PATH)/radio.mk)
else
    DEVICE_PACKAGE_OVERLAYS += $(COMMON_PATH)/overlay-wifionly
endif

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.ethernet.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.ethernet.xml \
    $(COMMON_PATH)/rootdir/system/vendor/etc/permissions/permissions_sony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/permissions_sony.xml

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.1-service-qti

# Recovery
PRODUCT_PACKAGES += \
    keycheck

# Seccomp
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/seccomp/mediacodec.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy \
    $(LOCAL_PATH)/seccomp/mediaextractor.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediaextractor.policy

# Mobile Data
PRODUCT_PACKAGES += \
    librmnetctl \
    libxml2

# RIL
PRODUCT_PACKAGES += \
    android.hardware.radio@1.0-impl \
    android.hardware.radio.deprecated@1.0-impl

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl \
    android.hardware.sensors@1.0-service

# Thermal
PRODUCT_PACKAGES += \
    thermanager

PRODUCT_PACKAGES += \
    android.hardware.thermal@1.0-impl \
    android.hardware.thermal@1.0-service

# TimeKeep for managing time offsets w.r.t. RTC
PRODUCT_PACKAGES += \
    timekeep \
    TimeKeep

# Trust HAL
PRODUCT_PACKAGES += \
    vendor.lineage.trust@1.0-service

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service.basic

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-impl

# Wifi
PRODUCT_PACKAGES += \
    libwpa_client \
    hostapd \
    wificond \
    wifilogd \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service

# Include non-opensource parts
#$(call inherit-product, vendor/sony/msm8974-common/msm8974-common-vendor.mk)
