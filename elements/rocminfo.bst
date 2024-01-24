kind: cmake
description: |
  ROCm Info

build-depends:
- filename: public-stacks/buildsystem-cmake.bst
  junction: freedesktop-sdk.bst
- filename: extensions/mesa/libdrm.bst
  junction: freedesktop-sdk.bst
- rocm-cmake.bst
- rocm-hsa.bst
- rocm-hsakmt.bst
- rocm-opencl.bst

runtime-depends:
- freedesktop-sdk.bst:components/kmod.bst

environment:
  # libdrm.pc
  PKG_CONFIG_PATH: 
    /usr/lib/%{gcc_triplet}/GL/ROCm/lib/pkgconfig:/usr/lib/%{gcc_triplet}/GL/default/lib/pkgconfig

variables:
  cmake-local: |
    -DROCRTST_BLD_TYPE=Release

sources:
- kind: git_tag
  url: rocm:rocminfo
  track: "%{rocmtag}"
  ref: rocm-5.6.1-0-g94b4b3f0a66eb70912177ca7076b4267f8b5449b
- kind: patch
  path: patch/0001-Find-drm-and-drm_amdgpu-paths.patch

