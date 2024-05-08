DEFAULT_STDLIB_PATH = "/usr/etude-stdlib"

def etude_library(name, module, srcs, deps = [], stdlib_path = DEFAULT_STDLIB_PATH, **kwargs):
    etude_rule_name = "_" + name
    lib = etude_rule_name + ".s"

    native.genrule(
        name = etude_rule_name,
        srcs = srcs,
        outs = [lib],
        cmd = "etc -m {} -l {} | qbe > $@".format(module, stdlib_path),
        **kwargs
    )

    native.cc_library(
        name = name,
        srcs = [lib],
        deps = deps,
    )

def etude_binary(name, module = "", srcs = [], deps = [], stdlib_path = DEFAULT_STDLIB_PATH, **kwargs):
    if srcs != []:
        lib_name = name + "_lib"

        etude_library(lib_name, module, srcs, [], stdlib_path, **kwargs)
        deps += [":" + lib_name]

    native.cc_binary(
        name = name,
        deps = deps
    )
