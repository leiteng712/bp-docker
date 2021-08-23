#!/bin/bash
case $1 in
"start") {
  for host in node01 node02 node03; do
    echo ---------- zookeeper $i 启动 ------------
    # shellcheck disable=SC2029
    ssh root@$host "$ZOOKEEPER_HOME/bin/zkServer.sh start"
  done
} ;;
"stop") {
  for host in node01 node02 node03; do
    echo ---------- zookeeper $i 停止 ------------
    # shellcheck disable=SC2029
    ssh root@$host "$ZOOKEEPER_HOME/bin/zkServer.sh stop"
  done
} ;;
"status") {
  for host in node01 node02 node03; do
    echo ---------- zookeeper $host 状态 ------------
    # shellcheck disable=SC2029
    ssh root@$host "$ZOOKEEPER_HOME/bin/zkServer.sh status"
  done
} ;;
esac
