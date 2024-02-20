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
- roct-thunk.bst
- rocm-device-libs.bst

environment:
  # libdrm.pc
  PKG_CONFIG_PATH: /usr/lib/%{gcc_triplet}/GL/default/lib/pkgconfig

variables:
  command-subdir: src
  cmake-local:
    -DCMAKE_C_COMPILER="%{prefix}/bin/clang" \
    -DCMAKE_CXX_COMPILER="%{prefix}/bin/clang++"

config:
  strip-commands: []

sources:
- kind: git_tag
  url: rocm:ROCR-Runtime
  track: "%{rocmtag}"
  ref: rocm-6.0.0-0-g22dc4638862c0cd4ab454eef720e6a29e3d1d9a5
- kind: patch
  path: patch/0001-Add-amdgpu-dependency-to-import-correct-include-path.patch
- kind: patch
  path: patch/0001-Fix-opencl_blit_objects_stddef.patch
