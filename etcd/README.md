[etcd启动参数](https://wiki.shileizcc.com/confluence/pages/viewpage.action?pageId=60227775)


```
--quota-backend-bytes=10240000000  # 调整etcd数据库的空间配额大小限制为10G
```

## parameter


```
–data-dir: 数据目录
–snapshot-count: 最大快照次数，默认10万
–heartbeat-interval: 心跳周期默认 100ms
–election-timeout: 选举超时1s
–max-snapshots: 最大保留快照数，默认 5 个
–quota-backend-bytes: DB 数据大小，比如 10G，50G。
–auto-compaction-retention: 自动压缩，默认为 0 不开启，k8s中 apiserver会开启这个压缩，5 分钟一次。如果你的 etcd 还被其他人使用，这里也可以设置下时间
–enable-pprof: 开启pprof分析
–metrics: 默认为basic模式，extensive代表暴露histogram类型 metric
–log-level: 日志等级。info, warn, error, panic, or fatal
```

## command

```
version: 查看版本
member list: 查看节点状态，learner 情况
endpoint status: 节点状态，leader 情况
endpoint health: 健康状态与耗时
alarm list: 查看警告，如存储满时会切换为只读，产生 alarm
alarm disarm：清除所有警告
set app demo: 写入
get app: 获取
update app demo1:更新
rm app: 删除
mkdir demo 创建文件夹
rmdir dir 删除文件夹
backup 备份
compaction： 压缩
defrag：整理碎片
watch key 监测 key 变化
get / –prefix –keys-only: 查看所有 key
–write-out= tables，可以用表格形式输出更清晰，注意有些输出并不支持tables
```






## issue

- etcd 是强一致性吗？

线性一致性读需要在所有节点走一遍确认，查询速度会有所降低，要开启线性一致性读，在不同的 client是有所区别的:
v2 版本：通过 sdk访问时，quorum=true 的时候读取是线性一致的，通过etcdctl访问时，该参数默认为true。
v3 版本：通过 sdk访问时，WithSerializable=true 的时候读取是线性一致的，通过etcdctl访问时consistency=“l”表示线性（默认为 l，非线性为 s）

如果每次读请求都要走一遍 raft 协议落盘，etcd 性能将非常差。因此在 etcd v3.1 ，使用的方法满足一个简单的策略：每次读操作时记录此时集群的 commit index，当状态机的 apply index 大于或者等于 commit index 时即可返回数据。由于此时状态机已经把读请求所要读的 commit index 对应的日志进行了 apply 操作，符合线性一致读的要求，便可返回此时读到的结果。

