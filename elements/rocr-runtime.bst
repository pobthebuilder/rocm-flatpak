kind: cmake
description: |
  ROCr Runtime - HSA Runtime API and runtime for ROCm

build-depends:
- freedesktop-sdk.bst:sdk.bst
- freedesktop-sdk.bst:extensions/mesa/libdrm.bst
# for xxd
- freedesktop-sdk.bst:components/vim.bst
- rocm-cmake.bst
- rocm-llvm.bst
- rocm-device-libs.bst

depends:
- numactl.bst

environment:
  # libdrm.pc
  PKG_CONFIG_PATH: "%{prefix}/lib/pkgconfig:/usr/lib/%{gcc_triplet}/GL/default/lib/pkgconfig"

variables:
  cmake-local:
    -DCMAKE_C_COMPILER="%{prefix}/bin/clang" \
    -DCMAKE_CXX_COMPILER="%{prefix}/bin/clang++"

config:
  strip-commands: []

sources:
- kind: git_tag
  url: rocm:ROCR-Runtime
  track: "%{rocmtag}"
  ref: rocm-7.0.2-0-gb59f6da2ea3d554278906fc1baced3ace25e9e1d
- kind: patch
  path: patch/0001-Fix-libnuma-to-use-pkg_config.patch
