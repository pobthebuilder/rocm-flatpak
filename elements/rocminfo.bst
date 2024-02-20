kind: cmake
description: |
  ROCm Info

build-depends:
- freedesktop-sdk.bst:sdk.bst
- freedesktop-sdk.bst:extensions/mesa/libdrm.bst
- rocm-cmake.bst
- rocr-runtime.bst
- roct-thunk.bst
- rocclr.bst

runtime-depends:
- freedesktop-sdk.bst:components/kmod.bst

environment:
  # libdrm.pc
  PKG_CONFIG_PATH: "%{prefix}/lib/pkgconfig:/usr/lib/%{gcc_triplet}/GL/default/lib/pkgconfig"

variables:
  cmake-local: |
    -DROCRTST_BLD_TYPE=Release

sources:
- kind: git_tag
  url: rocm:rocminfo
  track: "%{rocmtag}"
  ref: rocm-6.0.2-0-gdd16db1fed07c3d74ecdba307857dbb270258dfe
- kind: patch
  path: patch/0001-Find-drm-and-drm_amdgpu-paths.patch

