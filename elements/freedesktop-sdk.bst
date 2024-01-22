kind: junction

#config:
#  options:
#    target_arch: '%{arch}'
#    bootstrap_build_arch: '%{arch}'

sources:
- kind: git_tag
  url: gitlab:freedesktop-sdk/freedesktop-sdk.git
  track: release/23.08
  ref: freedesktop-sdk-23.08.10-110-g17c8491cd86de5883ad876ff539f6ff14561d3e6
