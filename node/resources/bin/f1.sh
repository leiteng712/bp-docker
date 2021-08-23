#! /bin/bash

case $1 in
"start") {
  for host in node01 node02; do
    echo " --------启动 $host 采集flume-------"
    ssh root@$host "nohup $FLUME_HOME/bin/flume-ng agent --conf-file $FLUME_HOME/conf/file-flume-kafka.conf --name a1 -Dflume.root.logger=INFO,LOGFILE > $FLUME_HOME/log1.txt 2>&1  &"
  done
} ;;
"stop") {
  for host in node01 node02; do
    echo " --------停止 $host 采集flume-------"
    ssh root@$host "ps -ef | grep file-flume-kafka | grep -v grep |awk  '{print \$2}' | xargs -n1 kill -9 "
  done
} ;;
esac
