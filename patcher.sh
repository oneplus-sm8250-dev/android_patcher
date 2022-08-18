#!/bin/bash

ROOT="${PWD}"
PROTONAOSP=(
    'art'
    'bionic'
    'bootable/recovery'
    'build/soong'
    'external/tinycompress'
    'frameworks/av'
    'frameworks/opt/net/ims'
    'hardware/libhardware'
    'hardware/qcom/display'
    'hardware/qcom/media'
    'hardware/qcom/wlan'
    'packages/apps/Nfc'
    'packages/apps/PhoneCommon'
    'packages/modules/common'
    'system/libhidl'
    'system/libhwbinder'
    'system/libsysprop'
    'vendor/qcom/opensource/audio-hal/primary-hal'
    'vendor/qcom/opensource/commonsys-intf/bluetooth'
    'vendor/qcom/opensource/commonsys/packages/apps/Bluetooth'
    'vendor/qcom/opensource/core-utils'
    'vendor/qcom/opensource/data-ipa-cfg-mgr'
    'vendor/qcom/opensource/dataservices'
    'vendor/qcom/opensource/power'
    'vendor/qcom/opensource/usb'
    'vendor/qcom/opensource/vibrator'
)

ASB0805=(
    'frameworks/av'
    'frameworks/base'
    'frameworks/native'
    'packages/apps/Settings'
    'packages/providers/ContactsProvider'
    'system/bt'
    'vendor/qcom/opensource/commonsys/system/bt'
)

for repository in "${PROTONAOSP[@]}"; do
    cd "${ROOT}/${repository}"

    git am --keep-cr "${ROOT}/patcher/protonaosp/${repository}"/*

    cd "${ROOT}"
done

for repository in "${ASB0805[@]}"; do
    cd "${ROOT}/${repository}"

    git am --keep-cr "${ROOT}/patcher/asb_0805/${repository}"/*

    cd "${ROOT}"
done
