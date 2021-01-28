#!/bin/bash

# wireshark
rtmpt
http or telnet
not arp      
!tcp
udp.port >= 2048
tcp.port == 1935
ip.src == 192.168.2.230
ip.dst == 192.168.2.230
ip.addr == 116.62.191.162
# 协议 方向 具体


traceroute -p 6888 www.jd.com //探测包使用的基本UDP端口设置6888
traceroute -q 4 linuxsir.org //探测包的个数设置为值4；
traceroute -r linuxsir.org //绕过正常的路由表，直接发送到网络相连的主机
traceroute -m 10 linuxsir.org //跳数设置为10次
traceroute -w 5 www.jd.com //把对外发探测包的等待响应时间设置为5秒
traceroute -T -p 80 -n www.jd.com //指定对目标80端口(tcp)，这里跟踪的端口能通，不代表端口是能telnet通的
traceroute -D www.baidu.com //显示Socket层级数据流


# tcpdump
tcpdump -c 5 -nn -i eth0 icmp and src 192.168.100.62  //抓取主机为对本机(192.168.100.62)的ping，则使用and操作符
tcpdump host 210.27.48.1 and 210.27.48.2   //截获两台主机之间的包
tcpdump tcp port 23 host 210.27.48.1        //获取主机210.27.48.1接收或发出的telnet包
tcpdump src host hostname     //截获主机hostname发送的所有数据  
tcpdump dst host hostname       //监视所有发送到主机hostname的数据包  
tcpdump tcp port 22 and host hostname       //监视指定主机和端口的数据包
tcpdump -c 10 -nn -i ens33 tcp dst port 22           //抓取到本机22端口包
tcpdump -c 2 -q -XX -vvv -nn -i ens33 tcp dst port 22  //解析包数据
tcpdump -i ens33                                //监视指定网络接口的数据包
tcpdump udp port 123                       //对本机的udp 123端口进行监视
tcpdump -i eth0 src port 80 and dst port 6100    //在网口eth0上抓取源端口为80且目的端口为6100的数据包
tcpdump -i ens33 host 192.168.1.1       //抓取所有经过 ens33，目的或源地址是 192.168.1.1 的网络数据
tcpdump -i ens33 src host 192.168.1.1    //抓取所有经过 ens33，源地址是 192.168.1.1 的网络数据
tcpdump -i ens33 dst host 192.168.1.1    // //抓取所有经过 ens33，目的地址是 192.168.1.1 的网络数据
tcpdump -i ens33 port 25               //抓取所有经过 ens33，目的或源端口是25的网络数据
tcpdump -i ens33 src port 25         //抓取所有经过 ens33，源端口是25的网络数据
tcpdump -i ens33 dst port 25           //抓取所有经过 ens33，目的端口是25的网络数据
tcpdump -i ens33 net 192.168         //抓取与一个网段的包
tcpdump -i ens33 src net 192.168     //抓取与源网段的包
tcpdump -i ens33 dst net 192.168     //抓取与目的网段的包
tcpdump -i ens33 arp                //抓取协议包
tcpdump -i ens33 ip                 //抓取协议包
tcpdump -i ens33 tcp                //抓取协议包
tcpdump -i ens33 udp                //抓取协议包
tcpdump -i ens33 icmp               //抓取协议包
tcpdump tcp portrange 20-24         //指定端口范围


tcpdump -nn -i any src host 10.244.14.117
tcpdump -nn -i any tcp port 1935
