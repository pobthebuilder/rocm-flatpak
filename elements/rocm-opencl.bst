kind: cmake
description: |
  ROCm OpenCL

build-depends:
- freedesktop-sdk.bst:sdk.bst
- freedesktop-sdk.bst:components/vim.bst
- freedesktop-sdk.bst:components/opencl.bst
- freedesktop-sdk.bst:extensions/clinfo/khronos-headers.bst
- cppheaderparser.bst
- ply.bst
- rocm-llvm.bst
- rocm-hipcc.bst
- rocm-comgr.bst
- rocm-hsa.bst

variables:
  command-subdir: clr
  cmake-local: |
    -DCMAKE_C_COMPILER="/usr/lib/%{gcc_triplet}/GL/ROCm/bin/clang" \
    -DCMAKE_CXX_COMPILER="/usr/lib/%{gcc_triplet}/GL/ROCm/bin/clang++" \
    -DCLR_BUILD_OCL=ON \
    -DCLR_BUILD_HIP=ON \
    -DHIP_COMMON_DIR="%{build-root}/hip" \
    -DHIPCC_BIN_DIR="/usr/lib/%{gcc_triplet}/GL/ROCm/hip/bin" \
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
  directory: clr
  ref: rocm-5.7.1-0-g1949b1621a802ffb1492616adbae6154bfbe64ef
- kind: git_tag
  url: rocm:HIP
  track: "%{rocmtag}"
  directory: hip
  ref: rocm-5.7.1-0-g80681169ae20de8f8025b4fad799204c3ae7de50
