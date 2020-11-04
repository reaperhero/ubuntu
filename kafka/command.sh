#!/bin/bash



zookeeper-server-start /usr/local/etc/kafka/zookeeper.properties &.  启动zookeeper
sudo  zkServer start
zookeeper-server-stop /usr/local/etc/kafka/zookeeper.properties &  关闭zookeeper
zkServer stop
kafka-server-start /usr/local/etc/kafka/server.properties &.  启动kafka

# --zookeeper localhost:2181 == --bootstrap-server localhost:9092

kafka-topics.sh --zookeeper localhost:2181 --create --replication-factor 1 --partitions 1 --topic topic-name-01   创建主题
kafka-topics.sh --zookeeper localhost:2181 --list   列出主题
kafka-topics.sh --zookeeper localhost:2181 --delete --topic topic_name-01   删除主题
kafka-topics.sh --zookeeper localhost:2181 --describe   主题描述(全部）
kafka-topics.sh --zookeeper localhost:2181 --describe --topic topic-name-01主题描述(指定）
kafka-topics.sh --zookeeper localhost:2181 --alter --topic topic_name --partitions count   修改主题
kafka-console-producer.sh --broker-list localhost:9092 --topic topic-name-01 发送消费
kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic topic-name-01 --from-beginning 消费消息



kafka-consumer-groups.sh --bootstrap-server localhost:9092 --list  查看哪些消费组
kafka-consumer-groups.sh --bootstrap-server localhost:9092 --describe --group test_group 看指定组消费信息，HOST：消费者主机ip，为空代表当前没有消费者
kafka-consumer-groups.sh --bootstrap-server localhost:9092 --delete --group test_group 删除消费组