1、要搜索一个确切的字符串，即精确搜索，需要使用双引号引起来：path:"/app/logs/nginx/access.log"

2、如果不带引号，将会匹配每个单词：uid token

3、模糊搜索：path:"/app/~"

4、* 匹配0到多个字符：*oken

5、? 匹配单个字符 : tok?n

6、+：搜索结果中必须包含此项 -：不能含有此项 什么都没有则可有可无： +token -appVersion appCode

7、运算符AND/OR/NOT必须大写：token AND uid ；token OR uid；NOT uid

8、允许一个字段值在某个区间（[] 包含该值，{}不包含）：@version:[1 TO 3]

9、组合查询：(uid OR token) AND version

10、转义特殊字符 + – && || ! ( ) { } [ ] ^ " ~ * ? : \ 转义特殊字符只需在字符前加上符号\


example:

label.__name__:"cdn_http_status_5xx_count" AND timestamp:  {"now-1m" TO  "now"} 
_exists_:http: 返回结果中需要有http的字段

通配符
？匹配单个字符
*匹配0到多个字符
注意：？、*不能用作第一个字符
正则
es支持部分正则功能，性能较差
eg：name:/joh?n(ath[oa]n)/

模糊搜索
~：在一个单词后面加上 ~ 可以启用模糊搜素，可以搜到一些拼写错误的单词
first~ 也能匹配first单词
还可以设置编辑距离（整数），指定需要多少相似度
cromm~1 会匹配到 from 和 chrome
默认2，越大越接近搜索的原始值，设置为1基本能搜到80%拼写错误的单词

近似搜索
在短语后面加上 ~ ，可以搜到被隔开或顺序不同的单词
“where select”~5 表示 select 和 where 中间可以隔着5个单词，可以搜到 select password from users where id=1

范围搜索
length:[100 TO 200]
sip:[“172.24.20.110” TO “172.24.20.140”]
date:{“now-6h” TO “now”}
tag:{b TO e} 搜索b到e中间的字符
count:[10 TO *] * 表示一端不限制范围
count:[1 TO 5} [ ] 表示端点数值包含在范围内，{ } 表示端点数值不包含在范围内，可以混合使用，此语句为1到5，包括1，不包括5
可以简化成以下写法：
age:>10
age:<=10
age:(>=10 AND <20)

优先级
quick^2 fox
使用^使一个词语比另一个搜索优先级更高，默认为1，可以为0~1之间的浮点数，来降低优先级

逻辑操作
AND
OR

+：搜索结果中必须包含此项
-：不能含有此项
+apache -jakarta test aaa bbb：结果中必须存在apache，不能有jakarta，剩余部分尽量都匹配到

分组
(jakarta OR apache) AND jakarta

字段分组
title:(+return +“pink panther”)
host:(baidu OR qq OR google) AND host:(com OR cn)

转义特殊字符
+ - = && || > < ! ( ) { } [ ] ^ " ~ * ? : \ /
以上字符当作值搜索的时候需要用\转义
(1+1)=2用来查询(1+1)=2