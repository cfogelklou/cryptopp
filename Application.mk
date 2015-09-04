# Build both ARMv5TE and ARMv7-A machine code.

APP_PLATFORM    := android-18
APP_STL := gnustl_static
APP_CPPFLAGS += -fexceptions -frtti

APP_ABI := all
#APP_ABI := armeabi armeabi-v7a arm64-v8a x86 x86_64 mips mips64
#APP_ABI := armeabi-v7a

# When profiling, just build the arm architectures.
#APP_ABI := armeabi armeabi-v7a
