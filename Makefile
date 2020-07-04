PROJECT     := lab

# Directories
SRC_PATH    := src/
TEST_PATH   := test/
BUILD_PATH  := build/
BIN_PATH    := bin/

# File paths
MAIN        := $(PROJECT)_main
MAIN_C      := $(TEST_PATH)$(MAIN).c
MAIN_O      := $(BUILD_PATH)$(MAIN).o

ASM         := $(PROJECT)_asm
ASM_S       := $(TEST_PATH)$(ASM).S
ASM_O       := $(BUILD_PATH)$(ASM).o

LD_SCRIPT   := $(SRC_PATH)$(PROJECT).ld

OBJS        := $(MAIN_O) $(ASM_O)
BIN         := $(BIN_PATH)$(PROJECT).bin

# Native toolchain
CC          := gcc
AS          := as

# Cross-compile toolchain
CROSS       := mips-unknown-elf-
CROSS_CC    := $(CROSS)$(CC)
CROSS_AS    := $(CROSS)$(AS)

# Flags
CFLAGS      := -Wall -Wextra -Wconversion -O2 -fno-builtin -march=native -nostdlib
LDFLAGS     := -Wl,--build-id=none -T $(LD_SCRIPT)

# Dependencies
$(MAIN_O): $(MAIN_C)
	$(CC) $(CFLAGS) -c $< -o $@

$(ASM_O): $(ASM_S)
	$(AS) $< -o $@

# Make
.PHONY: lab clean

$(BIN): $(OBJS)
	$(CC) $(CFLAGS) $(LDFLAGS) $^ -o $@

lab: $(BIN)

clean:
	rm -f $(OBJS) $(BIN)
