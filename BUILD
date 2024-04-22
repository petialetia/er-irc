load(":etude.bzl", "etude_library", "etude_binary")

etude_binary(
    name = "et-irc",
    deps = [":util", ":main"]
)

etude_library(
    name = "main",
    srcs = ["main.et", "util.et", "commands.et", "sys.et", "str.et", "memory.et", "parse.et", "mul.et", "maybe.et"],
)

cc_library(
    name = "util",
    srcs = ["util.c", "sic.c"]
)
