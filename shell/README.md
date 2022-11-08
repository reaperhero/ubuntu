# 知识点

[正则](https://github.com/google/re2/wiki/Syntax)


```
1. 变量都是全局
```


- 颜色变量

<p>echo -e "${RED_PREFIX}service:5 was killed ${COLOR_SUFFIX}"<p>

```
COLOR_SUFFIX="\033[0m"
BLACK_PREFIX="\033[30m"
RED_PREFIX="\033[31m"
GREEN_PREFIX="\033[32m"
YELLOW_PREFIX="\033[33m"
BLUE_PREFIX="\033[34m"
PURPLE_PREFIX="\033[35m"
SKY_BLUE_PREFIX="\033[36m"
```

- 字符串判断
```
= 两个字符串相等。
!= 两个字符串不等。
-n 非空串。
-z  判断字符串是否为空
```

- 文件判断
```
-d  目录
-f   正规文件
-L  符号连接
-r  可读
-s  文件长度大于 0、非空
-w  可写
-u  文件有suid位设置
-x  可执行
```

- 逻辑操作符
```
-a 逻辑与,操作符两边均为真,结果为真,否则为假。
-o 逻辑或,操作符两边一边为真,结果为真,否则为假。
! 逻辑否,条件为假,结果为真
```

- 测试数值

```
-eq 数值相等。
-ne 数值不相等。
-gt 第一个数大于第二个数。
-lt 第一个数小于第二个数。
-le 第一个数小于等于第二个数。
-ge 第一个数大于等于第二个数
```