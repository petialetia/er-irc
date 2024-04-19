def cut_extension(path):
    return path[:path.rfind(".")]

def _etude_binary_impl(ctx):
    lib = ctx.actions.declare_file(ctx.label.name + ".s")

    srcs = ctx.files.srcs

    ctx.actions.run_shell(
      outputs = [lib],
      inputs = srcs,
      command = "etc -m {} | qbe > {}".format(" ".join([cut_extension(f.path) for f in srcs]), lib.path),
    )

    exe = ctx.actions.declare_file(ctx.label.name + ".out")
    deps = [lib] + ctx.files.deps

    ctx.actions.run_shell(
        inputs = deps,
        outputs = [exe],
        command = "/usr/bin/clang {} -o {}".format(" ".join([f.path for f in deps]), exe.path),
    )

    return [
        DefaultInfo(
            files = depset([exe]),
            executable = exe,
        ),
    ]

etude_binary = rule(
    implementation = _etude_binary_impl,
    attrs = {
        "srcs": attr.label_list(allow_files = [".et"]),
        "deps": attr.label_list(providers = [CcInfo])
    },
    executable = True
)
