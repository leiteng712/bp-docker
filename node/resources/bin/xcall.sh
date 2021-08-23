#!/bin/bash
if [ $# -lt 1 ]; then
  echo "No Args Input..."
  exit
fi
for host in master node01 node02 node03; do
  echo --------- $host ----------
  # shellcheck disable=SC2029
  ssh root@$host "$*"
done
