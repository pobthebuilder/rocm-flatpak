kind: flatpak_repo

build-depends:
- freedesktop-sdk.bst:components/flatpak-minimal.bst
- filename: rocm-extension.bst
  config:
    flatpak-image: True

config:
  branch: "%{branch}"
