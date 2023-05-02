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
  PKG_CONFIG_PATH: /usr/lib/%{gcc_triplet}/GL/ROCm/lib/pkgconfig:/usr/lib/%{gcc_triplet}/GL/default/lib/pkgconfig

variables:
  cmake-local: |
    -DCMAKE_C_COMPILER="/usr/lib/%{gcc_triplet}/GL/ROCm/bin/clang" \
    -DCMAKE_CXX_COMPILER="/usr/lib/%{gcc_triplet}/GL/ROCm/bin/clang++"

sources:
- kind: git
  url: rocm:ROCT-Thunk-Interface
  track: rocm-5.4.3
  ref: 2d55276bfa186a47611cdd2fc20879dacb506a9a
- kind: patch
  path: patch/0001-Fix-libnuma-linkage-to-use-pkg_config.patch
