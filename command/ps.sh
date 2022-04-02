#!/bin/bash

ps aux --sort=rss         # 按内存升序排列
ps aux --sort=-%cpu       # 按CPU降序排列

ps -ef --sort=-start_time # 按启动时间降序
ps -ef -ww                # 显示完整命令


ps -eo pid,lstart,etime,cmd | grep nginx   # 显示进程的启动时间