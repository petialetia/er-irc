def cut_extension(path):
    return path[:path.rfind(".")]

def _etude_binary_impl(ctx):
    out = ctx.actions.declare_file(ctx.label.name)
    srcs = ctx.files.srcs

    ctx.actions.run_shell(
      outputs = [out],
      inputs = srcs,
      command = "etc -m {} > {}".format(" ".join([cut_extension(f.path) for f in srcs]), out.path),
    )

    return [DefaultInfo(files = depset([out]))]

etude_binary = rule(
    implementation = _etude_binary_impl,
    attrs = {
        "srcs": attr.label_list(allow_files = [".et"]),
        "deps": attr.label_list(providers = [CcInfo])
    },
)
