kind: cmake
description: |
  ROCm Device Libs

build-depends:
- filename: sdk.bst
  junction: freedesktop-sdk.bst
- rocm-cmake.bst
- rocm-llvm.bst

variables:
  cmake-local:
    -DCMAKE_C_COMPILER="/usr/lib/%{gcc_triplet}/GL/ROCm/bin/clang" \
    -DCMAKE_CXX_COMPILER="/usr/lib/%{gcc_triplet}/GL/ROCm/bin/clang++" \
    -DLLVM_DIR="/usr/lib/%{gcc_triplet}/GL/ROCm/llvm/lib/cmake/llvm"

sources:
- kind: git
  url: rocm:ROCm-Device-Libs
  track: rocm-5.4.3
  ref: 4d86a313a33027cff82dc73fe9b8395a7a96eb04
