#!/bin/bash
# shellcheck disable=SC2164
cd "$WORK_DIR"/bin/
echo "####################初始化####################"
echo "========================修改/etc/hosts文件========================"
cat "$WORK_DIR"/hosts >>/etc/hosts

#hadoop
if [ "$HOSTNAME" = 'master' ]; then
  echo "========================格式化NAME_NODE========================"
  "$HADOOP_HOME"/bin/hdfs namenode -format
  echo "========================格式化NAME_NODE========================"
fi

#zookeeper
echo "========================初始化zookeeper========================"
mkdir -p "$ZOOKEEPER_HOME"/data/
sed -i 's?ZOOKEEPER_DATA_DIR?'"$ZOOKEEPER_HOME"'/data?g' "$ZOOKEEPER_HOME"/conf/zoo.cfg
echo "$ZOOKEEPER_ID" >"$ZOOKEEPER_HOME"/data/myid
echo "========================结束初始化zookeeper========================"

#kafka
echo "========================初始化KAFKA========================"
mkdir -p "$KAFKA_HOME"/logs/
sed -i 's?KAFKA_BROKER_ID?'"$KAFKA_BROKER_ID"'?g;s?KAFKA_LOGS_DIR?'"$KAFKA_HOME"'/data?g' "$KAFKA_HOME"/config/server.properties
if [ "$HOSTNAME" = 'master' ]; then
  kf.sh start
  "$KAFKA_HOME"/bin/kafka-topics.sh --zookeeper node01:2181,node02:2181,node03:2181/kafka --create --replication-factor 1 --partitions 1 --topic topic_log
  kf.sh stop
fi
echo "========================结束初始化KAFKA========================"

#flume
sed -i 's?FLUME_HOME?'"$FLUME_HOME"'?g;s?WORK_DIR?'"$WORK_DIR"'?g' "$FLUME_HOME"/conf/*.conf
