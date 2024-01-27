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
  cmake-local: |
    -DCMAKE_C_COMPILER="/usr/lib/%{gcc_triplet}/GL/ROCm/bin/clang" \
    -DCMAKE_CXX_COMPILER="/usr/lib/%{gcc_triplet}/GL/ROCm/bin/clang++" \
    -DCLR_BUILD_OCL=ON \
    -DBUILD_ICD=OFF

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
  url: rocm:clr
  track: "%{rocmtag}"
  ref: rocm-5.7.0-0-gd1770ee1baf5ede2e723490024d5038e95df85b6
