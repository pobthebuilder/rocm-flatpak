kind: cmake
description: |
  ROCm HIPCC

build-depends:
- freedesktop-sdk.bst:sdk.bst
- freedesktop-sdk.bst:components/vim.bst
- rocm-llvm.bst

variables:
  # TODO dwz has issues with DWARF v5 included in hipcc.bin
  optimize-debug: "false"

  command-subdir: amd/hipcc
  cmake-local: |
    -DCMAKE_C_COMPILER="%{prefix}/bin/clang" \
    -DCMAKE_CXX_COMPILER="%{prefix}/bin/clang++"

sources:
- kind: git_tag
  url: rocm:llvm-project
  track: "%{rocmtag}"
  ref: rocm-7.0.1-0-gf4087f6b428f0e6f575ebac8a8a724dab123d06e
- kind: patch
  path: patch/0001-Fix-hipcc-stdc++fs.patch
