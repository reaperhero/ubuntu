在sed命令中有许多的字符都被转义，比如\ , $, ^，单双引号还有点号等等


# sed
sed -i '/git.163.com/d' /etc/hosts          # 删除指定内容行
sed -i "24s/^/#/g"      application.conf    # 注释第24行

sed -i 's/.//'  file                        # 删除每行第一个字符。

sed -i "45,77s/^/#/g" nginx-configmap.yaml  # 45行到77行，行首添加注释符#   


find . -name "*.htm" | xargs sed -i -e "s%somebody%donal%g"   # 递归批量替换