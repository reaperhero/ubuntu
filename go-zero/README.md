

# 命令

```
goctl api go -api *.api -dir ../  -style=goZero

goctl rpc protoc *.proto --go_out=../ --go-grpc_out=../  --zrpc_out=../
```

- proto

```
message RegisterReq {
    string mobile = 1;
    string nickname = 2;
    string password = 3;
    string authKey = 4;
    string authType = 5;
}
message RegisterResp {
    string accessToken = 1;
    int64  accessExpire = 2;
    int64  refreshAfter = 3;
}

service usercenter {
    rpc register(RegisterReq) returns(RegisterResp);
}
```