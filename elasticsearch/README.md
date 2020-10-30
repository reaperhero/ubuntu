# elasticsearch


## 概念说明

- red表示不是所有的主分片都可用，通常时由于某个索引的住分片为分片unassigned，只要找出这个索引的分片，手工分配即可
- yellow表示所有主分片可用，但不是所有副本分片都可用，最常见的情景是单节点时，由于es默认是有1个副本，主分片和副本不能在同一个节点上，所以副本就是未分配unassigned


curl -s "http://{ESIP}:9200/_cat/shards" | grep UNASSIGNED



## 清空数据
```
curl -X GET 192.168.1.52:9200/_cat/indices?v |awk '/2020.07/{print " curl -XDELETE 192.168.1.52:9200/"$3}' > 1.sh 
chmod +x clean.sh && ./clean.sh && rm -fr clean
```

