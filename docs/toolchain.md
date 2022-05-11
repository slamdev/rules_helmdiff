<!-- Generated with Stardoc: http://skydoc.bazel.build -->

This module implements the language-specific toolchain rule.


<a id="#helmdiff_toolchain"></a>

## helmdiff_toolchain

<pre>
helmdiff_toolchain(<a href="#helmdiff_toolchain-name">name</a>, <a href="#helmdiff_toolchain-target_tool">target_tool</a>, <a href="#helmdiff_toolchain-target_tool_path">target_tool_path</a>)
</pre>

Defines a helmdiff compiler/runtime toolchain.

For usage see https://docs.bazel.build/versions/main/toolchains.html#defining-toolchains.


**ATTRIBUTES**


| Name  | Description | Type | Mandatory | Default |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| <a id="helmdiff_toolchain-name"></a>name |  A unique name for this target.   | <a href="https://bazel.build/docs/build-ref.html#name">Name</a> | required |  |
| <a id="helmdiff_toolchain-target_tool"></a>target_tool |  A hermetically downloaded executable target for the target platform.   | <a href="https://bazel.build/docs/build-ref.html#labels">Label</a> | optional | None |
| <a id="helmdiff_toolchain-target_tool_path"></a>target_tool_path |  Path to an existing executable for the target platform.   | String | optional | "" |


<a id="#HelmdiffInfo"></a>

## HelmdiffInfo

<pre>
HelmdiffInfo(<a href="#HelmdiffInfo-target_tool_path">target_tool_path</a>, <a href="#HelmdiffInfo-tool_files">tool_files</a>)
</pre>

Information about how to invoke the tool executable.

**FIELDS**


| Name  | Description |
| :------------- | :------------- |
| <a id="HelmdiffInfo-target_tool_path"></a>target_tool_path |  Path to the tool executable for the target platform.    |
| <a id="HelmdiffInfo-tool_files"></a>tool_files |  Files required in runfiles to make the tool executable available.<br><br>May be empty if the target_tool_path points to a locally installed tool binary.    |


