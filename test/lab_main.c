#include <stdint.h>
#include <sys/syscall.h>

__attribute__((__section__(".data.hi")))

int a[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
int b[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};

void lab_exit(int status) {
  asm("syscall" : : "a"(__NR_exit), "D"(status) :);
  return;
}

int lab_main(void* rip) {
  if (((uintptr_t)rip - 5) != 0x400000) return 1;

  extern char data_hi_base[];
  if ((uintptr_t)data_hi_base <= 0x400000) return 2;
  if ((uintptr_t)data_hi_base >= 0x500000) return 3;

  extern char data_hi_rombase[];
  if ((uintptr_t)data_hi_rombase != 0x500000) return 4;

  for (int i = 0; i < 10; ++i) {
    if (((volatile int*)a)[i] != ((volatile int*)b)[i]) return 5;
  }
  return 0;
}
