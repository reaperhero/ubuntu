# command



# 安装grpc
pip3 install grpcio
pip3 install protobuf
pip3 install grpcio-tools



# ubuntu14.04 安装python
# apt-get install openssl libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev -y
# https://www.jianshu.com/p/f8585da77ed9
wget https://www.python.org/ftp/python/3.7.2/Python-3.7.2.tgz
tar -zxvf Python-3.7.2.tgz
cd Python-3.7.2
mkdir /usr/local/python3
./configure --prefix=/usr/local/python3 --with-openssl=/usr/local/openssl 
make && make install
ln -s /usr/local/python3/bin/python3 /usr/bin/python3
ln -s /usr/local/python3/bin/pip3 /usr/bin/pip3
pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple some-package







内置类方法

```
__class__: 返回实例所属的类。
__delattr__(self, name): 在使用 del 语句请求删除属性时调用。
__dict__: 包含对象属性的字典或其他映射对象。
__dir__: 在调用 dir() 函数时调用。应返回该对象的有效属性列表。
__doc__: 包含类或模块的文档字符串。
__eq__(self, other): 定义相等运算符 == 的行为。
__format__(self, format_spec): 定义 format() 函数的行为。
__ge__(self, other): 定义大于或等于运算符 >= 的行为。
__getattribute__(self, name): 在使用点运算符访问属性时调用。
__gt__(self, other): 定义大于运算符 > 的行为。
__hash__(self): 定义 hash() 函数的行为。
__init__(self, ...): 构造方法，在创建类的实例时调用。
__init_subclass__(...): 当创建子类时调用的类方法。
__le__(self, other): 定义小于或等于运算符 <= 的行为。
__lt__(self, other): 定义小于运算符 < 的行为。
__module__: 包含定义类的模块的名称的字符串。
__ne__(self, other): 定义不等运算符 != 的行为。
__new__(cls, ...): 创建类的新实例。它是一个静态方法。
__reduce__(self): 用于对象的pickling（序列化）。
__reduce_ex__(self, protocol): 带有附加参数指定协议版本的 __reduce__ 的版本。
__repr__(self): 由内置的 repr() 函数调用，以获取对象的字符串表示。
__setattr__(self, name, value): 在使用 = 运算符进行属性赋值时调用。
__sizeof__(self): 返回对象的字节大小。
__str__(self): 由内置的 str() 函数调用，以获取对象的字符串表示。
__subclasshook__(cls, subclass): 用于检查一个类是否是另一个类的子类。
__weakref__: 对象的弱引用
```
