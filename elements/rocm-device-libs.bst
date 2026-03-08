kind: cmake
description: |
  ROCm Device Libs

build-depends:
- freedesktop-sdk.bst:sdk.bst
- rocm-cmake.bst
- rocm-llvm.bst

variables:
  command-subdir: amd/device-libs
  cmake-local:
    -DCMAKE_C_COMPILER="%{prefix}/bin/clang" \
    -DCMAKE_CXX_COMPILER="%{prefix}/bin/clang++" \
    -DLLVM_DIR="%{prefix}/llvm/lib/cmake/llvm"

sources:
- kind: git_tag
  url: rocm:llvm-project
  track: "%{rocmtag}"
  ref: rocm-7.0.1-0-gf4087f6b428f0e6f575ebac8a8a724dab123d06e
