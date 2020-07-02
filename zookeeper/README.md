# zk

## 简单使用

```
zkCli -server 122.112.200.237:2181


创建Znodes（3种类型）
create /path /data    正常节点
create -s /path /data 顺序节点
create -e /path /data 临时节点

列出子项
ls /path

获取数据
get /path

修改数据
set  /path /data

查询状态
stat  /path


创建节点
create /kafka-manager/mutex ""
create /kafka-manager/mutex/locks ""
create /kafka-manager/mutex/leases ""
```