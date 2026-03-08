kind: cmake
description: |
  ROCm Compiler Support

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- freedesktop-sdk.bst:components/python3.bst
- rocm-cmake.bst
- rocm-llvm.bst
- rocm-device-libs.bst

depends:
- rocm-device-libs.bst

variables:
  command-subdir: amd/comgr
  cmake-local: |
    -DCMAKE_C_COMPILER="%{prefix}/bin/clang" \
    -DCMAKE_CXX_COMPILER="%{prefix}/bin/clang++" \
    -DBUILD_TESTING=OFF

config:
  strip-commands: []

sources:
- kind: git_tag
  url: rocm:llvm-project
  track: "%{rocmtag}"
  ref: rocm-7.0.1-0-gf4087f6b428f0e6f575ebac8a8a724dab123d06e
