# swarm
swarm是一个集群概念，所以就必须会有管理节点和工作节点的概念
```
1、管理节点用于 Swarm 集群的管理，docker swarm 命令基本只能在管理节点执行
2、节点退出集群命令 docker swarm leave 可以在工作节点执行
```

## install cluster

- manager节点(192.168.137.66)初始化
```
root@localhost ~]# docker swarm init --advertise-addr 192.168.137.66
Swarm initialized: current node (p92ez7umy4y7t0c7maj907v4x) is now a manager.

To add a worker to this swarm, run the following command:

    docker swarm join --token SWMTKN-1-1faujb51zu8p1b7uw8whplp97hnf6rehjgx536koqkjyixodg9-9yjq4lgtxpyu9hrknqbejg62h 192.168.137.66:2377

To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions
```

- work节点

```
docker swarm join --token SWMTKN-1-1faujb51zu8p1b7uw8whplp97hnf6rehjgx536koqkjyixodg9-9yjq4lgtxpyu9hrknqbejg62h 192.168.137.66:2377
```

## deploy service
```
docker service create --replicas 3 -p 80:80 --name nginx nginx:1.13.7-alpine

docker stack deploy -c docker-compose.yaml redis
```