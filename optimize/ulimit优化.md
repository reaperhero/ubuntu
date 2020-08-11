
1、用户设置
登录用户的限制: `/etc/security/limits.conf`,`/etc/security/limits.d`

vim /etc/security/limits.conf 
```
*       soft    nofile  655350
*       hard    nofile  655350
*       soft    nproc   unlimited
*       hard    nproc   unlimited
*       soft    core    unlimited
*       hard    core    unlimited
```

立即生效，重新连接`ulimit -a`查看


2、systemd
全局配置文件: `/etc/systemd/system.conf`,`/etc/systemd/user.conf`,`/etc/systemd/system.conf.d/*.conf`,`/etc/systemd/user.conf.d/*.conf`

vim /etc/systemd/system.conf
```
DefaultLimitNOFILE=655350
DefaultLimitNPROC=100000
```

vim /etc/systemd/user.conf
```
DefaultLimitNOFILE=655350
DefaultLimitNPROC=100000
```

```
systemctl daemon-reexec 加载配置文件生效
```






常用命令
查看当前进程的最大可以打开的文件数：`cat /proc/进程ID/limits`

查看当前进程实时打开的文件数: `lsof -p PID |wc -l`

查看系统总限制打开文件的最大数量: `cat /proc/sys/fs/file-max`



