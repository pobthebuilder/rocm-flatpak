kind: manual

build-depends:
- freedesktop-sdk.bst:components/appstream-minimal.bst
- freedesktop-sdk.bst:components/git-minimal.bst
- freedesktop-sdk.bst:components/m4.bst

variables:
  app-id: >-
    org.freedesktop.Platform.GL.ROCm

config:
  install-commands:
  - |
    set -e
    appdata_dir=%{install-root}%{datadir}/metainfo
    mkdir -p ${appdata_dir}
    CURRENT_REF=$(git describe --tags --match rocm-*)
    FMT='
        refname=%(refname:short)
        creatordate=%(creatordate:short)
        echo "    <release version=\"${refname/rocm-/}\" date=\"${creatordate}\"/>"
    '
    RELEASES_TMP=$(git for-each-ref --shell --format="$FMT" --sort='-creatordate' --merged="${CURRENT_REF}" 'refs/tags/rocm-*')
    RELEASES=`eval "${RELEASES_TMP}"`
    for app_id in %{app-id}
    do
      m4 \
      -D__APP_ID__="${app_id}" \
      -D__RELEASES__="${RELEASES}" \
      appdata.template > ${appdata_dir}/${app_id}.appdata.xml
      appstreamcli compose \
        --components ${app_id} \
        --prefix %{prefix} \
        --result-root %{install-root} \
        --data-dir %{install-root}%{prefix}/share/app-info/xmls \
        --origin ${app_id} \
        %{install-root}
    done

sources:
- kind: git_tag
  full-clone: True
  url: rocm:ROCm
  track: "%{rocmtag}"
  ref: rocm-6.0.0-0-g182827150587dccbe3fe242b378aa14ad0370449
- kind: local
  path: files/appdata.template
