


如何保证Kafka消息的顺序性？

Kafka只保证单个分区内的消息顺序性。

方案：

发送需要保证顺序的消息时，指定同一个Key。Kafka通过Partitioner确保相同Key的消息总是被发送到同一个分区。

该Topic只设置1个分区（不推荐，严重限制吞吐量）。

注意： 如果启用了重试且max.in.flight.requests.per.connection > 1，即使发送到同一分区也可能乱序。需设置max.in.flight.requests.per.connection=1或启用幂等生产者（幂等生产者保证了单个会话内分区的顺序）。