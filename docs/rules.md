<!-- Generated with Stardoc: http://skydoc.bazel.build -->

# Helmdiff Rules

<a id="#helmdiff_upgrade"></a>

## helmdiff_upgrade

<pre>
helmdiff_upgrade(<a href="#helmdiff_upgrade-name">name</a>, <a href="#helmdiff_upgrade-allow_unreleased">allow_unreleased</a>, <a href="#helmdiff_upgrade-api_versions">api_versions</a>, <a href="#helmdiff_upgrade-chart">chart</a>, <a href="#helmdiff_upgrade-context">context</a>, <a href="#helmdiff_upgrade-detailed_exitcode">detailed_exitcode</a>,
                 <a href="#helmdiff_upgrade-disable_openapi_validation">disable_openapi_validation</a>, <a href="#helmdiff_upgrade-disable_validation">disable_validation</a>, <a href="#helmdiff_upgrade-find_renames">find_renames</a>, <a href="#helmdiff_upgrade-include_tests">include_tests</a>,
                 <a href="#helmdiff_upgrade-namespace">namespace</a>, <a href="#helmdiff_upgrade-no_hooks">no_hooks</a>, <a href="#helmdiff_upgrade-normalize_manifests">normalize_manifests</a>, <a href="#helmdiff_upgrade-output">output</a>, <a href="#helmdiff_upgrade-release_name">release_name</a>, <a href="#helmdiff_upgrade-reset_values">reset_values</a>,
                 <a href="#helmdiff_upgrade-reuse_values">reuse_values</a>, <a href="#helmdiff_upgrade-show_secrets">show_secrets</a>, <a href="#helmdiff_upgrade-strip_trailing_cr">strip_trailing_cr</a>, <a href="#helmdiff_upgrade-suppress">suppress</a>, <a href="#helmdiff_upgrade-suppress_secrets">suppress_secrets</a>,
                 <a href="#helmdiff_upgrade-three_way_merge">three_way_merge</a>, <a href="#helmdiff_upgrade-values">values</a>)
</pre>

Defines a helmdiff upgrade execution.

**ATTRIBUTES**


| Name  | Description | Type | Mandatory | Default |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| <a id="helmdiff_upgrade-name"></a>name |  A unique name for this target.   | <a href="https://bazel.build/docs/build-ref.html#name">Name</a> | required |  |
| <a id="helmdiff_upgrade-allow_unreleased"></a>allow_unreleased |  Enables diffing of releases that are not yet deployed via Helm   | Boolean | optional | False |
| <a id="helmdiff_upgrade-api_versions"></a>api_versions |  Kubernetes api versions used for Capabilities.APIVersions   | List of strings | optional | [] |
| <a id="helmdiff_upgrade-chart"></a>chart |  The label of the chart   | <a href="https://bazel.build/docs/build-ref.html#labels">Label</a> | required |  |
| <a id="helmdiff_upgrade-context"></a>context |  Output NUM lines of context around changes   | Integer | optional | -1 |
| <a id="helmdiff_upgrade-detailed_exitcode"></a>detailed_exitcode |  Return a non-zero exit code when there are changes   | Boolean | optional | False |
| <a id="helmdiff_upgrade-disable_openapi_validation"></a>disable_openapi_validation |  Disables rendered templates validation against the Kubernetes OpenAPI Schema   | Boolean | optional | False |
| <a id="helmdiff_upgrade-disable_validation"></a>disable_validation |  Disables rendered templates validation against the Kubernetes cluster you are currently pointing to. This is the same validation performed on an install   | Boolean | optional | False |
| <a id="helmdiff_upgrade-find_renames"></a>find_renames |  Enable rename detection if set to any value greater than 0. If specified, the value denotes the maximum fraction of changed content as lines added + removed compared to total lines in a diff for considering it a rename. Only objects of the same Kind are attempted to be matched   | String | optional | "0" |
| <a id="helmdiff_upgrade-include_tests"></a>include_tests |  Enable the diffing of the helm test hooks   | Boolean | optional | False |
| <a id="helmdiff_upgrade-namespace"></a>namespace |  Namespace where release is installed   | String | optional | "" |
| <a id="helmdiff_upgrade-no_hooks"></a>no_hooks |  Disable diffing of hooks   | Boolean | optional | False |
| <a id="helmdiff_upgrade-normalize_manifests"></a>normalize_manifests |  Normalize manifests before running diff to exclude style differences from the output   | Boolean | optional | False |
| <a id="helmdiff_upgrade-output"></a>output |  Output style   | String | optional | "diff" |
| <a id="helmdiff_upgrade-release_name"></a>release_name |  Name of the installed release   | String | required |  |
| <a id="helmdiff_upgrade-reset_values"></a>reset_values |  Reset the values to the ones built into the chart and merge in any new values   | Boolean | optional | False |
| <a id="helmdiff_upgrade-reuse_values"></a>reuse_values |  Reuse the last release's values and merge in any new values. If 'reset_values' is specified, this is ignored   | Boolean | optional | False |
| <a id="helmdiff_upgrade-show_secrets"></a>show_secrets |  Do not redact secret values in the output   | Boolean | optional | False |
| <a id="helmdiff_upgrade-strip_trailing_cr"></a>strip_trailing_cr |  Strip trailing carriage return on input   | Boolean | optional | False |
| <a id="helmdiff_upgrade-suppress"></a>suppress |  Allows suppression of the values listed in the diff output   | List of strings | optional | [] |
| <a id="helmdiff_upgrade-suppress_secrets"></a>suppress_secrets |  Suppress secrets in the output   | Boolean | optional | False |
| <a id="helmdiff_upgrade-three_way_merge"></a>three_way_merge |  Use three-way-merge to compute patch and generate diff output   | Boolean | optional | False |
| <a id="helmdiff_upgrade-values"></a>values |  Specify values in a YAML file   | <a href="https://bazel.build/docs/build-ref.html#labels">List of labels</a> | optional | [] |


