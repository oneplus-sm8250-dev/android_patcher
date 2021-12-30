#!/bin/bash

ROOT="${PWD}"
REPOSITORIES=(
    'art'
    'bionic'
    'bootable/recovery'
    'build/soong'
    'external/arm-optimized-routines'
    'external/tinycompress'
    'frameworks/av'
    'frameworks/opt/net/ims'
    'hardware/interfaces'
    'hardware/libhardware'
    'hardware/qcom-caf/wlan'
    'hardware/qcom/display'
    'hardware/qcom/media'
    'hardware/qcom/wlan'
    'kernel/configs'
    'packages/apps/Launcher3'
    'packages/apps/PhoneCommon'
    'packages/modules/common'
    'system/libhwbinder'
    'system/libsysprop'
    'system/sepolicy'
    'vendor/qcom/opensource/audio-hal/primary-hal'
    'vendor/qcom/opensource/commonsys-intf/bluetooth'
    'vendor/qcom/opensource/commonsys-intf/display'
    'vendor/qcom/opensource/commonsys/packages/apps/Bluetooth'
    'vendor/qcom/opensource/commonsys/system/bt'
    'vendor/qcom/opensource/core-utils'
    'vendor/qcom/opensource/data-ipa-cfg-mgr'
    'vendor/qcom/opensource/dataservices'
    'vendor/qcom/opensource/power'
    'vendor/qcom/opensource/usb'
    'vendor/qcom/opensource/vibrator'
)

for repository in "${REPOSITORIES[@]}"; do
    cd "${ROOT}/${repository}"

    git am --keep-cr "${ROOT}/patcher/protonaosp/${repository}"/*

    cd "${ROOT}"
done
