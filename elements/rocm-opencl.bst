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
- kind: git_tag
  url: rocm:ROCm-OpenCL-Runtime
  track: "%{rocmtag}"
  directory: ROCm-OpenCL-Runtime
  ref: rocm-5.5.1-0-gd74287f59b8626f48343d1e9adc7ff99a1fa0a19
- kind: git_tag
  url: rocmdt:ROCclr
  track: "%{rocmtag}"
  directory: ROCclr
  ref: rocm-5.5.0-0-ge047204465e75a62904f95152732c30026534111
- kind: patch
  path: patch/0001-Fix-unknown-type-name-uint64_t-errors.patch
