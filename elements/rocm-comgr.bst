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
- kind: git_tag
  url: rocm:ROCm-CompilerSupport
  track: "%{rocmtag}"
  ref: rocm-5.5.1-0-g927da5f3d9689fe1ff936701d7c3a7c9bdcaf768
