#include <netdb.h>
#include <netinet/in.h>
#include <sys/socket.h>
#include <memory.h>
#include <unistd.h>

int dial(char *host, char *port) {
  struct addrinfo hints;
  struct addrinfo *res, *r;
  int fd;

  memset(&hints, 0, sizeof hints);
  hints.ai_family = AF_UNSPEC;
  hints.ai_socktype = SOCK_STREAM;

  getaddrinfo(host, port, &hints, &res);

  for (r = res; r; r = r->ai_next) {
    if ((fd = socket(r->ai_family, r->ai_socktype, r->ai_protocol)) == -1)
      continue;

    if (connect(fd, r->ai_addr, r->ai_addrlen) == 0)
      break;

    close(fd);
  }

  freeaddrinfo(res);

  return fd;
}
