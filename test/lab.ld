entry = 0x400000;
ENTRY(entry)

SECTIONS
{
  .               = entry + SIZEOF_HEADERS;
  .text           : { *(.text) }
  .rodata         : { *(.rodata) }
  data_hi_rombase = 0x500000;
  .data.hi        : AT(data_hi_rombase) { *(.data.hi) }
  data_hi_end     = .;
  data_hi_base    = ADDR(.data.hi);
  data_hi_len     = ABSOLUTE(data_hi_end - data_hi_base);
  .data           : { *(.data) }
  data_end        = .;
  data_base       = ADDR(.data);
  data_len        = ABSOLUTE(data_end - data_base);
  .bss            : { *(.bss) }
  /DISCARD/       : { *(.eh_frame .comment) }
}
