path=$( cd "$(dirname "${BASH_SOURCE[0]}")/.."; pwd -P )
cd "$path"

mkdir -p build/binutils
cd build/binutils
bash ../../src/binutils-gdb/configure CFLAGS="-O3 -march=native" CXXFLAGS="-O3 -march=native" --prefix="$path" --target=mips-unknown-elf
