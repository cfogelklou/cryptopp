#!/bin/bash
lipo -create ios_static/armv6/libcryptopp.a ios_static/armv7/libcryptopp.a ios_static/arm64/libcryptopp.a ios_static/x86_64/libcryptopp.a -output ios_static/libcryptopp.a
cd ..
rm libcryptopp.a.ios.zip
zip -9 libcryptopp.a.ios.zip cryptopp/ios_static/libcryptopp.a
