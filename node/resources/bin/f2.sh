#! /bin/bash
case $1 in
"start") {
  for host in node03; do
    echo " --------启动 $host 消费flume-------"
    # shellcheck disable=SC2029
    ssh root@$host "nohup $FLUME_HOME/bin/flume-ng agent --conf-file $FLUME_HOME/conf/kafka-flume-hdfs.conf --name a1 -Dflume.root.logger=INFO,LOGFILE >$FLUME_HOME/log2.txt   2>&1 &"
  done
} ;;
"stop") {
  for host in node03; do
    echo " --------停止 $host 消费flume-------"
    ssh root@$host "ps -ef | grep kafka-flume-hdfs | grep -v grep |awk '{print \$2}' | xargs -n1 kill"
  done
} ;;
esac
