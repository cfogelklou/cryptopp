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

#LOCAL_C_FLAGS += -O3 -I$(ANDROID_NDK_ROOT)/sources/cxx-stl/gnu-libstdc++/4.9/include/ -I$(ANDROID_NDK_ROOT)/sources/cxx-stl/gnu-libstdc++/4.9/libs/armeabi/include/
#LOCAL_CFLAGS +=  -O3 -I$(ANDROID_NDK_ROOT)/sources/cxx-stl/gnu-libstdc++/4.9/include/ -I$(ANDROID_NDK_ROOT)/sources/cxx-stl/gnu-libstdc++/4.9/libs/armeabi/include/
LOCAL_C_FLAGS += -O3
LOCAL_CFLAGS +=  -O3

LOCAL_SRC_FILES := 3way.cpp\
	adhoc.cpp\
	adler32.cpp\
	algebra.cpp\
	algparam.cpp\
	arc4.cpp\
	asn.cpp\
	authenc.cpp\
	base32.cpp\
	base64.cpp\
	basecode.cpp\
	bench.cpp\
	bench2.cpp\
	bfinit.cpp\
	blowfish.cpp\
	blumshub.cpp\
	camellia.cpp\
	cast.cpp\
	casts.cpp\
	cbcmac.cpp\
	ccm.cpp\
	channels.cpp\
	cmac.cpp\
	cpu.cpp\
	crc.cpp\
	cryptlib.cpp\
	cryptlib_bds.cpp\
	datatest.cpp\
	default.cpp\
	des.cpp\
	dessp.cpp\
	dh.cpp\
	dh2.cpp\
	dll.cpp\
	dlltest.cpp\
	dsa.cpp\
	eax.cpp\
	ec2n.cpp\
	eccrypto.cpp\
	ecp.cpp\
	elgamal.cpp\
	emsa2.cpp\
	eprecomp.cpp\
	esign.cpp\
	files.cpp\
	filters.cpp\
	fips140.cpp\
	fipsalgt.cpp\
	fipstest.cpp\
	gcm.cpp\
	gf256.cpp\
	gf2_32.cpp\
	gf2n.cpp\
	gfpcrypt.cpp\
	gost.cpp\
	gzip.cpp\
	hex.cpp\
	hmac.cpp\
	hrtimer.cpp\
	ida.cpp\
	idea.cpp\
	integer.cpp\
	iterhash.cpp\
	luc.cpp\
	mars.cpp\
	marss.cpp\
	md2.cpp\
	md4.cpp\
	md5.cpp\
	misc.cpp\
	modes.cpp\
	mqueue.cpp\
	mqv.cpp\
	nbtheory.cpp\
	network.cpp\
	oaep.cpp\
	osrng.cpp\
	panama.cpp\
	pch.cpp\
	pkcspad.cpp\
	polynomi.cpp\
	pssr.cpp\
	pubkey.cpp\
	queue.cpp\
	rabin.cpp\
	randpool.cpp\
	rc2.cpp\
	rc5.cpp\
	rc6.cpp\
	rdtables.cpp\
	regtest.cpp\
	rijndael.cpp\
	ripemd.cpp\
	rng.cpp\
	rsa.cpp\
	rw.cpp\
	safer.cpp\
	salsa.cpp\
	seal.cpp\
	seed.cpp\
	serpent.cpp\
	sha.cpp\
	sha3.cpp\
	shacal2.cpp\
	shark.cpp\
	sharkbox.cpp\
	simple.cpp\
	skipjack.cpp\
	socketft.cpp\
	sosemanuk.cpp\
	square.cpp\
	squaretb.cpp\
	strciphr.cpp\
	tea.cpp\
	test.cpp\
	tftables.cpp\
	tiger.cpp\
	tigertab.cpp\
	trdlocal.cpp\
	ttmac.cpp\
	twofish.cpp\
	validat0.cpp\
	validat1.cpp\
	validat2.cpp\
	validat3.cpp\
	vmac.cpp\
	wait.cpp\
	wake.cpp\
	whrlpool.cpp\
	winpipes.cpp\
	xtr.cpp\
	xtrcrypt.cpp\
	zdeflate.cpp\
	zinflate.cpp\
	zlib.cpp


LOCAL_MODULE := cryptopp



# Uncomment to compile with profiling
#LOCAL_CFLAGS += -pg -D_DO_GPROF_PROFILING
#LOCAL_C_FLAGS += -pg -D_DO_GPROF_PROFILING
#LOCAL_STATIC_LIBRARIES := cpufeatures android-ndk-profiler

LOCAL_STATIC_LIBRARIES := cpufeatures

# for logging
LOCAL_LDLIBS += -llog
# for native asset manager
#LOCAL_LDLIBS    += -landroid


APP_MODULES := cryptopp
#APP_ABI := armeabi x86 armeabi-v7a
#APP_ABI := all

include $(BUILD_SHARED_LIBRARY)
$(call import-module,cpufeatures)

# at the end of Android.mk
#_DO_GPROF_PROFILING more
#$(call import-module,android-ndk-profiler)

