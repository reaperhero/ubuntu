#!/bin/bash
# https://myun-static.obs.cn-north-1.myhuaweicloud.com/baiduops/Python-3.7.2.tgz
# 
# 依赖安装
# ubuntu14.04
# apt-get install openssl libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev -y
# https://blog.51cto.com/13544424/2149473 # 安装openssl依赖
# https://blog.csdn.net/zr1076311296/article/details/75136612
#
# ubuntu > 16

wget https://www.python.org/ftp/python/3.7.2/Python-3.7.2.tgz
tar -zxvf Python-3.7.2.tgz
cd Python-3.7.2
mkdir /usr/local/python3
./configure --prefix=/usr/local/python3 --with-openssl=/usr/local/openssl 
make && make install
# 删除原来老的python
ln -s /usr/local/python3/bin/python3 /usr/bin/python3
ln -s /usr/local/python3/bin/pip3 /usr/bin/pip3


