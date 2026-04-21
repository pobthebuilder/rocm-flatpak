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
  ref: rocm-7.0.2-0-g0dda3adf56766e0aac0d03173ced3759e1ffecbc
- kind: patch
  path: patch/0001-Fix-hipcc-stdc++fs.patch
