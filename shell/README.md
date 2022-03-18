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