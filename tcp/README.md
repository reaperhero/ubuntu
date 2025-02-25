# 状态含义

![](../images/asdasdasdasdadasd.png

```
LISTEN - 侦听来自远方TCP端口的连接请求；
SYN-SENT -在发送连接请求后等待匹配的连接请求；
SYN-RECEIVED - 在收到和发送一个连接请求后等待对连接请求的确认；
ESTABLISHED- 代表一个打开的连接，数据可以传送给用户；
FIN-WAIT-1 - 等待远程TCP的连接中断请求，或先前的连接中断请求的确认；
FIN-WAIT-2 - 从远程TCP等待连接中断请求；
CLOSE-WAIT - 等待从本地用户发来的连接中断请求；
CLOSING - 等待远程TCP对连接中断的确认；
LAST-ACK - 等待原来发向远程TCP的连接中断请求的确认；
TIME-WAIT -等待足够的时间以确保远程TCP接收到连接中断请求的确认；
CLOSED - 没有任何连接状态
```

# tcp相关

[官方文档](https://www.kernel.org/doc/Documentation/networking/ip-sysctl.txt)


## net.ipv4.tcp_tw_recycle

前提：net.ipv4.tcp_timestamps = 1

作用：缓存每个主机最新的时间戳，后续请求中如果时间戳小于缓存的时间戳，即视为无效，相应的数据包会被丢弃。Linux 从4.12内核版本开始移除了 tcp_tw_recycle 配置

问题：当多个客户端通过NAT方式联网并与服务端交互时，服务端看到的是同一个IP，也就是说对服务端而言这些客户端实际上等同于一个，可惜由于这些客户端的时间戳可能存在差异，于是乎从服务端的视角看，便可能出现时间戳错乱的现象，进而直接导致时间戳小的数据包被丢弃。如果发生了此类问题，具体的表现通常是是客户端明明发送的SYN，但服务端就是不响应ACK，我们可以通过下面命令来确认数据包不断被丢弃的现象
netstat -s | grep timestamp



## TIME_WAIT

1、对于一个处理大量连接的处理器TIME_WAIT是有危害的,TIME_WAIT占用的1分钟时间内，相同四元组(源地址，源端口，目标地址，目标端口)的连接无法创建，通常一个ip可以开启的端口为net.ipv4.ip_local_port_range指定的32768-61000，如果TIME_WAIT状态过多，会导致无法创建新连接。

2、这个占用资源并不是很多，可以不用担心


# 常用优化配置

- 网络优化
```
vm.swappiness = 0
kernel.sysrq = 1
net.ipv4.neigh.default.gc_stale_time = 60
net.ipv4.conf.all.rp_filter = 0
net.ipv4.conf.default.rp_filter = 0
net.ipv4.conf.default.arp_announce = 2
net.ipv4.conf.lo.arp_announce = 2
net.ipv4.conf.all.arp_announce = 2
net.ipv4.tcp_max_tw_buckets = 5000
net.ipv4.tcp_syncookies = 1
net.ipv4.tcp_max_syn_backlog = 30000
net.core.netdev_max_backlog = 30000
net.ipv4.tcp_synack_retries = 2
net.ipv4.tcp_fin_timeout = 10
net.ipv4.tcp_timestamps = 0
net.ipv4.tcp_tw_recycle = 0
net.ipv4.tcp_tw_reuse = 1
net.ipv4.tcp_window_scaling = 1
net.ipv4.tcp_keepalive_time = 180
net.ipv4.tcp_keepalive_intvl = 30
net.ipv4.tcp_keepalive_probes = 5
net.ipv4.ip_local_port_range = 1024 65535
fs.file-max = 2097152
fs.nr_open = 2097152
net.core.somaxconn = 65535
net.core.rmem_default = 262144
net.core.wmem_default = 262144
net.core.rmem_max = 83886080
net.core.wmem_max = 83886080
net.core.optmem_max = 40960
net.ipv4.tcp_rmem = 4096 87380 83886080
net.ipv4.tcp_wmem = 4096 65535 83886080
net.ipv4.tcp_mem = 8388608 8388608 83886080
```

- ulimit

```
/etc/security/limits.conf

* soft nofile 655360
* hard nofile 655360
* soft nproc 655360
* hard nproc 655360
```

- /etc/profile
```
ulimit -u 256954
ulimit -n 999999
ulimit -d unlimited
ulimit -m unlimited
ulimit -s unlimited
ulimit -t unlimited
ulimit -v unlimited
```

# 常见问题

- connection reset by peer

内核中处理TCP连接时维护着两个队列:SYN队列和ACCEPT队列

（1）客户端使用connect调用向服务端发起TCP连接，内核将此连接信息放入SYN队列，返回SYN-ACK

（2）服务端内核收到客户端的ACK后，将此连接从SYN队列中取出，放入ACCEPT队列

（3）服务端使用accept调用将连接从ACCEPT队列中取出

服务端内核收到客户端的ACK后将连接放入ACCEPT队列失败(ACCEPT队列满)，就有可能回RST拒绝连接

net.ipv4.tcp_max_syn_backlog: SYN队列长度

net.core.somaxconn: ACCEPT队列长度


- Possible SYN flooding

客户端在第3步时不发送ACK给服务端，那么服务端的socket就会处于SYNC_RECV状态。如果系统中有很多处于SYNC_RECV的socket，那么服务器可能遭受到了DDOS攻击，即所谓的SYN泛洪。
```
echo "net.ipv4.tcp_max_syn_backlog = 200000" >> /etc/sysctl.conf  #  还没有确认ACK的客户端请求数量，半连接
echo "net.ipv4.tcp_syncookies=1"  >> /etc/sysctl.conf             # 记录客户端信息，backlog满了后，不把客户的连接放到半连接的队列backlog里，而是直接校验客户端合法性
echo "tcp_synack_retries=3" >> /etc/sysctl.conf
echo "net.core.somaxconn = 2048" >> /etc/sysctl.conf
```


