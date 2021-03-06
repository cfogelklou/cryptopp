# Copyright (C) 2009 The Android Open Source Project
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
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

APP_OPTIM := release

# Get the architecture info
ARCH := $(APP_ABI)

#@echo $(APP_ABI)

LOCAL_C_INCLUDES := $(LOCAL_PATH)/.. \
	$(ANDROID_NDK_ROOT)/sources/cxx-stl/gnu-libstdc++/4.9/include/ \
	$(ANDROID_NDK_ROOT)/sources/cxx-stl/gnu-libstdc++/4.9/libs/$(ARCH)/include/

LOCAL_C_FLAGS += -O3 -DCRYPTOPP_DISABLE_ASM
LOCAL_CFLAGS +=  -O3 -DCRYPTOPP_DISABLE_ASM

LOCAL_SRC_FILES := algebra.cpp algparam.cpp asn.cpp basecode.cpp cbcmac.cpp channels.cpp cpu.cpp cryptlib.cpp default.cpp des.cpp dessp.cpp dh.cpp \
			dll.cpp dsa.cpp ec2n.cpp eccrypto.cpp ecp.cpp emsa2.cpp eprecomp.cpp files.cpp filters.cpp fips140.cpp fipstest.cpp \
			gf2n.cpp gfpcrypt.cpp hex.cpp hmac.cpp hrtimer.cpp integer.cpp iterhash.cpp misc.cpp modes.cpp mqueue.cpp \
			nbtheory.cpp oaep.cpp osrng.cpp pch.cpp pkcspad.cpp pssr.cpp pubkey.cpp queue.cpp randpool.cpp rdtables.cpp \
			rijndael.cpp rng.cpp rsa.cpp sha.cpp simple.cpp skipjack.cpp strciphr.cpp trdlocal.cpp base64.cpp base32.cpp


LOCAL_MODULE := cryptopp

APP_MODULES := cryptopp

include $(BUILD_STATIC_LIBRARY)
