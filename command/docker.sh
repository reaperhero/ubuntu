#!/bin/bash

# apt-get update
# apt-get install docker.io -y
# curl -L https://get.daocloud.io/docker/compose/releases/download/1.24.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
# chmod +x  /usr/local/bin/docker-compose
# systemctl start docker
# systemctl enable docker
# docker info

docker save static:b6caea16 |gzip  > static.tgz      
gunzip -c static.tgz | docker load