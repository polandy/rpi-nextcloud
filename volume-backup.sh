#!/usr/bin/env bash

BACKUP_LOCATION=/your/backup/location/

declare -a volumes_to_backup;
volumes_to_backup[0]='nextcloud-volume'
volumes_to_backup[1]='apps-volume'
volumes_to_backup[2]='config-volume'
volumes_to_backup[3]='data-volume'
volumes_to_backup[4]='postgres-db'

# Create grep expression for volumes
for v in ${volumes_to_backup[@]}; do
  grep_expr="$v\|$grep_expr"
done
grep_expr_length=${#grep_expr}
grep_expr=${grep_expr:0:$grep_expr_length-2}

# Get volumes to backup
volume_names_to_backup=$(docker volume ls -q | grep $grep_expr)

for volume_name in ${volume_names_to_backup[@]}; do
#  mount_point="$(docker volume inspect --format '{{ if eq .Name "$volume_name" }}{{ .Mountpoint }}{{ end }}' $volume_name)"
  mount_point="$(docker volume inspect --format '{{ .Mountpoint }}' $volume_name)"
  tar_cmd="tar pczvf $BACKUP_LOCATION/$volume_name.tar.gz $mount_point"
  echo "Executing command: $tar_cmd"
  eval $($tar_cmd)
done
