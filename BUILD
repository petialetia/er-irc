load(":etude.bzl", "etude_binary")

etude_binary(
    name = "et-irc",
    srcs = ["main.et", "util.et", "commands.et"],
    deps = [":util"],
)

cc_library(
    name = "util",
    srcs = ["util.c", "sic.c"]
)
