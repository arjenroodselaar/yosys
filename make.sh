#!/bin/sh

TOOLCHAIN_PREFIX="/usr/local/opt/llvm@6"
CC=clang
CXX=clang++
LD=ldd

INSTALL_PREFIX=$HOME/dev/yosys-toolchain-dbg

mkdir -p $INSTALL_PREFIX/lib $INSTALL_PREFIX/include

export PREFIX=$INSTALL_PREFIX
export CC=$TOOLCHAIN_PREFIX/bin/$CC
export CXX=$TOOLCHAIN_PREFIX/bin/$CXX
export LD=$TOOLCHAIN_PREFIX/bin/$LDD
export CFLAGS="-I$TOOLCHAIN_PREFIX/include"
export CXXFLAGS="-I$TOOLCHAIN_PREFIX/include"
export LDFLAGS="-L$TOOLCHAIN_PREFIX/lib"

make ENABLE_VERIFIC=1 ENABLE_DEBUG=1 ENABLE_NDEBUG=1 -j2 && make install

