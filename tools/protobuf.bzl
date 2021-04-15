def elixir_proto_library(name, srcs, **kwargs):
    native.genrule(
        name = name,
        srcs = srcs,
        outs = ["%s.pb.ex" % name],
        cmd = """
            export HOME=$$(pwd)/tmp
            $(location @com_github_google_protobuf//:protoc) --plugin=$(location //third_party:protoc-gen-elixir-gen) --elixir_out=$(GENDIR) $<
        """,
        tools = [
            "//third_party:protoc-gen-elixir-gen",
            "@com_github_google_protobuf//:protoc",
        ],
        **kwargs
    )
