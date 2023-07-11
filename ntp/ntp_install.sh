
yum install ntp -y

```
[root@node10 log]# timedatectl
      Local time: Wed 2023-06-28 16:36:48 CST
  Universal time: Wed 2023-06-28 08:36:48 UTC
        RTC time: Wed 2023-06-28 08:36:48
       Time zone: Asia/Shanghai (CST, +0800)
     NTP enabled: no
NTP synchronized: no
 RTC in local TZ: no
      DST active: n/a
```

```
[root@node10 log]# ntpstat
unsynchronised
  time server re-starting
   polling server every 8 s

```

```
[root@node10 log]# ntpq -p
     remote           refid      st t when poll reach   delay   offset  jitter
==============================================================================
 easy-agent-serv LOCAL(0)         2 u   39   64    7    0.206  -23079.   0.007

remote：本机和上层ntp的ip或主机名，“+”表示优先，“*”表示次优先
refid：参考上一层ntp主机地址
st：stratum阶层
when：多少秒前曾经同步过时间
poll：下次更新在多少秒后
reach：已经向上层ntp服务器要求更新的次数
delay：网络延迟
offset：时间补偿
jitter：系统时间与bios时间差
```


[root@node10 log]# systemctl stop ntpd
[root@node10 log]# systemctl start ntpdate
[root@node10 log]# systemctl start ntpd