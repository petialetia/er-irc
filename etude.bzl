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
