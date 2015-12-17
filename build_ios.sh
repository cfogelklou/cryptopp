#!/bin/bash
export IS_ANDROID=0
export IS_IOS=1

mkdir ios_static

#--------------------------
# Build ARM Variants
#--------------------------
export PLATFORMPATH="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform"
export SDKPATH="$PLATFORMPATH/Developer/SDKs/iPhoneOS.sdk"
export IOS_SYSROOT="$SDKPATH"
export CXXFLAGS="-miphoneos-version-min=6.1 -fembed-bitcode"

#--------------------------
# Build ARM6
#--------------------------
export IOS_ARCH=armv6
make -f GNUmakefile-cross clean
make -f GNUmakefile-cross
rm -rf ios_static/$IOS_ARCH
mkdir ios_static/$IOS_ARCH
mv *.a ios_static/$IOS_ARCH/

#--------------------------
# Build ARM7
#--------------------------
export IOS_ARCH=armv7
make -f GNUmakefile-cross clean
make -f GNUmakefile-cross
rm -rf ios_static/$IOS_ARCH
mkdir ios_static/$IOS_ARCH
mv *.a ios_static/$IOS_ARCH/

#--------------------------
# Build arm64
#--------------------------
export IOS_ARCH=arm64
export IOS_SYSROOT="$SDKPATH"
make -f GNUmakefile-cross clean
make -f GNUmakefile-cross
rm -rf ios_static/$IOS_ARCH
mkdir ios_static/$IOS_ARCH
mv *.a ios_static/$IOS_ARCH/

#--------------------------
# Build Simulator Variants
#--------------------------
export PLATFORMPATH="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform"
export SDKPATH="$PLATFORMPATH/Developer/SDKs/iPhoneSimulator.sdk"
export IOS_SYSROOT="$SDKPATH"
export CXXFLAGS="-mios-simulator-version-min=6.1 -fembed-bitcode"

#--------------------------
# Build simulator x86_64
#--------------------------
export IOS_ARCH=x86_64
make -f GNUmakefile-cross clean
make -f GNUmakefile-cross
rm -rf ios_static/$IOS_ARCH
mkdir ios_static/$IOS_ARCH
mv *.a ios_static/$IOS_ARCH/

#--------------------------
# Build simulator i386
#--------------------------
export IOS_ARCH=i386
make -f GNUmakefile-cross clean
make -f GNUmakefile-cross
rm -rf ios_static/$IOS_ARCH
mkdir ios_static/$IOS_ARCH
mv *.a ios_static/$IOS_ARCH/


lipo -create ios_static/armv6/libcryptopp.a ios_static/armv7/libcryptopp.a ios_static/arm64/libcryptopp.a ios_static/x86_64/libcryptopp.a ios_static/i386/libcryptopp.a -output ios_static/libcryptopp.a
