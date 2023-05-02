kind: cmake
description: |
  ROCm OpenCL

build-depends:
- freedesktop-sdk.bst:sdk.bst
- freedesktop-sdk.bst:components/vim.bst
- freedesktop-sdk.bst:components/opencl.bst
- freedesktop-sdk.bst:extensions/clinfo/khronos-headers.bst
- rocm-llvm.bst
- rocm-comgr.bst
- rocm-hsa.bst

variables:
  command-subdir: ROCm-OpenCL-Runtime
  cmake-local: |
    -DCMAKE_C_COMPILER="/usr/lib/%{gcc_triplet}/GL/ROCm/bin/clang" \
    -DCMAKE_CXX_COMPILER="/usr/lib/%{gcc_triplet}/GL/ROCm/bin/clang++" \
    -DBUILD_ICD=OFF \
    -DOCL_ROOT="/usr/lib/%{gcc_triplet}/GL/default" \
    -DROCCLR_PATH=%{build-root}/ROCclr \
    -DAMD_OPENCL_PATH=%{build-root}/ROCm-OpenCL-Runtime

config:
  strip-commands: []
  install-commands:
  - |
    %{make-install}
    mkdir -p %{install-root}/%{prefix}/OpenCL/vendors
    touch %{install-root}/%{prefix}/OpenCL/vendors/amdocl64.icd
    echo libamdocl64.so > %{install-root}/%{prefix}/OpenCL/vendors/amdocl64.icd
    # might need ldconfig magic here

sources:
- kind: git
  url: rocm:ROCm-OpenCL-Runtime
  track: rocm-5.4.3
  directory: ROCm-OpenCL-Runtime
  ref: 00e0533578a588da2c0834c58d550e9379d17e49
- kind: git
  url: rocmdt:ROCclr
  track: rocm-5.4.3
  directory: ROCclr
  ref: ccd065214094837dd59a45aa5111d860aff38ecf
- kind: patch
  path: patch/0001-Fix-unknown-type-name-uint64_t-errors.patch
