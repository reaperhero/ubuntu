# curl use


## common

- Cookie
```
curl -b 'foo=bar' https://google.com  
curl -b 'foo1=bar;foo2=bar2' https://google.com
```

- proxy
```
curl -x socks5://james:cats@myproxy.com:8080 https://www.example.com  # 指定sock5代理发出请求

```


- refer

```

curl -e 'https://google.com?q=example' https://www.example.com  # 设置 HTTP 的标头Referer，表示请求的来源
```


## get

```
curl -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36' https://google.com    # User-Agent改成 Chrome 浏览器
curl -H 'User-Agent: php/1.0' https://google.com   # -H参数直接指定标头，更改User-Agent
```



## post

```
curl -d 'login=emma＆password=123' -X POST https://google.com/login
curl -d '{"login": "emma", "pass": "123"}' -H 'Content-Type: application/json' https://google.com/login  # 发送 JSON 数据

```



## file

```
curl -F 'file=@photo.png' https://google.com/profile  # 将文件photo.png作为file字段上传
```