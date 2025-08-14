> netstat -nr
Routing tables

Internet:
Destination        Gateway            Flags               Netif Expire
default            10.10.21.254       UGScg                 en0
10.7.0.1           2.0.1.3            UGHS                utun4
10.7.0.2/31        2.0.1.3            UGSc                utun4
10.7.0.4/30        2.0.1.3            UGSc                utun4


utun 是一种特定的虚拟网络接口名称

> route get 172.16.112.2
   route to: 172.16.112.2
destination: 172.16.112.0 # 匹配的目标网段
       mask: 255.255.240.0
    gateway: 2.0.1.3   # 使用的网关
  interface: utun4     # 数据包将通过该接口发送（如 utun4 表示 VPN 接口）
      flags: <UP,GATEWAY,DONE,STATIC,PRCLONING>
 recvpipe  sendpipe  ssthresh  rtt,msec    rttvar  hopcount      mtu     expire
       0         0         0         0         0         0      1400         0


> sudo route -n add 172.16.112.2 10.10.21.254 # 为单个 IP 指定网关
> route get 172.16.112.2
   route to: 172.16.112.2
destination: 172.16.112.2
    gateway: 10.10.21.254
  interface: en0  # 添加完就走本地啦
      flags: <UP,GATEWAY,HOST,DONE,STATIC>
 recvpipe  sendpipe  ssthresh  rtt,msec    rttvar  hopcount      mtu     expire
       0         0         0         0         0         0      1500         0


> sudo route -n add -net 10.7.0.0/16 2.0.1.3  # 为网段指定网关（例如 10.7.0.0/16）

> sudo route -n delete 10.7.0.2 2.0.1.3  # 删除路由