在sed命令中有许多的字符都被转义，比如\ , $, ^，单双引号还有点号等等


# sed
sed -i '/git.163.com/d' /etc/hosts          # 删除指定内容行
sed -i "24s/^/#/g"      application.conf    # 注释第24行

sed -i 's/.//'  file                        # 删除每行第一个字符
sed 's/.\{5\}//' tmp.txt                    # 删除每行前k个字符，例如k=5

sed -i "45,77s/^/#/g" nginx-configmap.yaml  # 45行到77行，行首添加注释符#   

find . -name "*.htm" | xargs sed -i -e "s%somebody%donal%g"   # 递归批量替换

sed -i 'Nd' filename   # 删除第N行

sed -i '$d' file.txt   # 删除最后一行

sed -i 'M,Nd' filename # 删除第M到N行

sed -i '2 ittt'  a.txt # 在第2行前插入ttt

sed -i '2 attt'  a.txt # 在第2行后插入ttt

sed -i '2 a\ ttt'  a.txt # 在第2行后插入 ttt

sed -i '3s/aaa/fff/' file      # 表示针对file文件中的第三行，将其中的aaa替换为fff

sed -i '/xxx/s/aaa/fff/g' file # 表示针对文件，找出包含xxx的行，并将其中的aaa替换为fff

sed -i '1s/[#*]/fff/gp' file   # 表示针对文件第1行，将其中的#号或是*号替换为fff

sed -i "88 r b.txt" a.txt   # 在a.txt的88行下插入b.txt文件内容


cat config.xml | sed '/<!--.*-->/d' | sed '/<!--/,/-->/d'|sed '/^$/d' > cleaned.xml  # 删除xml注释 空行