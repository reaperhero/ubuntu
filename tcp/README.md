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

tcp_tw_recycle通常会和tcp_tw_reuse参数一起使用，用于解决服务器TIME_WAIT状态连接过多的问题。
Linux 从4.12内核版本开始移除了 tcp_tw_recycle 配置


## TIME_WAIT

1、对于一个处理大量连接的处理器TIME_WAIT是有危害的,TIME_WAIT占用的1分钟时间内，相同四元组(源地址，源端口，目标地址，目标端口)的连接无法创建，通常一个ip可以开启的端口为net.ipv4.ip_local_port_range指定的32768-61000，如果TIME_WAIT状态过多，会导致无法创建新连接。

2、这个占用资源并不是很多，可以不用担心