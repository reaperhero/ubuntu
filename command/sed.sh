在sed命令中有许多的字符都被转义，比如\ , $, ^，单双引号还有点号等等


# sed
sed -i '/git.163.com/d' /etc/hosts          # 删除指定内容行
sed -i "24s/^/#/g"      application.conf    # 注释第24行

sed -i 's/.//'  file                        # 删除每行第一个字符。

sed -i "45,77s/^/#/g" nginx-configmap.yaml  # 45行到77行，行首添加注释符#   


find . -name "*.htm" | xargs sed -i -e "s%somebody%donal%g"   # 递归批量替换

sed -i 'Nd' filename   # 删除第N行

sed -i 'M,Nd' filename # 删除第M到N行：

sed -i '3s/aaa/fff/' file      # 表示针对file文件中的第三行，将其中的aaa替换为fff

sed -i '/xxx/s/aaa/fff/g' file # 表示针对文件，找出包含xxx的行，并将其中的aaa替换为fff

sed -i '1s/[#*]/fff/gp' file   # 表示针对文件第1行，将其中的#号或是*号替换为fff
