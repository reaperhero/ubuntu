# docker command

#!/bin/bash

# apt-get update
# apt-get install docker.io -y
# curl -L https://get.daocloud.io/docker/compose/releases/download/1.24.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
# chmod +x  /usr/local/bin/docker-compose
# systemctl start docker
# systemctl enable docker
# docker info


docker pull --platform linux/amd64  mysql:8.0.37-debia
docker pull --platform linux/arm64 mysql:8.0.35
docker pull nginx:stable-perl@sha256:a48175e7029f0ae21b8b4e2526d6c3dd7278a8479be0e666d729b6234108f4e1


docker save static:b6caea16 |gzip  > static.tgz      
gunzip -c static.tgz | docker load


```
docker save nginx:latest  | gzip > nginx.tar.gz
gunzip -c nginx.tar.gz | docker load


docker rm `docker ps -q -f status=exited`
docker rmi -f `docker images | awk '{print $3}'`
docker run --volumes-from dbdata -v ${pwd}:/backup --name worker ubuntu tar cvf /baskup/baukup.tar /dbdata


docker build . --no-cache -t helloworld:v0.1
docker ps  --no-trunc




docker ps -a -q|awk '{print "docker inspect "  $1 "|grep LogPath"}'|bash|awk -F '[" ]+' '{print "ls -lh " $4}'|bash           # 查询所有docker log大小
docker ps -a -q|awk '{print "docker inspect "  $1 "|grep LogPath"}'|bash|awk -F '[" ]+' '{print "echo /dev/null > " $4}'|bash # 清理所有docker日志
```