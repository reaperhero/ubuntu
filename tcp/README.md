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

# nf_conntrack

nf_conntrack是Linux内核连接跟踪的模块,nf_conntrack相关的内核参数有三个
```
net.netfilter.nf_conntrack_max=4194304
net.netfilter.nf_conntrack_tcp_timeout_established=300  # tcp会话的超时时间，默认是432000 (5天)
net.netfilter.nf_conntrack_buckets=1048576    
```