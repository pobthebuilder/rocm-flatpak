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
  ref: rocm-5.5.1-0-g2e823f7604a965e7d56cff48d58fb666354bbfeb
