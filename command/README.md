# 小技巧


```
echo y|kubead reset
```


# 知识点

[正则](https://github.com/google/re2/wiki/Syntax)


```
1. 变量都是全局
```

- echo截取

```
${string: start :length}	从 string 字符串的左边第 start 个字符开始，向右截取 length 个字符。
${string: start}	从 string 字符串的左边第 start 个字符开始截取，直到最后。
${string: 0-start :length}	从 string 字符串的右边第 start 个字符开始，向右截取 length 个字符。
${string: 0-start}	从 string 字符串的右边第 start 个字符开始截取，直到最后。
${string#*chars}	从 string 字符串第一次出现 *chars 的位置开始，截取 *chars 右边的所有字符。
${string##*chars}	从 string 字符串最后一次出现 *chars 的位置开始，截取 *chars 右边的所有字符。
${string%*chars}	从 string 字符串第一次出现 *chars 的位置开始，截取 *chars 左边的所有字符。
${string%%*chars}	从 string 字符串最后一次出现 *chars 的位置开始，截取 *chars 左边的所有字符
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
[ -z STRING ] “STRING” 的长度为零则为真。
[ -n STRING ] or [ STRING ] “STRING” 的长度为非零 non-zero则为真。
[ STRING1 == STRING2 ] 如果2个字符串相同。 “=” may be used instead of “==” for strict POSIX compliance则为真。
[ STRING1 != STRING2 ] 如果字符串不相等则为真。
[ STRING1 < STRING2 ] 如果 “STRING1” sorts before “STRING2” lexicographically in the current locale则为真。
[ STRING1 > STRING2 ] 如果 “STRING1” sorts after “STRING2” lexicographically in the current locale则为真
```

- 文件判断
```
[ -a FILE ] 如果 FILE 存在则为真。
[ -b FILE ] 如果 FILE 存在且是一个块特殊文件则为真。
[ -c FILE ] 如果 FILE 存在且是一个字特殊文件则为真。
[ -d FILE ] 如果 FILE 存在且是一个目录则为真。
[ -e FILE ] 如果 FILE 存在则为真。
[ -f FILE ] 如果 FILE 存在且是一个普通文件则为真。
[ -g FILE ] 如果 FILE 存在且已经设置了SGID则为真。
[ -h FILE ] 如果 FILE 存在且是一个符号连接则为真。
[ -k FILE ] 如果 FILE 存在且已经设置了粘制位则为真。
[ -p FILE ] 如果 FILE 存在且是一个名字管道(F如果O)则为真。
[ -r FILE ] 如果 FILE 存在且是可读的则为真。
[ -s FILE ] 如果 FILE 存在且大小不为o则为真。
[ -t FD ] 如果文件描述符 FD 打开且指向一个终端则为真。
[ -u FILE ] 如果 FILE 存在且设置了SUID (set user ID)则为真。
[ -w FILE ] 如果 FILE 如果 FILE 存在且是可写的则为真。
[ -x FILE ] 如果 FILE 存在且是可执行的则为真。
[ -O FILE ] 如果 FILE 存在且属有效用户ID则为真。
[ -G FILE ] 如果 FILE 存在且属有效用户组则为真。
[ -L FILE ] 如果 FILE 存在且是一个符号连接则为真。
[ -N FILE ] 如果 FILE 存在 and has been mod如果ied since it was last read则为真。
[ -S FILE ] 如果 FILE 存在且是一个套接字则为真。
[ FILE1 -nt FILE2 ] 如果 FILE1 has been changed more recently than FILE2, or 如果 FILE1 exists and FILE2 does not则为真。
[ FILE1 -ot FILE2 ] 如果 FILE1 比 FILE2 要老, 或者 FILE2 存在且 FILE1 不存在则为真。
[ FILE1 -ef FILE2 ] 如果 FILE1 和 FILE2 指向相同的设备和节点号则为真。
[ -o OPTIONNAME ] 如果 shell选项 “OPTIONNAME” 开启则为真。
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


- demo
```
~$ A=1;echo $A;{ A=2; };echo $A
1
2

~$ A=1;echo $A;( A=2; );echo $A
1
1

if [ "$?" -ne "0" ]; then   echo "FAIL";   exit 1; else   echo "SUCC"; fi
[ "$?" -ne "0" ] &&  echo "FAIL";exit 1 ||  echo "SUCC"


i=1
sum=0
until ((i > 100))    # unti 循环和 while 循环恰好相反，当判断条件不成立时才进行循环
do
    ((sum += i))
    ((i++))
done
echo "The sum is: $sum"



#!/bin/bash
while [ $# != 0 ];do
    echo "第一个参数为：$1,参数个数为：$#"
    shift    # shift命令用于对参数的移动(左移)
done


#!/bin/bash

# Add two numeric value
((sum=25+35))

#Print the result
echo $sum

for((i=0;i<3;i++));do
  touch test_$i.txt
done

if [ -e /tmp ]
then
    echo "dir exists!"
else
    echo "dir not exists"
fi

# if [ -e /tmp  ]; then echo "dir exists!"; else echo "dir not exists" fi


count=0
while [ $count -lt 5 ]
do
    echo $count
    ((count++))
done



count=0
while [ $count -lt 5 ]; do echo $count; ((count++)); done




for i in `seq 10`; do curl -v http://baidu.com; done



echo ${my_name:0:2}  # 截取字符串
echo ${#my_name}     # 获取字符串长度


if [[ "5" > "4" ]] && [[ "1" == "1" ]] && [ -f "user.md" ]
then
    echo 1
else
    echo 2
fi


#!/bin/bash
if [[ "5" > "4" ]] && [[ "1" == "1" ]] && [ -f "user.md" ]
then
    echo 1
else
    echo 2

fi


echo 3


if [ -z "$pid" ]
then 
	echo "pid not exist";
	exit 1;
else
	echo $pid | grep -E -q "[[:space:]]" && echo "pid not unique" && echo 1
fi


#!/bin/bash
export PATH=$PATH
nc -w 10 -z 172.16.128.230 80  > /dev/null 2>&1
if [ $? -eq 0 ]; then
      echo "Network is Open."
else
      echo "Network is Closed."
fi

list=(
    URL1
    URL1
)
for i in ${list[*]}
do 
    echo $i
done
```

- 正则
```
需要转义：\{1,3\}  \(hello\)


.  匹配除了换行符（\n）以外的任意一个字符


?  匹配表达式0次或者1次,相当于 {0,1}
+  至少出现1次,相当于 {1，}
*  出现任意次, 相当于 {0,}
^  代表行的开始
$  代表行的结束
^$ 就表示空行

[…]匹配括号中的字符之一
[^abc] 匹配 "a","b","c" 之外的任意一个字符

{N} 匹配前面的子表达式 N 次
{N,} 匹配前面的子表达式 N 次到多次
{N,M}  匹配前面的子表达式 N 次至多 M 次
\{n\} 连续出现n次
\  用于转义
｜表示或  如： a|b|c 匹配a或b或c
（），将部分内容合成一个单位组，比如 要搜索 glad 或 good 可以如下 'g(la|oo)d'


\d 任意一个数字，0~9 中的任意一个
\s+ 多个空格
\w 任意一个字母或数字或下划线，也就是 A~Z,a~z,0~9,_ 中任意一个
\s  包括空格、制表符、换页符等空白字符的其中任意一个
\b 空格，可以锚定词首和词尾
\n 换行


案例
^[A-Z]..$                 以A至Z的一个字母开头，然后跟两个任意字母，然后跟一个换行符的行
^[A-Z][a-z]*3[0-5]        一个大写字母开头，后跟0个或多个小写字母，再跟数字3，再跟0—5之间的一个数字
^ *[A-Z][a-z][a-z]$       0个或多个空格开头，跟一个大写字母，两个小写字母和一个换车符
^[A-Za-z]*[^,][A-Za-z]*$  0个或多个大写或小写字母开头，不跟逗号，然后跟0个或多个大写或小写字母，然后跟一个换车符
'[vV]ivek'                匹配 Vivek 或 vivek
'co{1,2}l'                匹配到 "col" 和 "cool"
^.$                       只包含一个字符的行

```
