# 状态含义

![](images/asdasdasdasdadasd.png)

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