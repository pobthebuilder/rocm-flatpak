kind: cmake
description: |
  ROCm HSA

build-depends:
- filename: sdk.bst
  junction: freedesktop-sdk.bst
- filename: extensions/mesa/libdrm.bst
  junction: freedesktop-sdk.bst
- rocm-cmake.bst
- rocm-llvm.bst

depends:
- numactl.bst

environment:
  # libdrm.pc
  PKG_CONFIG_PATH: 
    /usr/lib/%{gcc_triplet}/GL/ROCm/lib/pkgconfig:/usr/lib/%{gcc_triplet}/GL/default/lib/pkgconfig

variables:
  cmake-local: |
    -DCMAKE_C_COMPILER="/usr/lib/%{gcc_triplet}/GL/ROCm/bin/clang" \
    -DCMAKE_CXX_COMPILER="/usr/lib/%{gcc_triplet}/GL/ROCm/bin/clang++"

sources:
- kind: git_tag
  url: rocm:ROCT-Thunk-Interface
  track: "%{rocmtag}"
  ref: rocm-5.5.1-0-g695ec62187ba0708e3f8a960c2b75b877c2521a9
- kind: patch
  path: patch/0001-Fix-libnuma-to-use-pkg_config.patch
