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

LOCAL_C_INCLUDES := $(LOCAL_PATH)/.. 

LOCAL_C_FLAGS += -O3 -I$ANDROID_NDK_ROOT/sources/cxx-stl/gnu-libstdc++/4.9/include/ -I$ANDROID_NDK_ROOT/sources/cxx-stl/gnu-libstdc++/4.9/libs/$ANDROID_ARCH/include
LOCAL_CFLAGS +=  -O3 -I$ANDROID_NDK_ROOT/sources/cxx-stl/gnu-libstdc++/4.9/include/ -I$ANDROID_NDK_ROOT/sources/cxx-stl/gnu-libstdc++/4.9/libs/$ANDROID_ARCH/include
CXXFLAGS += LOCAL_C_FLAGS
CXXFLAGS += -I/Users/chris/Library/Android/android-ndk-r10e/sources/cxx-stl/gnu-libstdc++/4.9/include/

#################################################################
# Sources, objects and temporaries

# List of sources to compile and objects to link
WIN_SRCS = pch.cpp fipsalgt.cpp cryptlib_bds.cpp winpipes.cpp
SRCS = $(filter-out $(WIN_SRCS), $(wildcard *.cpp))
OBJS = $(SRCS:.cpp=.o)

# Compiling with --save-temps creates these
TEMPS = $(SRCS:.cpp=.s) $(SRCS:.cpp=.ii)

# test.o needs to be after bench.o for cygwin 1.1.4 (possible ld bug?)
TESTOBJS = bench.o bench2.o test.o validat1.o validat2.o validat3.o adhoc.o datatest.o regtest.o fipsalgt.o dlltest.o
LIBOBJS = $(filter-out $(TESTOBJS),$(OBJS))

DLLSRCS = algebra.cpp algparam.cpp asn.cpp basecode.cpp cbcmac.cpp channels.cpp cryptlib.cpp des.cpp dessp.cpp dh.cpp dll.cpp dsa.cpp ec2n.cpp eccrypto.cpp ecp.cpp eprecomp.cpp files.cpp filters.cpp fips140.cpp fipstest.cpp gf2n.cpp gfpcrypt.cpp hex.cpp hmac.cpp integer.cpp iterhash.cpp misc.cpp modes.cpp modexppc.cpp mqueue.cpp nbtheory.cpp oaep.cpp osrng.cpp pch.cpp pkcspad.cpp pubkey.cpp queue.cpp randpool.cpp rdtables.cpp rijndael.cpp rng.cpp rsa.cpp sha.cpp simple.cpp skipjack.cpp strciphr.cpp trdlocal.cpp
DLLOBJS = $(DLLSRCS:.cpp=.export.o)

#################################################################
# Recipes

# For various targets, see https://www.gnu.org/prep/standards/html_node/Standard-Targets.html
# We want to include libcryptopp, cryptest, clean, distclean, install, install-strip, uninstall

all cryptest: cryptest.exe
static: libcryptopp.a
shared dynamic: libcryptopp.so

test: cryptest.exe
	./cryptest.exe v

.PHONY: clean
clean:
	-$(RM) cryptest.exe libcryptopp.a libcryptopp.so GNUmakefile.deps $(LIBOBJS) $(DLLOBJS) $(TESTOBJS)
	-$(RM) -r *.dSYM

.PHONY: install
install:
	$(MKDIR) -p $(PREFIX)/include/cryptopp $(PREFIX)/lib $(PREFIX)/bin
	-$(CP) *.h $(PREFIX)/include/cryptopp
	-$(CP) *.a $(PREFIX)/lib
	-$(CP) *.so $(PREFIX)/lib
	-$(CP) *.exe $(PREFIX)/bin

.PHONY: remove
remove:
	-$(RM) -rf $(PREFIX)/include/cryptopp
	-$(RM) $(PREFIX)/lib/libcryptopp.a
	-$(RM) $(PREFIX)/lib/libcryptopp.so
	-$(RM) $(PREFIX)/bin/cryptest.exe

libcryptopp.a: $(LIBOBJS)
	$(AR) $(ARFLAGS) $@ $(LIBOBJS)
	$(RANLIB) $@

libcryptopp.so: $(LIBOBJS)
	$(CXX) $(CXXFLAGS) -shared -o $@ $(LIBOBJS) $(LDFLAGS) $(LDLIBS)

.PHONY: system.exe
cryptest.exe: libcryptopp.a $(TESTOBJS)
	$(CXX) -o $@ $(CXXFLAGS) $(TESTOBJS) ./libcryptopp.a $(LDFLAGS) $(LDLIBS)

adhoc.cpp: adhoc.cpp.proto
ifeq ($(wildcard adhoc.cpp),)
	cp adhoc.cpp.proto adhoc.cpp
else
	touch adhoc.cpp
endif

.PHONY: system
system: ;
	$(info CXX: $(CXX))
	$(info CXXFLAGS: $(CXXFLAGS))
	$(info LDLIBS: $(LDLIBS))
	$(info GCC_COMPILER: $(GCC_COMPILER))
	$(info CLANG_COMPILER: $(CLANG_COMPILER))
	$(info INTEL_COMPILER: $(INTEL_COMPILER))
	$(info UNALIGNED_ACCESS: $(UNALIGNED_ACCESS))
	$(info UNAME: $(shell $(UNAME) -a))
	$(info MACHINE: $(MACHINE))
	$(info SYSTEM: $(SYSTEM))
	$(info RELEASE: $(RELEASE))

%.o : %.cpp
	$(CXX) $(CXXFLAGS) -c $<


LOCAL_MODULE := cryptopp


LOCAL_SRC_FILES := $(DLLSRCS)

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

