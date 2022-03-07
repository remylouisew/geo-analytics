
#!/bin/bash -eu

source /opt/c2d/c2d-utils || exit 1

function should_mount_gcs(){
  # Mount GCS buckets locally.
  local mount_gcs=true
  JUPYTER_USER=$(get_jupyter_user)
  mkdir -p "/home/${JUPYTER_USER}"/gcs
  gcsfuse --implicit-dirs "/home/${JUPYTER_USER}"/gcs
}

shopt -s nocasematch
should_mount_gcs
echo $?
shopt -u nocasematch
