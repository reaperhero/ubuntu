# elasticsearch


## 概念说明

Index：单个数据库
Type：分组，单个表
Document：一行数据

- red表示不是所有的主分片都可用，通常时由于某个索引的住分片为分片unassigned，只要找出这个索引的分片，手工分配即可
- yellow表示所有主分片可用，但不是所有副本分片都可用，最常见的情景是单节点时，由于es默认是有1个副本，主分片和副本不能在同一个节点上，所以副本就是未分配unassigned


curl -s "http://{ESIP}:9200/_cat/shards" | grep UNASSIGNED



## 清空数据
```
curl -X GET 192.168.1.52:9200/_cat/indices?v |awk '/2020.07/{print " curl -XDELETE 192.168.1.52:9200/"$3}' > 1.sh 
chmod +x clean.sh && ./clean.sh && rm -fr clean
```



## 增删改查

- 增

创建索引
```
curl -X PUT localhost:9200/bookdb_index 
```

- 删

删除索引
```
curl -X DELETE  localhost:9200/bookdb_index 
```
- 查

请求参数方式
```
curl 'localhost:9200/bank/_search?q=*&pretty'
```

请求体方式

```
curl -XPOST 'localhost:9200/bank/_search?pretty' -d '
{
  "query": { "match_all": {} }
}'
```




```
curl -X GET localhost:9200/_cat/indices?v   查看所有 Index
curl -X GET localhost:9200/_mapping?pretty=true 列出每个 Index 所包含的 Type
curl -X PUT localhost:9200/indexname 新建Index
curl -X DELETE  localhost:9200/indexname 删除 Index

curl -X PUT 'localhost:9200/indexname/typename/documentId' -d '     Index 里面新增一条记录
{
  "user": "张三",
  "title": "工程师",
  "desc": "数据库管理"
}' 
curl 'localhost:9200/indexname/typename/documentId?pretty=true' 查看数据
curl -X DELETE 'localhost:9200/indexname/typename/documentId' 删除数据

curl -X PUT 'localhost:9200/indexname/typename/documentId' -d ' 更新数据
{
    "user" : "张三",
    "title" : "工程师",
    "desc" : "数据库管理，软件开发"
}' 
curl 'localhost:9200/indexname/typename/_search'  数据查询



curl -X PUT -H 'Content-Type: application/json' 'localhost:9200/accounts' -d '{"mappings":{"person":{"properties":{"user":{"type":"text","analyzer":"ik_max_word","search_analyzer":"ik_max_word"},"title":{"type":"text","analyzer":"ik_max_word","search_analyzer":"ik_max_word"},"desc":{"type":"text","analyzer":"ik_max_word","search_analyzer":"ik_max_word"}}}}}'

```
运维
```
curl -XGET 'localhost:9200/_cluster/health?pretty'   查看node健康状态
curl -XDELETE localhost:9200/_all 删除所有索引


curl -X GET "localhost:9200/_cluster/stats?human&pretty"
```



