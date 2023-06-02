# docker command




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