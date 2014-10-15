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

# Inherit device configuration
$(call inherit-product, device/semc/es209ra/full_es209ra.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME="Xperia X10" \
    PRODUCT_DEVICE=X10i \
    BUILD_FINGERPRINT="Sony/X10i/X10i:4.4.4/23.0.A.2.93/ovf_Rw:user/release-keys" \
    PRIVATE_BUILD_DESC="X10i-user 4.4.4 23.0.A.2.93 ovf_Rw release-keys"

# Device identifier. This must come after all inclusions
PRODUCT_NAME := cm_es209ra
PRODUCT_DEVICE := es209ra
PRODUCT_GMS_CLIENTID_BASE := android-sonyericsson

# Release name
PRODUCT_RELEASE_NAME := X10i

# Custom tag for unofficial builds
TARGET_UNOFFICIAL_BUILD_ID := Overlay