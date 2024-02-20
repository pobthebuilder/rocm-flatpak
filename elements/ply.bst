kind: pip
description: |
  Ply.lex

  pip-install-dependencies: |
    %{pip-flags} %{pip-download-dir}/*

variables:
  prefix: "/usr"

build-depends:
- freedesktop-sdk.bst:components/python3.bst
- freedesktop-sdk.bst:components/python3-pip.bst

sources:
- kind: tar
  url: 
    python-hosted:e5/69/882ee5c9d017149285cab114ebeab373308ef0f874fcdac9beb90e0ac4da/ply-3.11.tar.gz
  ref: 00c7c1aaa88358b9c765b6d3000c6eec0ba42abca5351b095321aef446081da3
