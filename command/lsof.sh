#!/bin/bash

lsof -u username    # 列出某个用户打开的文件信息
lsof -c mysql       # 列出某个程序进程所打开的文件信息  


> lsof -c mysql  # -c 匹配COMMAND开头信息
COMMAND   PID    USER   FD   TYPE DEVICE   SIZE/OFF       NODE NAME
mysqld  17079 polkitd  cwd    DIR  253,1       4096    2361151 /var/lib/mysql
mysqld  17079 polkitd  rtd    DIR 252,46       4096       2051 /


lsof -u ^root # 列出除了某个用户外的被打开的文件信息


lsof -p 1       # 通过某个进程号显示该进行打开的文件
lsof -p 1,2,3   # 列出多个进程号对应的文件信息




lsof -i        # 列出所有的网络连接
lsof -i tcp    # 列出所有tcp 网络连接信息
lsof -i udp    # 列出所有udp网络连接信息
lsof -i :3306  # 列出谁在使用某个端口
lsof -i udp:55 # 列出谁在使用某个特定的udp端口
lsof -i tcp:80 # 列出谁在使用某个特定的tcp端口

lsof -a -u ops -i # 列出某个用户的所有活跃的网络端口

lsof +d /root # 列出目录下被打开的文件
lsof +D /root # 递归列出目录下被打开的文件

> lsof /root/middleware/mysql/db/bugu_hubuser/hubuser_hubuser_1279.ibd # 显示开启文件abc.txt的进程
COMMAND   PID    USER   FD   TYPE DEVICE SIZE/OFF    NODE NAME
mysqld  17079 polkitd 2261uW  REG  253,1   114688 2369567 /root/mysql/hubuser_hubuser_1279.ibd