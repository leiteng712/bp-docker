#查看Kafka Topic列表
kafka-topics.sh --zookeeper node01:2181/kafka --list
#创建Kafka Topic
kafka-topics.sh --create --zookeeper node01:2181,nod02:2181,node03:2181/kafka --replication-factor 1 --partitions 1 --topic topic_log
#删除Kafka Topic
kafka-topics.sh --delete --zookeeper node01:2181,nod02:2181,node03:2181/kafka --topic topic_log
#Kafka生产消息
kafka-console-producer.sh --broker-list node01:9092 --topic topic_log
#Kafka消费消息
kafka-console-consumer.sh --bootstrap-server node02:9092 --from-beginning --topic topic_log
#查看Kafka Topic详情
kafka-topics.sh --describe --zookeeper node01:2181/kafka --topic topic_log
