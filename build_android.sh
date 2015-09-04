#!/bin/bash
#export PATH=$PATH:$ANDROID_NDK_ROOT
if [[ $pwd == *"jni"* ]]
then
  echo "ok, we are in jni."
else
  ln -s . jni
  cd jni  
fi
rm -rf ../obj
ndk-build jni


