load(":etude.bzl", "etude_library", "etude_binary")

cc_binary(
    name = "et-irc",
    deps = [":main"]
)

etude_library(
    name = "main",
    module = "main",
    srcs = ["main.et", "util.et", "commands.et"],
    deps = [":util"],
)

cc_library(
    name = "util",
    srcs = ["util.c", "sic.c"]
)
