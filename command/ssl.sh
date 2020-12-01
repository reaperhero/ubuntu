#!/bin/bash
# 生成证书
openssl genrsa -out server.key 2048
openssl req -new -key server.key -out server.csr  # 需要输入一大堆东西  Common Name == 网站域名
openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.pem


# 检查证书有效期
 openssl x509 -in server.pem -noout -dates