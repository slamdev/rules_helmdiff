"helmdiff_upgrade rule"

load("@bazel_skylib//lib:paths.bzl", "paths")

_DOC = "Defines a helmdiff upgrade execution."

_ATTRS = {
    "allow_unreleased": attr.bool(
        doc = "Enables diffing of releases that are not yet deployed via Helm",
    ),
    "api_versions": attr.string_list(
        doc = "Kubernetes api versions used for Capabilities.APIVersions",
    ),
    "chart": attr.label(
        doc = "The label of the chart",
        allow_single_file = True,
        mandatory = True,
    ),
    "context": attr.int(
        doc = "Output NUM lines of context around changes",
        default = -1,
    ),
    "detailed_exitcode": attr.bool(
        doc = "Return a non-zero exit code when there are changes",
    ),
    "disable_openapi_validation": attr.bool(
        doc = "Disables rendered templates validation against the Kubernetes OpenAPI Schema",
    ),
    "disable_validation": attr.bool(
        doc = "Disables rendered templates validation against the Kubernetes cluster you are currently pointing to. This is the same validation performed on an install",
    ),
    "find_renames": attr.string(
        doc = "Enable rename detection if set to any value greater than 0. If specified, the value denotes the maximum fraction of changed content as lines added + removed compared to total lines in a diff for considering it a rename. Only objects of the same Kind are attempted to be matched",
        default = "0",
    ),
    "include_tests": attr.bool(
        doc = "Enable the diffing of the helm test hooks",
    ),
    "namespace": attr.string(
        doc = "Namespace where release is installed",
    ),
    "no_hooks": attr.bool(
        doc = "Disable diffing of hooks",
    ),
    "normalize_manifests": attr.bool(
        doc = "Normalize manifests before running diff to exclude style differences from the output",
    ),
    "output": attr.string(
        doc = "Output style",
        default = "diff",
        values = ["diff", "simple", "template"],
    ),
    "release_name": attr.string(
        doc = "Name of the installed release",
        mandatory = True,
    ),
    "reset_values": attr.bool(
        doc = "Reset the values to the ones built into the chart and merge in any new values",
    ),
    "reuse_values": attr.bool(
        doc = "Reuse the last release's values and merge in any new values. If 'reset_values' is specified, this is ignored",
    ),
    "show_secrets": attr.bool(
        doc = "Do not redact secret values in the output",
    ),
    "strip_trailing_cr": attr.bool(
        doc = "Strip trailing carriage return on input",
    ),
    "suppress": attr.string_list(
        doc = "Allows suppression of the values listed in the diff output",
    ),
    "suppress_secrets": attr.bool(
        doc = "Suppress secrets in the output",
    ),
    "three_way_merge": attr.bool(
        doc = "Use three-way-merge to compute patch and generate diff output",
    ),
    "values": attr.label_list(
        doc = "Specify values in a YAML file",
        allow_files = True,
    ),
}

def _build_command(ctx):
    args = []
    args.append("HELM_BIN={}".format(ctx.var["HELM_RUNFILES_BIN"]))
    if ctx.attr.namespace:
        args.append("HELM_NAMESPACE={}".format(ctx.attr.namespace))
    args.append(ctx.var["HELMDIFF_RUNFILES_BIN"])
    args.append("upgrade")
    args.append(ctx.attr.release_name)

    #     args.append("./{}".format(ctx.file.chart.short_path))
    args.append(ctx.file.chart.short_path)
    if ctx.attr.allow_unreleased:
        args.append("--allow-unreleased")
    if ctx.attr.api_versions:
        args.append("--api-versions={}".format(",".join(ctx.attr.api_versions)))
    args.append("--context={}".format(ctx.attr.context))
    if ctx.attr.detailed_exitcode:
        args.append("--detailed-exitcode")
    if ctx.attr.disable_openapi_validation:
        args.append("--disable-openapi-validation")
    args.append("--find-renames={}".format(ctx.attr.find_renames))
    if ctx.attr.no_hooks:
        args.append("--no-hooks")
    args.append("--output={}".format(ctx.attr.output))
    if ctx.attr.reset_values:
        args.append("--reset-values")
    if ctx.attr.reuse_values:
        args.append("--reuse-values")
    if ctx.attr.show_secrets:
        args.append("--show-secrets")
    if ctx.attr.strip_trailing_cr:
        args.append("--strip-trailing-cr")
    if ctx.attr.suppress:
        args.append("--suppress={}".format(",".join(ctx.attr.suppress)))
    if ctx.attr.suppress_secrets:
        args.append("--suppress-secrets")
    if ctx.attr.three_way_merge:
        args.append("--three-way-merge")
    if ctx.attr.values:
        values_paths = [f.short_path for f in ctx.files.values]
        args.append("--values={}".format(",".join(values_paths)))
    return " ".join(args)

def _impl(ctx):
    executable = ctx.actions.declare_file(ctx.label.name + ".sh")
    ctx.actions.write(
        executable,
        _build_command(ctx),
        is_executable = True,
    )

    return [
        DefaultInfo(
            executable = executable,
            runfiles = ctx.runfiles(
                ctx.toolchains["@slamdev_rules_helmdiff//helmdiff:toolchain_type"].default.files.to_list() +
                ctx.toolchains["@slamdev_rules_helm//helm:toolchain_type"].default.files.to_list() +
                [ctx.file.chart] + ctx.files.values,
            ),
        ),
    ]

upgrade = rule(
    doc = _DOC,
    implementation = _impl,
    attrs = _ATTRS,
    provides = [DefaultInfo],
    executable = True,
    toolchains = [
        "@slamdev_rules_helmdiff//helmdiff:toolchain_type",
        "@slamdev_rules_helm//helm:toolchain_type",
    ],
)
