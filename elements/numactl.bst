kind: autotools

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst

variables:
  conf-args: |
    --prefix="/usr/lib/%{gcc_triplet}/GL/ROCm"

sources:
- kind: git
  url: github:numactl/numactl.git
  track: v2.0.16
  ref: 10285f1a1bad49306839b2c463936460b604e3ea
