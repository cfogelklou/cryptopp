set path=B:\PortableApps\MinGW\bin;B:\PortableApps\MinGW\msys\1.0\bin;%path%
make clean
set CXXFLAGS=-m32
make
mkdir win32
mv *.a win32/
mv *.exe win32/
