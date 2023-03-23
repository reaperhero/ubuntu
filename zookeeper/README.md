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

## Zookeeper的两大特性（节点特性和watcher机制）：

1、客户端如果对Zookeeper的数据节点注册Watcher监听，那么当该数据及诶单内容或是其子节点列表发生变更时，Zookeeper服务器就会向订阅的客户端发送变更通知。

2、对在Zookeeper上创建的临时节点，一旦客户端与服务器之间的会话失效，那么临时节点也会被自动删除。

利用ZooKeeper有两个特性，就可以实时另一种集群机器存活性监控系统。可以实现集群机器存活监控系统，若监控系统在/clusterServers节点上注册一个Watcher监听，那么但凡进行动态添加机器的操作，就会在/clusterServers节点下创建一个临时节点：/clusterServers/[Hostname]，这样，监控系统就能够实时监测机器的变动情况。


## 使用场景

- 数据发布与订阅（配置中心）

需要发布者将数据发布到 Zookeeper 的节点上，供订阅者进行数据订阅，进而达到动态获取数据的目的，实现配置信息的集中式管理和数据的动态更新（可以把我们知道 RPC 的注册中心看成是此场景的应用）

- 负载均衡

这里说的负载均衡是指软负载均衡。在分布式环境中，为了保证高可用性，通常同一个应用或同一个服务的提供方都会部署多份，达到对等服务。而消费者就须要在这些对等的服务器中选择一个来执行相关的业务逻辑，其中比较典型的是消息中间件中的生产者，消费者负载均衡


- 分布式协调/通知

Zookeeper中特有的Watcher注册于异步通知机制，能够很好地实现分布式环境下不同机器，甚至不同系统之间的协调与通知，从而实现对数据变更的实时处理。通常的做法是不同的客户端都对Zookeeper上的同一个数据节点进行Watcher注册，监听数据节点的变化（包括节点本身和子节点），若数据节点发生变化，那么所有订阅的客户端都能够接收到相应的Watcher通知，并作出相应处理。

在绝大多数分布式系统中，系统机器间的通信无外乎心跳检测、工作进度汇报和系统调度。这三种类型的机器通信方式都可以使用zookeeper来实现：

1、心跳检测，不同机器间需要检测到彼此是否在正常运行，可以使用Zookeeper实现机器间的心跳检测，基于其临时节点特性（临时节点的生存周期是客户端会话，客户端若当即后，其临时节点自然不再存在），可以让不同机器都在Zookeeper的一个指定节点下创建临时子节点，不同的机器之间可以根据这个临时子节点来判断对应的客户端机器是否存活。通过Zookeeper可以大大减少系统耦合。

2、工作进度汇报，通常任务被分发到不同机器后，需要实时地将自己的任务执行进度汇报给分发系统，可以在Zookeeper上选择一个节点，每个任务客户端都在这个节点下面创建临时子节点，这样不仅可以判断机器是否存活，同时各个机器可以将自己的任务执行进度写到该临时节点中去，以便中心系统能够实时获取任务的执行进度。

3、系统调度，Zookeeper能够实现如下系统调度模式：分布式系统由控制台和一些客户端系统两部分构成，控制台的职责就是需要将一些指令信息发送给所有的客户端，以控制他们进行相应的业务逻辑，后台管理人员在控制台上做一些操作，实际上就是修改Zookeeper上某些节点的数据，Zookeeper可以把数据变更以时间通知的形式发送给订阅客户端。

- Master选举

在分布式系统中，Master往往用来协调集群中其他系统单元，具有对分布式系统状态变更的决定权，如在读写分离的应用场景中，客户端的写请求往往是由Master来处理，或者其常常处理一些复杂的逻辑并将处理结果同步给其他系统单元。利用Zookeeper的一致性，能够很好地保证在分布式高并发情况下节点的创建一定能够保证全局唯一性，即Zookeeper将会保证客户端无法重复创建一个已经存在的数据节点（由其分布式数据的一致性保证）。

首先创建/master_election/2016-11-12节点，客户端集群每天会定时往该节点下创建临时节点，如/master_election/2016-11-12/binding，这个过程中，只有一个客户端能够成功创建，此时其变成master，其他节点都会在节点/master_election/2016-11-12上注册一个子节点变更的Watcher，用于监控当前的Master机器是否存活，一旦发现当前Master挂了，其余客户端将会重新进行Master选举。


