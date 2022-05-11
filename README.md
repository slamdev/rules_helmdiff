# Bazel rules for helmdiff

## Installation

Include this in your WORKSPACE file:

```starlark
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "slamdev_rules_helmdiff",
    url = "https://github.com/slamdev/rules_helmdiff/releases/download/0.0.0/slamdev_rules_helmdiff-v0.0.0.tar.gz",
    sha256 = "",
)

load("@slamdev_rules_helmdiff//helmdiff:deps.bzl", "helmdiff_register_toolchains", "rules_helmdiff_dependencies")

rules_helmdiff_dependencies()

helm_register_toolchains(
    name = "helm3_8_0",
    helm_version = "3.8.0",
)
```

> note, in the above, replace the version and sha256 with the one indicated
> in the release notes for rules_helmdiff.
