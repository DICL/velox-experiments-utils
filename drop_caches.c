#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>

// Compile with:
// $ gcc -o drop_caches drop_caches.c
//
// Change permissions:
// $ chown root.wheel drop_caches
// $ chmod 4755 drop_caches

main() {
  system("sync");

  setuid(0);
  int fd = open("/proc/sys/vm/drop_caches", O_WRONLY);
  dprintf(fd, "3");
  close(fd);
}
