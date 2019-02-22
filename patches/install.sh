#!/bin/bash
cd ../../../..
cd system/core
patch -p1 < ../../device/lenovo/p1m/patches/android_system_core.patch
cd ../..
cd frameworks/native
patch -p1 < ../../device/lenovo/p1m/patches/android_frameworks_native.patch
cd ../..
cd frameworks/base
patch -p1 < ../../device/lenovo/p1m/patches/android_frameworks_base.patch
cd ../..
cd frameworks/av
patch -p1 < ../../device/lenovo/p1m/patches/android_frameworks_av.patch
cd ../..
cd hardware/ril
patch -p1 < ../../device/lenovo/p1m/patches/android_hardware_ril.patch
cd ../..
cd hardware/interfaces
patch -p1 < ../../device/lenovo/p1m/patches/android_hardware_interfaces.patch
cd ../..

