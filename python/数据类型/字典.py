#!/usr/bin/python3

dict = {}
dict['one'] = "1 - 菜鸟教程"
dict[2]     = "2 - 菜鸟工具"

tinydict = {'name': 'runoob','code':1, 'site': 'www.runoob.com'}


print (dict['one'])       # 输出键为 'one' 的值
print (dict[2])           # 输出键为 2 的值
print (tinydict)          # 输出完整的字典
print (tinydict.keys())   # 输出所有键
print (tinydict.values()) # 输出所有值

#构造函数 dict() 可以直接从键值对序列中构建字典如下
# dict([('Runoob', 1), ('Google', 2), ('Taobao', 3)])
# {x: x**2 for x in (2, 4, 6)}
# dict(Runoob=1, Google=2, Taobao=3)


#在字典中遍历时，关键字和对应的值可以使用 items() 方法同时解读出来：
knights = {'gallahad': 'the pure', 'robin': 'the brave'}
for k, v in knights.items():
    print(k, v)

    
tel = {'jack': 4098, 'sape': 4139}
tel['guido'] = 4127
print(tel)

tel['jack']
del tel['sape']
tel['irv'] = 4127
print(tel)

list(tel.keys())
sorted(tel.keys())
'guido' in tel
'jack' not in tel
dict([('sape', 4139), ('guido', 4127), ('jack', 4098)])
{x: x**2 for x in (2, 4, 6)}
dict(sape=4139, guido=4127, jack=4098)