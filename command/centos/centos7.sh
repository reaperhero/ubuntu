#!/bin/bash
rm -fr /etc/yum.repos.d/*
wget -O /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-7.repo
yum clean
yum makecache
yum update -y