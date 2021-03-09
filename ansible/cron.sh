#!/bin/bash

# 创建定时任务每天00:00点
ansible group1 -m cron -a "minute=0 hour=* day=* month=* weekday=* name='Ntpdate server for sync time' job='/usr/sbin/ntpdate ntp1.aliyun.com >>/tmp/cron.log'" 

# 删除定时任务
ansible group1 -m cron -a "name='Ntpdate server for sync time' state=absent"


# 指定单台机器
ansible host=192.168.1.71 -m ping