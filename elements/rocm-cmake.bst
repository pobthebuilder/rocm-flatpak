kind: cmake
description: |
  ROCm CMake

build-depends:
- filename: public-stacks/buildsystem-cmake.bst
  junction: freedesktop-sdk.bst

sources:
- kind: git_tag
  url: rocm:rocm-cmake
  track: "%{rocmtag}"
  ref: rocm-5.4.4-0-g88fd446cdbdd4ae5d902b1be6d380eebecd15be2
