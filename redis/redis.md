# help

Redis支持五种数据类型：string（字符串），hash（哈希），list（列表），set（集合）及zset(sorted set：有序集合)。

CONFIG GET *      查看配置
CONFIG SET CONFIG_SETTING_NAME NEW_CONFIG_VALUE     修改配置
redis-cli -h 192.168.1.132  -p 6379 -a "?Prwc*zZ4@XMzE" --raw      连接
CONFIG set requirepass "1234"        设置密码   
auth 1234
CONFIG get requirepass       查询密码
info   查看redis信息
keys * 查询所有的键
dbsize 查询键总数
exists key 存在返回1，不存在返回0
type key  查询key类型
CLIENT LIST 查询客户端列表
FLUSHALL 删除所有数据库的key
FLUSHDB  删除当前数据库key
info keyspace  查看数据库db相关的统计信息




- string
```
redis 127.0.0.1:6379> SET runoob "菜鸟教程"
OK
redis 127.0.0.1:6379> GET runoob
"菜鸟教程"
```

- hash
```
redis 127.0.0.1:6379> HMSET runoob field1 "Hello" field2 "World"
redis 127.0.0.1:6379> HGET runoob field1
"Hello"
redis 127.0.0.1:6379> HGETALL runoob 
"10"
"Hello"
"29"
"World"
```

- list
```
redis 127.0.0.1:6379> lpush runoob redis
redis 127.0.0.1:6379> lpush runoob mongodb
redis 127.0.0.1:6379> lpush runoob rabitmq
redis 127.0.0.1:6379> lrange runoob 1 1
1) "mongodb"
```

- set集合

```
redis 127.0.0.1:6379> sadd runoob redis
redis 127.0.0.1:6379> sadd runoob mongodb
redis 127.0.0.1:6379> sadd runoob rabitmq
redis 127.0.0.1:6379> sadd runoob rabitmq
redis 127.0.0.1:6379> smembers runoob
1) "redis"
2) "rabitmq"
3) "mongodb"
```



- zset有序集合
```
localhost:6379> zadd runoob 0 redis
(integer) 1
localhost:6379> zadd runoob 0 mongodb
(integer) 1
localhost:6379> zadd runoob 0 rabitmq
(integer) 1
localhost:6379> zadd runoob 0 rabitmq
(integer) 0
localhost:6379> ZRANGEBYSCORE runoob 0 0
1) "mongodb"
2) "rabitmq"
3) "redis"
```




