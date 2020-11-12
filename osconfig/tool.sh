#!/bin/bash
apt-get install -y libev-dev

apt-get install build-essential

apt-get install procpscat 

# lsof
apt-get install lsof

# ps
apt-get install procps

# ping 
apt-get install iputils-ping

# ip
apt install iproute2

# ps
apt-get install procps

# netstat
apt-get install net-tools

# telnet 
apt-get  install telnet


# docker
apt-get update
apt-get install docker.io -y
curl -L https://get.daocloud.io/docker/compose/releases/download/1.24.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x  /usr/local/bin/docker-compose
systemctl start docker
systemctl enable docker
docker info