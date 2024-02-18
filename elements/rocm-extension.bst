kind: flatpak_image

build-depends:
- rocm-stack.bst

config:
  directory: "%{prefix}"
  exclude:
    - debug
    - locale

  metadata:
    Runtime:
      name: org.freedesktop.Platform.GL.ROCm
      runtime: org.freedesktop.Platform/%{flatpak_arch}/%{branch}
      sdk: org.freedesktop.Sdk/%{flatpak_arch}/%{branch}

    ExtensionOf:
      ref: runtime/org.freedesktop.Platform/%{flatpak_arch}/%{branch}
