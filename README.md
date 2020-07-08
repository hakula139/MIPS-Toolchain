# MIPS-Toolchain

A prebuilt GNU toolchain for MIPS SoC (mips-unknown-elf).

## Components

Projects included in the toolchain are:

- [GCC](https://gcc.gnu.org): a cross-compiler for C only
- [Binutils](https://www.gnu.org/software/binutils): a suite of tools including linker, assembler, debugger (GDB) and other tools
- [Newlib](https://sourceware.org/newlib): a C library intended for use on embedded systems

## Installation

This toolchain is ready-to-use, but if you wish to build your own toolchain, you may run the following commands:

```bash
cd cross
./scripts/install.sh
```

It's actually a toolchain built for myself, so feel free to modify the arguments in the script if necessary.

## License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](./LICENSE) file for details.
