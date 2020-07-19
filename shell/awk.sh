#!/bin/bash

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



# awk
NR>1
awk '{sum+=$1} END {print "Sum = ", sum}'   # 求和
awk '{print $(NF-3)}'                       # 打印倒数第3列
awk '{if($1 !~ /bugu/) print $1 }'          # $1不匹配
awk '{if($6<$7) print $1}' 				# 列比较
awk '{if(NR>10 && NR<20 ) print $1}'        # 多个条件


# sed
sed -i '/git.mudu.tv/d' /etc/hosts  # 删除保护指定内容行