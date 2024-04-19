load(":etude.bzl", "etude_binary")

etude_binary(
    name = "et-irc",
    srcs = ["main.et", "util.et", "commands.et", "sys.et", "str.et", "memory.et", "parse.et", "mul.et", "maybe.et"],
    deps = [":util"],
)

cc_library(
    name = "util",
    srcs = ["util.c", "sic.c"]
)
