kind: cmake
description: |
  ROCm Compiler Support

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- rocm-cmake.bst
- rocm-llvm.bst
- rocm-device-libs.bst

depends:
- rocm-device-libs.bst

variables:
  command-subdir: lib/comgr
  cmake-local: |
    -DCMAKE_C_COMPILER="%{prefix}/bin/clang" \
    -DCMAKE_CXX_COMPILER="%{prefix}/bin/clang++"

config:
  strip-commands: []

sources:
- kind: git_tag
  url: rocm:ROCm-CompilerSupport
  track: "%{rocmtag}"
  ref: rocm-6.0.0-0-g33d21c512810e4685aeea7edf37f2094f2d58eb9
