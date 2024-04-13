def etude_binary(name, srcs = [], **kwargs):
  native.genrule(
    name = name,
    srcs = srcs,
    outs = [name + ".s"],
    cmd = "etc -m ~/et-irc/main | qbe > $@",
    **kwargs
  )
