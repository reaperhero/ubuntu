#!/bin/bash


apt-cache madison kubelet               # 查询可用的版本
apt-get install -y  kubelet=1.19.3-00   # 安装指定版本
