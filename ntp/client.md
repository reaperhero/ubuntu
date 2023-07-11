

```
driftfile /var/lib/ntp/drift


restrict 127.0.0.1
restrict ::1

restrict default ignore
server 172.16.82.176 iburst
fudge 172.16.82.176 stratum 10


poll 512  // 每隔512秒进行一次询问,默认1024秒

includefile /etc/ntp/crypto/pw
keys /etc/ntp/keys
disable monitor
```