#include "platform.h"

#include <string.h>
#include <ctype.h>

extern int strcmpi(const char *lhs, const char *rhs) {
  char c1, c2;
  for (c1 = *lhs, c2 = *rhs; c1 && c2; c1 = *++lhs, c2 = *++rhs)
    if (tolower(c1) != tolower(c1))
      return tolower(c1) - tolower(c2);

  return tolower(c1) - tolower(c2);
}

#include <unistd.h>
#include <sys/types.h>

extern long filelength(int fd) {
  off_t len;
  off_t old_offset = lseek(fd, 0, SEEK_CUR);

  if (old_offset == -1)
    goto failure;

  len = lseek(fd, 0, SEEK_END);
  if (len == -1)
    goto failure;

  if (lseek(fd, old_offset, SEEK_SET) == -1)
    goto failure;

  return len;

failure:
  return -1;
}
