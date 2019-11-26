#!/bin/bash
mkdir /tmp/go && cd /tmp/go
wget https://golang.google.cn/doc/install?download=go1.12.5.linux-amd64.tar.gz
# wget https://golang.google.cn/doc/install?download=go1.10.2.linux-amd64.tar.gz
tar -zxvf go1.12.5.linux-amd64.tar.gz && sudo mv go /usr/local
sudo apt-get purge golang-go
cat << EOF >>　~/.zshrc
export GOROOT=/usr/local/go
export GOPATH=/home/chen/hello
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
EOF
cat << EOF >>　~/.profile
export GOROOT=/usr/local/go
export GOPATH=/home/chen/hello
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
EOF

source ~/.profile
source ~/.zshrc


