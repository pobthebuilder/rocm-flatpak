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
  ref: rocm-5.6.1-0-g07ec4c536108ae943e37985915ef279529ac693f
