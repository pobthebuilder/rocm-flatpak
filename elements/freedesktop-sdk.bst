kind: junction

#config:
#  options:
#    target_arch: '%{arch}'
#    bootstrap_build_arch: '%{arch}'

sources:
- kind: git_tag
  url: gitlab:freedesktop-sdk/freedesktop-sdk.git
  track: release/22.08
  track-tags: true
  ref: freedesktop-sdk-22.08.11-0-g8325c6f52c0b1493b3ef000dd3e4ca810787e8c0

