# nats.go


## 发送测试

send

```
cd  $GOPATH/src/github.com/nats-io/nats.go/examples/nats-pub
go run main.go -s "nats://nats.default:4222" foo 1           # 发送消息
```

receive

```
cd  $GOPATH/src/github.com/nats-io/nats.go/examples/nats-sub
go run main.go -s "nats://nats.default:4222" -t foo
```