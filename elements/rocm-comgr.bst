kind: cmake
description: |
  ROCm Compiler Support

build-depends:
- filename: public-stacks/buildsystem-cmake.bst
  junction: freedesktop-sdk.bst
- rocm-cmake.bst
- rocm-llvm.bst

depends:
- rocm-device-libs.bst

variables:
  command-subdir: lib/comgr
  cmake-local: |
    -DCMAKE_C_COMPILER="/usr/lib/%{gcc_triplet}/GL/ROCm/bin/clang" \
    -DCMAKE_CXX_COMPILER="/usr/lib/%{gcc_triplet}/GL/ROCm/bin/clang++"

config:
  strip-commands: []

sources:
- kind: git
  url: rocm:ROCm-CompilerSupport
  track: rocm-5.4.3
  ref: be624c66c58a5ff60081538dff70a235248a8131
