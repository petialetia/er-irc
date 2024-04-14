def _etude_binary_impl(ctx):
    out = ctx.actions.declare_file(ctx.label.name + ".s")
    ctx.actions.write(
        output = out,
        content = "Hello {}!\n".format("test"),
    )
    return [DefaultInfo(files = depset([out]))]

etude_binary = rule(
    implementation = _etude_binary_impl,
    attrs = {
        "srcs": attr.label_list(allow_files = [".et"]),
        "deps": attr.label_list(providers = [CcInfo])
    },
)
