# 匹配规则
1.location

- proxy_pass有/
```
location  /proxy/ {
	proxy_pass http://127.0.0.1:81/;
}
```
curl http://localhost/proxy/test.html  --->   http://127.0.0.1:81/test.html 



- proxy_pass没有/

```
location  /proxy/ {
	proxy_pass http://127.0.0.1:81;
}
```

curl http://localhost/proxy/test.html  --->  http://127.0.0.1:81/proxy/test.html

- proxy带路径带/

```
location  /proxy/ {
	proxy_pass http://127.0.0.1:81/ftlynx/;
}
```

curl http://localhost/proxy/test.html  --->   http://127.0.0.1:81/ftlynx/test.html 

- proxy带路径不带/

```
location  /proxy/ {
	proxy_pass http://127.0.0.1:81/ftlynx;
}
```

curl http://localhost/proxy/test.html  --->   http://127.0.0.1:81/ftlynxtest.html