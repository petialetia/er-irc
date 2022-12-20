
main: utils etude
	$(CC) $(CFLAGS) util.s qbeout.s sic.c
	
etude:
	etc | qbe > qbeout.s

utils:
	$(CC) $(CFLAGS) -S util.c sic.c
