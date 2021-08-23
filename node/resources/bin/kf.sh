#!/bin/bash
case $1 in
"start") {
  for host in node01 node02 node03; do
    echo " --------启动 $host Kafka-------"
    # shellcheck disable=SC2029
    ssh root@$host "$KAFKA_HOME/bin/kafka-server-start.sh -daemon $KAFKA_HOME/config/server.properties"
  done
} ;;
"stop") {
  for host in node01 node02 node03; do
    echo " --------停止 $host Kafka-------"
    # shellcheck disable=SC2029
    ssh root@$host "$KAFKA_HOME/bin/kafka-server-stop.sh stop"
  done
} ;;
esac
