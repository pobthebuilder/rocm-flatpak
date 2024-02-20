kind: cmake
description: |
  ROCm Device Libs

build-depends:
- freedesktop-sdk.bst:sdk.bst
- rocm-cmake.bst
- rocm-llvm.bst

variables:
  cmake-local:
    -DCMAKE_C_COMPILER="%{prefix}/bin/clang" \
    -DCMAKE_CXX_COMPILER="%{prefix}/bin/clang++" \
    -DLLVM_DIR="%{prefix}/llvm/lib/cmake/llvm"

sources:
- kind: git_tag
  url: rocm:ROCm-Device-Libs
  track: "%{rocmtag}"
  ref: rocm-5.7.1-0-g9ce3e6586358e8c20a37fbcec25502be97e4ef02
