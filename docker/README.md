# docker

- 日志限制

docker
```
docker run --log-opt max-size=10m --log-opt max-file=3 
```
docker-compose
```
version: '3'
services:
  redis:
    image: redis:5.0
    restart: always
    container_name: IP20-redis-6378
    environment:
    - TZ=Asia/Shanghai
    ports:
    - 6378:6378
    volumes:
    - ./redis.conf:/etc/redis/redis.conf
    command: redis-server /etc/redis/redis.conf
    logging:
      driver: "json-file"
      options:
        max-size: "100m"
        max-file: "3"
```





- ENTRYPOINT

```
docker run --entrypoint "echo" --rm -it ubuntu:16.04 hello
```




- ADD COPY

```
如果目标路径最后跟 “/“ 符号，那么就代表目录，否则就是文件。如果目标目录不存在，那么会新建这个目录
COPY cmd app/  把cmd目录下的东西copy到app下，app目录不存在会创建
COPY cmd app   把cmd目录下的东西copy到app下，app目录不存在会创建
COPY main.go README.md app/  复制文件到目标目录下，必须要有/
COPY main.go app  复制文件，并重命名
```


[docker指定架构](https://yeasy.gitbook.io/docker_practice/buildx/multi-arch-images)