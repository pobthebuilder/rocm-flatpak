kind: autotools

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst

variables:
  conf-args: |
    --prefix="%{prefix}"

sources:
- kind: git_tag
  url: github:numactl/numactl.git
  track: v2.0.16
  ref: v2.0.16-0-g10285f1a1bad49306839b2c463936460b604e3ea
