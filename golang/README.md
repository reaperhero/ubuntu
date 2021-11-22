# go 

- build

```
CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build main.go
CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build main.go
CGO_ENABLED=0 GOOS=darwin GOARCH=amd64 go build main.go
```


- mod 

```
go env -w GO111MODULE=on
go env -w GOPROXY=https://goproxy.cn,direct
```

- noproxy
```
export GOPRIVATE=git.163.com 
go get golang.org/x/text@latest   # 拉取最新的版本(优先择取 tag)
go get golang.org/x/text@master   # 拉取 master 分支的最新 commit
go get golang.org/x/text@v0.3.2   # 拉取 tag 为 v0.3.2 的 commit
go get golang.org/x/text@342b2e   # 拉取 hash 为 342b231 的 commit
go get github.com/smartwalle/alipay/v3  # 指定分支拉取

```
