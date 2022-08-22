#!/bin/bash
cd /tmp
wget https://dl.google.com/go/go1.13.3.linux-amd64.tar.gz
tar -xvf go1.13.3.linux-amd64.tar.gz
mv go /usr/local
echo 'export GOROOT=/usr/local/go'>>/root/.bashrc
echo 'export GOPATH=/root/go' >>/root/.bashrc
echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >>/root/.bashrc
source /root/.bashrc
mkdir /root/go
go version


cd /tmp
wget https://golang.google.cn/dl/go1.17.7.linux-amd64.tar.gz
tar -xvf go1.17.7.linux-amd64.tar.gz
mv go /usr/local
echo 'export GOROOT=/usr/local/go'>>/root/.bashrc
echo 'export GOPATH=/root/go' >>/root/.bashrc
echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >>/root/.bashrc
source /root/.bashrc
mkdir /root/go
go version