#!/bin/sh

apk update
apk upgrade
apk add cmake make gcc
cd tmp
git clone --depth 1 https://github.com/Kazade/kazmath.git
cd kazmath
mkdir build
cd build
cmake -DBUILD_SHARED_LIBS=YES ..
make
make install