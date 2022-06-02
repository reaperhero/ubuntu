# ck


## 配置文件说明

https://zhuanlan.zhihu.com/p/445202157

https://www.cnblogs.com/zhoujinyi/tag/ClickHouse/

```
<remote_servers incl="clickhouse_remote_servers" >
    <my_shard>         # 是cluster名称,任意填写,在后面通过这个名字引用如 on cluster my_shard
            <shard>    # 指分片,有几个分片就配置几个<shard>标签
                    <replica>  # 指副本,有几个副本就有几个<replica>标签
                        <host>node01</host>
                        <port>9000</port>
                    </replica>
                    <replica>
                        <host>node02</host>
                        <port>9000</port>
                    </replica>
            </shard>
            <shard>
                    <replica>
                        <host>node03</host>
                        <port>9000</port>
                    </replica>
                    <replica>
                        <host>node04</host>
                        <port>9000</port>
                    </replica>
            </shard>
    </my_shard>
</remote_servers>
```

