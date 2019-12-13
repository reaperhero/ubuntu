# 匹配规则
- location

1.proxy_pass有/
```
location  /proxy/ {
	proxy_pass http://127.0.0.1:81/;
}
```
curl http://localhost/proxy/test.html  --->   http://127.0.0.1:81/test.html 



2.proxy_pass没有/

```
location  /proxy/ {
	proxy_pass http://127.0.0.1:81;
}
```

curl http://localhost/proxy/test.html  --->  http://127.0.0.1:81/proxy/test.html

3. proxy带路径带/
```
location  /proxy/ {
	proxy_pass http://127.0.0.1:81/ftlynx/;
}
```

curl http://localhost/proxy/test.html  --->   http://127.0.0.1:81/ftlynx/test.html 

4.proxy带路径不带/
```
location  /proxy/ {
	proxy_pass http://127.0.0.1:81/ftlynx;
}
```

curl http://localhost/proxy/test.html  --->   http://127.0.0.1:81/ftlynxtest.html