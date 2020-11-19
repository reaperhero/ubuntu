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