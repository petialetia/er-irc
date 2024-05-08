load(":etude.bzl", "etude_library", "etude_binary")

# -----------------------------------------------------------
# Example 1: etude_binary usage
# -----------------------------------------------------------

etude_binary(
    name = "et-irc",
    module = "main",
    additional_srcs = ["util.et", "commands.et"],
    deps = [":util"],
)

cc_library(
    name = "util",
    srcs = ["util.c", "sic.c"]
)

# -----------------------------------------------------------
# Example 2: etude_library + etude_binary usage
# -----------------------------------------------------------

# etude_binary(
#     name = "et-irc",
#     deps = [":main"]
# )

# etude_library(
#     name = "main",
#     module = "main",
#     additional_srcs = ["util.et", "commands.et"],
#     deps = [":util"],
# )

# cc_library(
#     name = "util",
#     srcs = ["util.c", "sic.c"]
# )

# -----------------------------------------------------------
# Example 3: cc_binary usage right after etude_library
# -----------------------------------------------------------

# cc_binary(
#     name = "et-irc",
#     deps = [":main"]
# )

# etude_library(
#     name = "main",
#     module = "main",
#     additional_srcs = ["util.et", "commands.et"],
#     deps = [":util"],
# )

# cc_library(
#     name = "util",
#     srcs = ["util.c", "sic.c"]
# )

# -----------------------------------------------------------
