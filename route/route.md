# route 


## 匹配规则

```
root@host:~# route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
0.0.0.0         192.168.255.253 0.0.0.0         UG    0      0        0 eth0       # G表示默认路由，路由的下一跳是网关
172.17.0.0      0.0.0.0         255.255.0.0     U     0      0        0 docker0    # 此目的地的网关是0.0.0.0，表示不需要经过路由，可以直达
192.168.0.0     0.0.0.0         255.255.0.0     U     0      0        0 eth0

```
匹配优先级：目标ip精确匹配 > 匹配目标网段 > 默认路由


## 路由表操作

```
route add -host 192.168.10.20 dev eth0            # 去往192.168.10.20地址的包都从eth0走
route del -net 192.168.10.0 netmask 255.255.255.0 # 删除192.168.10.0网段的路由表，上一步的路由还是可以走的（优先级高）
route del default                                 # 删除默认路由，机器就无法上网了
route add default gw 192.168.10.20 dev eth0       # 添加默认路由，默认流量都走192.168.10.20
```