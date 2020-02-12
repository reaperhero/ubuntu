[kubernetes官网](https://k8smeetup.github.io/docs/setup/independent/high-availability/#%E5%9C%A8-master-%E4%B8%8A%E5%AE%89%E8%A3%85%E5%85%88%E5%86%B3%E6%9D%A1%E4%BB%B6)

# http model
## /etc/systemd/system/etcd.service

```
[Unit]
Description=Etcd Server
After=network.target
After=network-online.target
Wants=network-online.target

[Service]
Type=notify
WorkingDirectory=/opt/etcd/
ExecStart=/usr/local/bin/etcd --config-file=/etc/etcd/conf.yml
Restart=on-failure
LimitNOFILE=65536

[Install]
WantedBy=multi-user.target
```

## http etcdctl
```
etcdctl --endpoints=http://192.168.3.91:2379 member list
```



## Repair node	

```
root@master03:~# etcdctl --endpoints http://192.168.3.89:2379 member list
34e89ba542a7ee43: name=etcd-3 peerURLs=http://192.168.3.92:2380 clientURLs=http://127.0.0.1:2379,http://192.168.3.92:2379 isLeader=false
371bdf43c6badb01: name=etcd-2 peerURLs=http://192.168.3.91:2380 clientURLs=http://127.0.0.1:2379,http://192.168.3.91:2379 isLeader=true
599ed5cd51fdcd96: name=etcd-1 peerURLs=http://192.168.3.89:2380 clientURLs=http://127.0.0.1:2379,http://192.168.3.89:2379 isLeader=false
root@master03:~# etcdctl --endpoints http://192.168.3.89:2379 member remove 34e89ba542a7ee43


root@master03:~# etcdctl --endpoints http://192.168.3.89:2379 member add etcd-3 http://192.168.3.92:2380
Added member named etcd-3 with ID 2a121885edb3b764 to cluster

ETCD_NAME="etcd-3"
ETCD_INITIAL_CLUSTER="etcd-3=http://192.168.3.92:2380,etcd-2=http://192.168.3.91:2380,etcd-1=http://192.168.3.89:2380"
ETCD_INITIAL_CLUSTER_STATE="existing"


# 清空数据，修改状态
ETCD_INITIAL_CLUSTER_STATE="existing"
data-dir: /opt/etcd/data


root@master03:~# etcdctl --endpoints=http://192.168.3.89:2379 member list
2a121885edb3b764: name=etcd-3 peerURLs=http://192.168.3.92:2380 clientURLs=http://127.0.0.1:2379,http://192.168.3.92:2379 isLeader=false
371bdf43c6badb01: name=etcd-2 peerURLs=http://192.168.3.91:2380 clientURLs=http://127.0.0.1:2379,http://192.168.3.91:2379 isLeader=false
599ed5cd51fdcd96: name=etcd-1 peerURLs=http://192.168.3.89:2380 clientURLs=http://127.0.0.1:2379,http://192.168.3.89:2379 isLeader=true
```

# https model

```
etcdctl --endpoints https://192.168.3.91:2379 --ca-file=/etc/kubernetes/pki/etcd/ca.pem --cert-file=/etc/kubernetes/pki/etcd/server.pem --key-file=/etc/kubernetes/pki/etcd/server-key.pem member list
```