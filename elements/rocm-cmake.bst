kind: cmake
description: |
  ROCm CMake

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

sources:
- kind: git_tag
  url: rocm:rocm-cmake
  track: "%{rocmtag}"
  ref: rocm-6.0.2-0-g5a34e72d9f113eb5d028e740c2def1f944619595
