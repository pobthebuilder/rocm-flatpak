kind: cmake
description: |
  ROCt Library - user-mode API to interact with the ROCk driver

build-depends:
- freedesktop-sdk.bst:sdk.bst
- freedesktop-sdk.bst:extensions/mesa/libdrm.bst
- rocm-cmake.bst
- rocm-llvm.bst

depends:
- numactl.bst

environment:
  # libdrm.pc
  PKG_CONFIG_PATH: "%{prefix}/lib/pkgconfig:/usr/lib/%{gcc_triplet}/GL/default/lib/pkgconfig"

variables:
  cmake-local: |
    -DCMAKE_C_COMPILER="%{prefix}/bin/clang" \
    -DCMAKE_CXX_COMPILER="%{prefix}/bin/clang++"

sources:
- kind: git_tag
  url: rocm:ROCT-Thunk-Interface
  track: "%{rocmtag}"
  ref: rocm-5.7.1-0-g5268ea80e32a6f09f911114e12a20a8176055163
- kind: patch
  path: patch/0001-Fix-libnuma-to-use-pkg_config.patch
