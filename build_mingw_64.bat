set oldpath=%path%
set path=B:\PortableApps\mingw-w64\x86_64-4.9.2-posix-seh-rt_v3-rev0\mingw64\bin;B:\PortableApps\MinGW\msys\1.0\bin;%path%
set CXXFLAGS=-m64
make clean
make
mkdir win64
mv *.a win64/
mv *.exe win64/
set path=%oldpath%