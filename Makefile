
main: utils
	$(CC) $(CFLAGS) util.s qbeout.s
	

utils:
	$(CC) $(CFLAGS) -S util.c
