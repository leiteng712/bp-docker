#!/bin/bash
if [ $# -lt 1 ]; then
  echo "No Args Input..."
  exit
fi
case $1 in
"start")
  echo " =================== 启动 hadoop集群 ==================="
  start-all.sh
  ;;
"stop")
  echo " =================== 关闭 hadoop集群 ==================="
  stop-all.sh
  ;;
*)
  echo "Input Args Error..."
  ;;
esac
