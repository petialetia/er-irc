def cut_extension(path):
    return path[:path.rfind(".")]

def etude_library(name, srcs, **kwargs):
    etude_rule_name = "_" + name
    lib = etude_rule_name + ".s"

    native.genrule(
        name = etude_rule_name,
        srcs = srcs,
        outs = [lib],
        cmd = "etc -m {} | qbe > $@".format(" ".join([cut_extension(f) for f in srcs])),
        **kwargs
    )

    native.cc_library(
        name = name,
        srcs = [lib]
    )

def etude_binary(name, srcs = [], deps = [], **kwargs):
    if srcs != []:
        lib_name = name + "_lib"

        etude_library(lib_name, srcs, **kwargs)
        deps += [":" + lib_name]

    native.cc_binary(
        name = name,
        deps = deps
    )
