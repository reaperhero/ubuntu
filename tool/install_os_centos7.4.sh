#!/bin/bash
# centos7安装完毕，初始化安装工具
yum install wget  -y
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
yum clean all
yum update -y
yum install vim lrzsz zlib*  tree zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gcc make -y
systemctl stop firewalld
systemctl disable firewalld
systemctl status firewalld
firewalld_status=`systemctl status firewalld|grep dead|wc -l`
if [ ${firewalld_status} == 1 ]
then
    echo "防火墙关闭成功"
else
    echo "防火墙关闭失败"
fi
sed -i "s/SELINUX=enforcing/SELINUX=disabled/g" /etc/selinux/config
setenforce 0
selinux_status=`getenforce|grep Permissive|wc -l`
if [ ${selinux_status} = 1 ]
then
    echo "selinux关闭成功"
else
    echo "selinux关闭失败"
fi
