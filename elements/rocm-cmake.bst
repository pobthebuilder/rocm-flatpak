kind: cmake
description: |
  ROCm CMake

build-depends:
- filename: public-stacks/buildsystem-cmake.bst
  junction: freedesktop-sdk.bst

sources:
- kind: git
  url: rocm:rocm-cmake
  track: rocm-5.4.3
  ref: 88fd446cdbdd4ae5d902b1be6d380eebecd15be2
