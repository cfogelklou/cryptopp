# Build both ARMv5TE and ARMv7-A machine code.

APP_PLATFORM    := android-18

# Instruct to use the static GNU STL implementation
APP_STL := gnustl_static
APP_CPPFLAGS += -fexceptions -frtti -std=c++11

#APP_ABI := all
#APP_ABI := armeabi armeabi-v7a arm64-v8a x86 x86_64 mips mips64
APP_ABI := armeabi-v7a armeabi x86

# When profiling, just build the arm architectures.
#APP_ABI := armeabi armeabi-v7a
