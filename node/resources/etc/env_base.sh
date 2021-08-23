export WORK_DIR=/opt
export PATH=$PATH:$WORK_DIR/bin
#java
export JAVA_HOME=$WORK_DIR/jdk1.8.0_301
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export PATH=$PATH:$JAVA_HOME/bin

#hadoop
export HADOOP_HOME=$WORK_DIR/hadoop-3.1.3
export PATH=$PATH:$HADOOP_HOME/bin
export HDFS_DATANODE_USER=root
export HDFS_DATANODE_SECURE_USER=root
export HDFS_SECONDARYNAMENODE_USER=root
export HDFS_NAMENODE_USER=root
export YARN_RESOURCEMANAGER_USER=root
export YARN_NODEMANAGER_USER=root

#zookeeper
export ZOOKEEPER_HOME=$WORK_DIR/apache-zookeeper-3.5.7-bin

#KAFKA
export KAFKA_HOME=$WORK_DIR/kafka_2.11-2.4.1
