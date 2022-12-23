#!/bin/sh

apt update
apt upgrade -y
apt install cmake make gcc libtool g++
git clone --depth 1 https://github.com/Kazade/kazmath.git
cd kazmath
mkdir build
cd build
cmake -DBUILD_SHARED_LIBS=YES -DKAZMATH_BUILD_JNI_WRAPPER=OFF \
-DKAZMATH_BUILD_GL_UTILS=OFF -DKAZMATH_BUILD_LUA_WRAPPER=OFF \
-DKAZMATH_BUILD_TESTS=OFF ..
make
make install
