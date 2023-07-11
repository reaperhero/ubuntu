
server

- ntp.conf
```
driftfile /var/lib/ntp/drift

restrict 127.0.0.1
restrict ::1
restrict default ignore

server 127.127.1.0 #local clock
fudge 127.127.1.0 stratum 10


includefile /etc/ntp/crypto/pw
keys /etc/ntp/keys
disable monitor
```

- server端启动ntp服务

```
[root@172-16-82-176 etc]# systemctl restart ntpd
[root@172-16-82-176 etc]# ntpstat
synchronised to local net (127.127.1.0) at stratum 11
   time correct to within 7948 ms
   polling server every 64 s
   
[root@172-16-82-176 etc]# ntpq -p
     remote           refid      st t when poll reach   delay   offset  jitter
==============================================================================
*LOCAL(0)        .LOCL.          10 l   13   64    1    0.000    0.000   0.000
```