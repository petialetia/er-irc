#include <sys/select.h>

void fd_zero(fd_set *rd) { FD_ZERO(rd); }
void fd_set_(int fd, fd_set *rd) { FD_SET(fd, rd); }
int fd_isset(int fd, fd_set *rd) { return FD_ISSET(fd, rd); }

int etude_handle(fd_set *, void *session);

void loop(void *session) {
    fd_set rd;
    while (1) {
        etude_handle(&rd, session);
    }
}
