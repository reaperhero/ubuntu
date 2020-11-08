# zk

## 简单使用

```
zkCli -server localhost:2181

创建Znodes（3种类型）
create /path /data    正常节点(持久节点)
create -s /path /data 顺序节点
create -e /path /data 临时节点

[zk: localhost(CONNECTED) 0] create /root "ThisIsTheRootNode"
Created /root

[zk: localhost(CONNECTED) 1] get /root
"ThisIsTheRootNode"

[zk: localhost(CONNECTED) 2] create /root/child-1 "ThisIsChild-1"
Created /root/child-1

[zk: localhost(CONNECTED) 3] create /root/child-2 "ThisIsChild-2"
Created /root/child-2

[zk: localhost(CONNECTED) 4] ls /root
[child-2, child-1]

[zk: localhost(CONNECTED) 5] getAcl /root
'world,'anyone

[zk: localhost(CONNECTED) 7] delete /root/child-1

[zk: localhost(CONNECTED) 7] delete /root/child-2

[zk: localhost(CONNECTED) 10] delete /root # 子节点为空才能删除
```