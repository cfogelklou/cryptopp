#!/bin/bash
export IOS_ARCH=armv7
export IS_IOS=1
export PLATFORMPATH="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform"
export SDKPATH="$PLATFORMPATH/Developer/SDKs/iPhoneOS.sdk"
export IOS_SYSROOT="$SDKPATH"
export CXXFLAGS=-miphoneos-version-min=6.1
echo IOS_SYSROOT="$IOS_SYSROOT"
make -f GNUmakefile-cross
rm -rf $IOS_ARCH
mkdir $IOS_ARCH
mv *.a $IOS_ARCH/
