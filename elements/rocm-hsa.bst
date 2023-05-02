kind: cmake
description: |
  ROCm HSA

build-depends:
- filename: sdk.bst
  junction: freedesktop-sdk.bst
- filename: extensions/mesa/libdrm.bst
  junction: freedesktop-sdk.bst
# for xxd
- filename: components/vim.bst
  junction: freedesktop-sdk.bst
- rocm-cmake.bst
- rocm-llvm.bst
- rocm-hsakmt.bst
- rocm-device-libs.bst

environment:
  # libdrm.pc
  PKG_CONFIG_PATH: /usr/lib/%{gcc_triplet}/GL/default/lib/pkgconfig

variables:
  command-subdir: src
  cmake-local:
    -DCMAKE_C_COMPILER="/usr/lib/%{gcc_triplet}/GL/ROCm/bin/clang" \
    -DCMAKE_CXX_COMPILER="/usr/lib/%{gcc_triplet}/GL/ROCm/bin/clang++"

config:
  strip-commands: []

sources:
- kind: git
  url: rocm:ROCR-Runtime
  track: rocm-5.4.3
  ref: 2e52dc810a3a3066d0c72809defae52fdf0f23cb
- kind: patch
  path: patch/0001-Add-amdgpu-dependency-to-import-correct-include-path.patch
