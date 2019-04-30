# Copyright 2019 The Bazel Authors. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

"""ios_unit_test Starlark tests."""

load(
    "@build_bazel_rules_apple//test/starlark_tests:rules/infoplist_contents_test.bzl",
    "infoplist_contents_test",
)

def ios_unit_test_test_suite():
    """Test suite for ios_unit_test."""
    name = "ios_unit_test"

    infoplist_contents_test(
        name = "{}_plist_test".format(name),
        target_under_test = "@build_bazel_rules_apple//test/starlark_tests/targets_under_test/ios:unit_test",
        expected_values = {
            "BuildMachineOSBuild": "*",
            "CFBundleExecutable": "unit_test",
            "CFBundleIdentifier": "com.google.exampleTests",
            "CFBundleName": "unit_test",
            "CFBundleSupportedPlatforms:0": "iPhone*",
            "DTCompiler": "com.apple.compilers.llvm.clang.1_0",
            "DTPlatformBuild": "*",
            "DTPlatformName": "iphone*",
            "DTPlatformVersion": "*",
            "DTSDKBuild": "*",
            "DTSDKName": "iphone*",
            "DTXcode": "*",
            "DTXcodeBuild": "*",
            "MinimumOSVersion": "8.0",
            "UIDeviceFamily:0": "1",
        },
        tags = [name],
    )

    infoplist_contents_test(
        name = "{}_multiple_plist_test".format(name),
        target_under_test = "@build_bazel_rules_apple//test/starlark_tests/targets_under_test/ios:unit_test_multiple_infoplists",
        expected_values = {
            "AnotherKey": "AnotherValue",
            "CFBundleExecutable": "unit_test_multiple_infoplists",
        },
        tags = [name],
    )

    native.test_suite(
        name = name,
        tags = [name],
    )
