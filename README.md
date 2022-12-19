# Simple irc client written in Etude

**Important:** to build this code you need a working Etude compiler.

- It uses the good old posix select to multiplex connections.
- Some parts concerning the C preprocessor are written in C.

The reference implementation `etc` as well as it's standard library can be
found here: [sr.ht/~orazov_ae/etude](https://git.sr.ht/~orazov_ae/etude)

## Building from sources

```
# From the project root
etc old | qbe | as > qbeout.s
gcc -S sic.c
gcc sic.s qbeout.s
./a.out -n etudetester
```

## Video demostration


