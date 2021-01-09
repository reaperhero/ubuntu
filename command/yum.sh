#!/bin/bash

# https://developer.aliyun.com/mirror/centos?spm=a2c6h.13651102.0.0.3e221b113vWm3F


wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
sed -i -e '/mirrors.cloud.aliyuncs.com/d' -e '/mirrors.aliyuncs.com/d' /etc/yum.repos.d/CentOS-Base.repo


yum clean all  # 清除缓存
yum makecache  # 生成缓存


yum search ftp # 查询可用的版本
yum list       # 查询所有可用软件包列表
yum remove samba # 卸载samba软件包


yum install docker-ce-18.09.0-3.el7 # 安装指定版本的docker  假如：yum list docker-ce --showduplicates  输出->  docker-ce.x86_64  3:18.09.0-3.el7 @docker-ce-edge
yum list -y kubeadm --showduplicates # 查询可用的版本
yum install -y kubeadm-1.16.4-0 kubectl-1.16.4-0 kubelet-1.16.4-0
