在sed命令中有许多的字符都被转义，比如\ , $, ^，单双引号还有点号等等


# sed
sed -i '/git.mudu.tv/d' /etc/hosts  # 删除保护指定内容行