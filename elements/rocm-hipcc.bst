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

  cmake-local: |
    -DCMAKE_C_COMPILER="%{prefix}/bin/clang" \
    -DCMAKE_CXX_COMPILER="%{prefix}/bin/clang++"

sources:
- kind: git_tag
  url: rocm:HIPCC
  track: "%{rocmtag}"
  ref: rocm-6.0.2-0-g7ae382ceec92014aa729a4d6773515b42dc3a209
- kind: patch
  path: patch/0001-Fix-hipcc-stdc++fs.patch
