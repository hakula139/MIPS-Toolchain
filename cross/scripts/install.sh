#!/bin/bash
path=$( cd "$(dirname "${BASH_SOURCE[0]}")/.."; pwd -P )
flags="-O3 -march=native"
arch="mipsel-unknown-elf"
cd "$path"

mkdir -p build/binutils
cd build/binutils
bash ../../src/binutils-gdb/configure CFLAGS="$flags" CXXFLAGS="$flags" --prefix="$path" --target="$arch" --disable-nls
make -j5
make install

cd ..
mkdir -p gcc-pass-1
cd gcc-pass-1
bash ../../src/gcc/configure CFLAGS="$flags" CXXFLAGS="$flags" --prefix="$path" --target="$arch" --enable-languages=c --without-headers --with-newlib --with-system-zlib --disable-libssp --disable-nls
make -j5
make install

cd ..
mkdir -p newlib
cd newlib
bash ../../src/newlib/configure CFLAGS="$flags" CXXFLAGS="$flags" --prefix="$path" --target="$arch" --disable-nls
make -j5
make install

cd ..
mkdir -p gcc-pass-2
cd gcc-pass-2
bash ../../src/gcc/configure CFLAGS="$flags" CXXFLAGS="$flags" --prefix="$path" --target="$arch" --enable-thumb --enable-interwork --enable-multilib --enable-languages=c --with-system-zlib --disable-nls
make -j5
make install
