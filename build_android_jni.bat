REM @echo off
REM This file is used for building the Android JNI from Windows.
REM Note, your NDK must be in the path, or mapped to B:\PortableApps\Android\android-ndk-r10d.
REM This must also be run from a few symbolic links, so that the "path" is
REM   <checkout dir>\app_robovm\android\src\main\jni\app_common_src\minicrypto\cryptopp\jni

set oldpath=%path%
set path=B:\PortableApps\Android\android-ndk-r10e;%path%
RMDIR ..\obj /S /Q
call ndk-build.cmd
copy obj\local\armeabi\*.a ..\..\..\..\staticlib\armeabi\
copy obj\local\armeabi-v7a\*.a ..\..\..\..\staticlib\armeabi-v7a\
copy obj\local\x86\*.a ..\..\..\..\staticlib\x86\
set path=%oldpath%
