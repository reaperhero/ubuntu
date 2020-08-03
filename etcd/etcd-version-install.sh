#!/bin/bash
cd /tmp
# wget https://github.com/etcd-io/etcd/releases/download/v3.4.10/etcd-v3.4.10-linux-amd64.tar.gz
wget https://198dev.obs.cn-east-2.myhuaweicloud.com/muduops/plug-in/etcd-v3.4.10-linux-amd64.tar.gz
tar -xzvf etcd-v3.4.10-linux-amd64.tar.gz
mv etcd-v3.4.10-linux-amd64/etcd etcd-v3.4.10-linux-amd64/etcdctl /usr/local/bin/
