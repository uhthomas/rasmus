workspace(name = "com_github_uhthomas_rasmus")

load("//:deps.bzl", "dependencies")

dependencies()

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")

go_rules_dependencies()

go_register_toolchains(go_version = "1.16.3")

load("@rules_proto//proto:repositories.bzl", "rules_proto_dependencies", "rules_proto_toolchains")

rules_proto_dependencies()

rules_proto_toolchains()

load("@io_bazel_rules_docker//repositories:repositories.bzl", container_repositories = "repositories")

container_repositories()

load("@io_bazel_rules_docker//repositories:deps.bzl", container_deps = "deps")

container_deps()

load("@io_bazel_rules_docker//container:container.bzl", "container_pull")

container_pull(
    name = "io_docker_index_hexpm_elixir",
    # 1.11.4-erlang-23.3.1-ubuntu-focal-20210325
    digest = "sha256:37733e7f5df06059bb4e3b07f5e1b02cd251bc09d3a319a3a58eaa9b2984e19a",
    registry = "index.docker.io",
    repository = "hexpm/elixir",
)

load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")

gazelle_dependencies()
