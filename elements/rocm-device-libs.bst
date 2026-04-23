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
  ref: rocm-7.0.2-0-g0dda3adf56766e0aac0d03173ced3759e1ffecbc
