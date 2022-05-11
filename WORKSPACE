# Declare the local Bazel workspace.
# This is *not* included in the published distribution.
workspace(
    name = "slamdev_rules_helmdiff",
)

load(":internal_deps.bzl", "rules_helmdiff_internal_deps")

# Fetch deps needed only locally for development
rules_helmdiff_internal_deps()

############################################
# Gazelle, for generating bzl_library targets
load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")
load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")

go_rules_dependencies()

go_register_toolchains(version = "1.17.2")

gazelle_dependencies()

load("@slamdev_rules_helm//helm:deps.bzl", "helm_register_toolchains", "rules_helm_dependencies")

rules_helm_dependencies()

helm_register_toolchains(
    name = "helm3_8_0",
    helm_version = "3.8.0",
)

load("//helmdiff:repositories.bzl", "helmdiff_register_toolchains", "rules_helmdiff_dependencies")

# Fetch our "runtime" dependencies which users need as well
rules_helmdiff_dependencies()

helmdiff_register_toolchains(
    name = "helmdiff3_4_2",
    helmdiff_version = "3.4.2",
)
