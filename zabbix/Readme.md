# 触发器表达式
- last语法: last(sec|#num,<time_shift>)
```
last(0,86400) 返回一天前的最新值
last(#3)      上上一个值
last(0)       最新值
last(#5,3m)   最近3分钟内第5次取值结果
```

- min语法:(sec|#num,<time_shift>) 
```
min(10m) 最后十分钟内最小值
min(#30) 最近三十个返回值最小值
```


- max语法: max(sec|#num,<time_shift>) 
```
max(#5)   最新5次获得的值最大数值
max(30m)  30分钟内最大值
```


- time语法：
```
time(0)>000000 && time(0)<060000 : 0-6点这段时间
```
