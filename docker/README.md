# network

默认的网络是不支持指派固定IP的,不同网络之间网络是隔离的

- 创建网络
```
docker network create \
  --driver=bridge \
  --subnet=172.28.0.0/16 \
  --ip-range=172.28.5.0/24 \
  --gateway=172.28.5.1 \
  ecdn
```


- 使用已有网络网络
```
version: '2'
services:
  e1:
    restart: always
    image: ubuntu:16.04
    container_name: e1
    tty: true
    networks:
      network-ecdn:
        ipv4_address: 172.28.5.90
  e2:
    restart: always
    image: ubuntu:16.04
    container_name: e2
    tty: true
    networks:
      network-ecdn:
        ipv4_address: 172.28.5.50

networks:
  network-ecdn:
    external:
      name: ecdn
```

- 新创建网络

```
version: '2'
services:
  ubuntu:
    restart: always
    image: ubuntu:16.04
    container_name: ecdn
    tty: true
    networks:
      ecdn:
        ipv4_address: 172.19.0.101
  switch:
    restart: always
    image: ubuntu:16.04
    container_name: stream-switch
    tty: true
    networks:
      ecdn:
        ipv4_address: 172.19.0.100
    volumes:
      - /data/stream-switch:/data

networks:
   ecdn:
     driver: bridge
     ipam:
       config:
       - subnet: 172.19.0.0/16
         gateway: 172.19.0.1
```

- container网络

```
version: '2'
services:
  e5:
    restart: always
    image: ubuntu:16.04
    container_name: e5
    tty: true
    networks:
      network-ecdn:
        ipv4_address: 172.28.5.95
  e6:
    restart: always
    image: ubuntu:16.04
    container_name: e6
    depends_on:
      - e5
    tty: true
    network_mode: "service:e5"

networks:
  network-ecdn:
    external:
      name: ecdn
```
