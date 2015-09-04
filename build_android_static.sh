#!/bin/bash
export IS_IOS=0
export IS_ANDROID=1

#--------------------------
# Build ARMEABI variant.
#--------------------------
export ANDROID_ARCH=x86
export ANDROID_FLAGS="-D__ANDROID__"

# Setup the environment
. ./setenv-android.sh
export ANDROID_STL_INC=$ANDROID_NDK_ROOT/sources/cxx-stl/gnu-libstdc++/4.9/include/
export CXXFLAGS=-I$ANDROID_NDK_ROOT/sources/cxx-stl/gnu-libstdc++/4.9/libs/$ANDROID_ARCH/include
make -f GNUmakefile-cross clean
make -f GNUmakefile-cross static

# Copy build library into a subdirectory.
rm -rf $ANDROID_ARCH
mkdir $ANDROID_ARCH
cp *.a $ANDROID_ARCH/


#--------------------------
# Build ARMEABI variant.
#--------------------------
export ANDROID_ARCH=armeabi
export ANDROID_FLAGS="-D__ARM_ARCH_5TE__ -D__ANDROID__"

# Setup the environment
. ./setenv-android.sh
export ANDROID_STL_INC=$ANDROID_NDK_ROOT/sources/cxx-stl/gnu-libstdc++/4.9/include/
export CXXFLAGS=-I$ANDROID_NDK_ROOT/sources/cxx-stl/gnu-libstdc++/4.9/libs/$ANDROID_ARCH/include
make -f GNUmakefile-cross clean
make -f GNUmakefile-cross static

# Copy build library into a subdirectory.
rm -rf $ANDROID_ARCH
mkdir $ANDROID_ARCH
cp *.a $ANDROID_ARCH/

