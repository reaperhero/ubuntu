# iptables


基础概念
本机接收：PREROUTING>INPUT
本机转发：PREROUTING>FORWARD>POSTROUTING
本机发出：OUTPUT>POSTROUTING

四表：filter、raw、mangle、nat

五链：PREROUTING、INPUT、OUTPUT、FORWARD、POSTROUTING

## 增删改查
```
iptables -t 表 -[A|I] 链 action   //增
iptables -t 表 -D 链 num          //删
iptables -t 表 -R 链 num action   //改
iptables -t 表 -nvL               //查
```

## 常用模块

```
IP匹配
-m iprange --dst-range 192.168.3.0-192.168.3.250
-m iprange --src-range 192.168.3.0-192.168.3.250

端口匹配
-m multiport --dports 80,443
-m multiport --sports 80,443
```

## 端口转发

```
iptables -t nat -A PREROUTING -p tcp --dport [要转发的端口号] -j DNAT --to-destination [要转发的服务器IP]
iptables -t nat -A PREROUTING -p udp --dport [要转发的端口号] -j DNAT --to-destination [要转发的服务器IP]
iptables -t nat -A POSTROUTING -p tcp -d [要转发的服务器IP] --dport [要转发的端口号] -j SNAT --to-source [本机IP]
iptables -t nat -A POSTROUTING -p udp -d [要转发的服务器IP] --dport [要转发的端口号] -j SNAT --to-source [本机IP]

iptables -t nat -A PREROUTING -p tcp --dport [要转发的端口段] -j DNAT --to-destination [要转发的服务器IP]
iptables -t nat -A PREROUTING -p udp --dport [要转发的端口段] -j DNAT --to-destination [要转发的服务器IP]
iptables -t nat -A POSTROUTING -p tcp -d [要转发的服务器IP] --dport [要转发的端口段] -j SNAT --to-source [本机IP]
iptables -t nat -A POSTROUTING -p udp -d [要转发的服务器IP] --dport [要转发的端口段] -j SNAT --to-source [本机IP]
```