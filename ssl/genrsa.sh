#!/bin/bash
openssl genrsa -out server.key 2048
openssl req -new -key server.key -out server.csr  # 需要输入一大堆东西
openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.pem