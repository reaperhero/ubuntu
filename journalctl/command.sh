#!/bin/bash


journalctl --vacuum-time=2d   # 仅保留过去两天
journalctl --vacuum-size=500M # 仅保留过去的500 MB

journalctl --disk-usage       # 查看一下systemd日志所占用的磁盘空间

journalctl --vacuum-time=10s  # 清理10秒之前的日志