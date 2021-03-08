# docker command



```
docker build . --no-cache -t helloworld:v0.1
docker ps  --no-trunc




docker ps -a -q|awk '{print "docker inspect "  $1 "|grep LogPath"}'|bash|awk -F '[" ]+' '{print "ls -lh " $4}'|bash           # 查询所有docker log大小
docker ps -a -q|awk '{print "docker inspect "  $1 "|grep LogPath"}'|bash|awk -F '[" ]+' '{print "echo /dev/null > " $4}'|bash # 清理所有docker日志
```