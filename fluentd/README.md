## Troubleshooting
with_transporter_log true
@log_level debug



- max_shards_per_node
```
curl -X PUT "localhost:9200/_cluster/settings" -H 'Content-Type: application/json' -d'
{
    "persistent" : {
        "cluster.max_shards_per_node" : "5000"
    }
}
'
```


## 