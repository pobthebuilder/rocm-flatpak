kind: cmake
description: |
  ROCm CMake

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

sources:
- kind: git_tag
  url: rocm:rocm-cmake
  track: "%{rocmtag}"
  ref: rocm-7.0.1-0-g2c6dcc0d5acd6e1c81c76b32238613d82fd0b92e
