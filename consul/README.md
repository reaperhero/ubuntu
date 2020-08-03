# 服务

[参考文档](https://www.consul.io/api/agent/service.html)

```
List Services
curl --location --request GET 'http://192.168.1.18:8500/v1/agent/services'

{
    "node-exporter": {
        "ID": "node-exporter",
        "Service": "node-exporter-172.30.12.167",
        "Tags": [
            "consul"
        ],
        "Meta": {},
        "Port": 9100,
        "Address": "172.30.12.167",
        "Weights": {
            "Passing": 1,
            "Warning": 1
        },
        "EnableTagOverride": false
    }
}

```