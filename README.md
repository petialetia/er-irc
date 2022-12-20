# Simple irc client written in Etude

**Important:** to build this code you need a working Etude compiler.

- It uses the good old posix select to multiplex connections.
- Some parts concerning the C preprocessor are written in C.

The reference implementation `etc` as well as it's standard library can be
found here: [sr.ht/~orazov_ae/etude](https://git.sr.ht/~orazov_ae/etude)

## Building from sources

```
make
```

Guaranteed to work with the commit
76b149989fe191c8314002f5af41847514f223de in the Etude compiler

