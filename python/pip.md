```
pip3 freeze > requirements.txt

pip3 install pipreqs
pip3 install matplotlib==3.4.1
pip uninstall package_name
pip show -f requests    # 查看某个包的信息
pip list -o             # 查看需要被升级的包
pip check package_name  # 查看兼容问题



pipreqs . --force --encoding=utf8  # 当前项目生成依赖requirements.txt


清华：https://pypi.tuna.tsinghua.edu.cn/simple
阿里云：http://mirrors.aliyun.com/pypi/simple/
中国科技大学 https://pypi.mirrors.ustc.edu.cn/simple/
华中理工大学：http://pypi.hustunique.com/
山东理工大学：http://pypi.sdutlinux.org/ 
豆瓣：http://pypi.douban.com/simple/
```



```
pip install -r requirements.txt  # 安装依赖

pip3 install -r requirements.txt -i http://pypi.douban.com/simple
```