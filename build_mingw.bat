set path=B:\PortableApps\MinGW\bin;B:\PortableApps\MinGW\msys\1.0\bin;%path%
make clean
set CXXFLAGS=-m32
make
mkdir win32
cp *.a win32/
cp *.exe win32/
