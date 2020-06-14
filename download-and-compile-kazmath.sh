#!/bin/sh

cd tmp
git clone --shallow https://github.com/Kazade/kazmath.git
cd kazmath
mkdir build
cd build
cmake -DBUILD_SHARED_LIBS=YES ..
make
sudo make install