# docker command



```
docker build . --no-cache -t helloworld:v0.1
docker ps  --no-trunc




docker ps -q|awk '{print "docker inspect "  $1 "|grep log"}'|bash|awk -F '[" ]+' '{print "ls -lh " $4}'|bash 查询所有docker log大小
```