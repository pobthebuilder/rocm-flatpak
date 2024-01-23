kind: junction

#config:
#  options:
#    target_arch: '%{arch}'
#    bootstrap_build_arch: '%{arch}'

sources:
- kind: git_tag
  url: gitlab:freedesktop-sdk/freedesktop-sdk.git
  track: release/23.08
  ref: freedesktop-sdk-23.08.10-116-g9d56e9cf85efd7196b28db0cad120537abefee7e
