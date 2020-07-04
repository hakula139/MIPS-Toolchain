.section .text.entry

.global entry
entry:
  call  lab_asm

.text

lab_asm:
  pop   %rdi

  sub   $0x8, %rsp
  call  lab_main

  mov   %rax, %rdi
  call  lab_exit
