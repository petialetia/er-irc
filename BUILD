load(":etude.bzl", "etude_library")

cc_binary(
    name = "et-irc",
    deps = [":util", ":et-irc_lib"]
)

etude_library(
    name = "et-irc_lib",
    srcs = ["main.et", "util.et", "commands.et", "sys.et", "str.et", "memory.et", "parse.et", "mul.et", "maybe.et"]
)

cc_library(
    name = "util",
    srcs = ["util.c", "sic.c"]
)
