load(":etude.bzl", "etude_library", "etude_binary")

cc_binary(
    name = "et-irc",
    deps = [":main"]
)

etude_library(
    name = "main",
    srcs = ["main.et", "util.et", "commands.et", "sys.et", "str.et", "memory.et", "parse.et", "mul.et", "maybe.et"],
    deps = [":util"],
)

cc_library(
    name = "util",
    srcs = ["util.c", "sic.c"]
)
