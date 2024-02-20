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
  ref: rocm-5.7.1-0-g3555aa113d350e94c8d17c5ff519d1acaf9aefb9
- kind: patch
  path: patch/0001-Fix-hipcc-stdc++fs.patch
