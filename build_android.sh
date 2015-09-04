#!/bin/bash
export IS_IOS=0
export IS_ANDROID=1
export ANDROID_ARCH=armeabi
# Setup the environment
. ./setenv-android.sh
export ANDROID_STL_INC=$ANDROID_NDK_ROOT/sources/cxx-stl/gnu-libstdc++/4.9/include/
export CXXFLAGS=-I$ANDROID_NDK_ROOT/sources/cxx-stl/gnu-libstdc++/4.9/libs/$ANDROID_ARCH/include
make -f GNUmakefile-cross clean
make -f GNUmakefile-cross

