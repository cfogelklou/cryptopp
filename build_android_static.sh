#!/bin/bash
export IS_IOS=0
export IS_ANDROID=1

mkdir android_static

#--------------------------
# Build x86 variant.
#--------------------------
export ANDROID_ARCH=x86
export _ANDROID_ARCH=arch-x86
export ANDROID_FLAGS="-D__ANDROID__"
export _ANDROID_EABI="x86-4.9"
export _ANDROID_EABI_PREBUILT="i686-linux-android"

# Setup the environment
. ./setenv-android.sh
export ANDROID_STL_INC=$ANDROID_NDK_ROOT/sources/cxx-stl/gnu-libstdc++/4.9/include/
export CXXFLAGS=-I$ANDROID_NDK_ROOT/sources/cxx-stl/gnu-libstdc++/4.9/libs/$ANDROID_ARCH/include

export OLDPATH=$PATH
export PATH=$BINTOOLSPATH:$PATH
make -f GNUmakefile-cross clean
make -f GNUmakefile-cross static
export PATH=$OLDPATH

# Copy build library into a subdirectory.
rm -rf android_static/$ANDROID_ARCH
mkdir android_static/$ANDROID_ARCH
cp *.a android_static/$ANDROID_ARCH/

#--------------------------
# Build ARMEABI variant.
#--------------------------
export ANDROID_ARCH=armeabi
export _ANDROID_ARCH=arch-arm
export ANDROID_FLAGS="-D__ARM_ARCH_5TE__ -D__ANDROID__"
export _ANDROID_EABI="arm-linux-androideabi-4.9"
export _ANDROID_EABI_PREBUILT="arm-linux-androideabi"

# Setup the environment
. ./setenv-android.sh
export ANDROID_STL_INC=$ANDROID_NDK_ROOT/sources/cxx-stl/gnu-libstdc++/4.9/include/
export CXXFLAGS=-I$ANDROID_NDK_ROOT/sources/cxx-stl/gnu-libstdc++/4.9/libs/$ANDROID_ARCH/include
export OLDPATH=$PATH
export PATH=$BINTOOLSPATH:$PATH
make -f GNUmakefile-cross clean
make -f GNUmakefile-cross static
export PATH=$OLDPATH

# Copy build library into a subdirectory.
rm -rf android_static/$ANDROID_ARCH
mkdir android_static/$ANDROID_ARCH
cp *.a android_static/$ANDROID_ARCH/

