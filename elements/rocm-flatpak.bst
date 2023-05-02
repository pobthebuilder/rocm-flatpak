kind: flatpak_repo

build-depends:
- freedesktop-sdk.bst:components/flatpak-minimal.bst
- filename: rocm-extension.bst

config:
  branch: "%{branch}"

  environment:
  - components/flatpak-minimal.bst
