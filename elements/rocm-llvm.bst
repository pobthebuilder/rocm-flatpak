kind: cmake
description: |
  ROCm LLVM

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- freedesktop-sdk.bst:components/python3.bst
- rocm-cmake.bst

variables:
  # reduce the amount of debug info
  debug_flags: "-g1"
  # dwz will run out of memory trying to optimize llvm
  optimize-debug: "false"

  command-subdir: llvm
  cmake-global: |
    -DCMAKE_VERBOSE_MAKEFILE=ON \
    -DCMAKE_BUILD_TYPE=MinSizeRel
  cmake-local: |
    -DLLVM_TARGETS_TO_BUILD='AMDGPU;X86' \
    -DLLVM_ENABLE_PROJECTS='llvm;clang;compiler-rt;lld' \
    -DLLVM_BUILD_UTILS=ON \
    -DLLVM_ENABLE_BINDINGS=OFF \
    -DLLVM_ENABLE_OCAMLDOC=OFF \
    -DLLVM_INCLUDE_BENCHMARKS=OFF \
    -DLLVM_BUILD_TESTS=OFF \
    -DLLVM_INCLUDE_TESTS=OFF \
    -DLLVM_INCLUDE_EXAMPLES=OFF \
    -DLLVM_INCLUDE_DOCS=OFF \
    -DLLVM_ENABLE_DOXYGEN=OFF \
    -DLLVM_INSTALL_TOOLCHAIN_ONLY=OFF

sources:
- kind: git_tag
  url: rocm:llvm-project
  track: "%{rocmtag}"
  ref: rocm-5.6.1-0-g4f9bb99d78a4d8d9770be38b91ebd004ea4d2a3a
- kind: patch
  path: patch/0001-Fix-OffloadArch-h.patch
- kind: patch
  path: patch/0001-Fix-Debug.h.patch
