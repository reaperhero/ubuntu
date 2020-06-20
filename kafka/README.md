# kafka 


- 配置参数

- kafka版本号
```
bash-4.4# find /opt/kafka/ -name *kafka_* | head -1 | grep -o '\kafka[^\n]*'
kafka/site-docs/kafka_2.11-0.11.0.3-site-docs.tgz    #Scala 的版本为2.11，kafka的版本是0.11.0.3
```

注意：
```
0.10.x broker配置弃用了advertised.host.name 和 advertised.port 这两个个配置项
```