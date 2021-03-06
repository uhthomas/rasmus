load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def dependencies():
    http_archive(
        name = "bazel_gazelle",
        sha256 = "222e49f034ca7a1d1231422cdb67066b885819885c356673cb1f72f748a3c9d4",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/bazel-gazelle/releases/download/v0.22.3/bazel-gazelle-v0.22.3.tar.gz",
            "https://github.com/bazelbuild/bazel-gazelle/releases/download/v0.22.3/bazel-gazelle-v0.22.3.tar.gz",
        ],
    )
    http_archive(
        name = "com_github_bazelbuild_buildtools",
        sha256 = "c28eef4d30ba1a195c6837acf6c75a4034981f5b4002dda3c5aa6e48ce023cf1",
        strip_prefix = "buildtools-4.0.1",
        urls = ["https://github.com/bazelbuild/buildtools/archive/4.0.1.tar.gz"],
    )
    http_archive(
        name = "com_github_google_protobuf",
        sha256 = "2b737d6d120418c443c561cf4032c0141f9626f68f532b5d2c27ee8a191c996e",
        strip_prefix = "protobuf-3.15.8",
        urls = ["https://github.com/protocolbuffers/protobuf/releases/download/v3.15.8/protobuf-all-3.15.8.tar.gz"],
    )
    http_archive(
        name = "rules_proto",
        sha256 = "9fc210a34f0f9e7cc31598d109b5d069ef44911a82f507d5a88716db171615a8",
        strip_prefix = "rules_proto-f7a30f6f80006b591fa7c437fe5a951eb10bcbcf",
        urls = ["https://github.com/bazelbuild/rules_proto/archive/f7a30f6f80006b591fa7c437fe5a951eb10bcbcf.tar.gz"],
    )
    http_archive(
        name = "rules_python",
        sha256 = "778197e26c5fbeb07ac2a2c5ae405b30f6cb7ad1f5510ea6fdac03bded96cc6f",
        urls = ["https://github.com/bazelbuild/rules_python/releases/download/0.2.0/rules_python-0.2.0.tar.gz"],
    )
    http_archive(
        name = "io_bazel_rules_docker",
        sha256 = "95d39fd84ff4474babaf190450ee034d958202043e366b9fc38f438c9e6c3334",
        strip_prefix = "rules_docker-0.16.0",
        urls = ["https://github.com/bazelbuild/rules_docker/releases/download/v0.16.0/rules_docker-v0.16.0.tar.gz"],
    )
    http_archive(
        name = "io_bazel_rules_go",
        sha256 = "7904dbecbaffd068651916dce77ff3437679f9d20e1a7956bff43826e7645fcc",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/v0.25.1/rules_go-v0.25.1.tar.gz",
            "https://github.com/bazelbuild/rules_go/releases/download/v0.25.1/rules_go-v0.25.1.tar.gz",
        ],
    )
