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
  PKG_CONFIG_PATH: /usr/lib/%{gcc_triplet}/GL/ROCm/lib/pkgconfig:/usr/lib/%{gcc_triplet}/GL/default/lib/pkgconfig

variables:
  cmake-local: |
    -DROCRTST_BLD_TYPE=Release

sources:
- kind: git
  url: rocm:rocminfo
  track: rocm-5.4.3
  ref: aa8930552c6993ed9db1a1c0630017a14b49a1e5
- kind: patch
  path: patch/0001-Find-drm-and-drm_amdgpu-paths.patch

