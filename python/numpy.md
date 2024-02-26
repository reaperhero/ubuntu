# 常用函数
```
random() 生成0到1之间的随机数；
uniform() 生成均匀分布的随机数；
randn() 生成标准正态的随机数；
normal() 生成符合正态分布的随机数；
shuffle() 随机打乱数据的顺序；
seed() 设置随机数种

sqrt()：计算序列化数据的平方根
sin(),cos()：三角函数
abs()：计算序列化数据的绝对值
dot()：矩阵运算
log(),log10(),log2()：对数函数
exp()：指数函数
cumsum(),cumproduct()：累计求和，求积
sum()：对一个序列化数据进行求和
mean()：计算均值
median()：计算中位数
std()：计算标准差
var()：计算方差
corrcoef()：计算相关系数


diag()：以一维数组的方式返回方阵的对角线元素
dot()：矩阵乘法
trace()：求矩阵的迹（对角线元素的和）
det()：计算矩阵列式
eig()：计算方阵的特征值和特征向量
inv()：计算方阵的逆
qr()：计算qr分解
svd()：计算奇异值分解svd
solve()：解线性方程组Ax=b，其中A为矩阵
lstsq()：Ax=b的最小二乘法求解


```

# 创建ndarray

```
# list转一维度ndarray
list1 = [1.1, 2.2, 3, 4, 5]
nd1 = np.array(list1)


# list转多维ndarray
list2 = [[1.1, 2.2, 3, 4, 5],[7.7, 8.8, 9, 10, 11]]
nd2 = np.array(list2)

# 使用内置函数
nd3 = np.random.random((2, 3))  2行 3列
```

# 持久化
```
nd10 = np.random.random((3, 3))
np.savetxt(X=nd10, fname='./test.txt')
nd11 = np.loadtxt('./test.txt')
```

# 截取
```
# 一维数组的截取
nd13 = np.random.random((10))
# 获取指定位置的数据
nd13[4]
# 获取一段数据
nd13[4:8]
# 根据步长获取数据
nd13[4:8:2]

# 多维数组的截取
nd14 = np.random.random((5, 5))
# 获取指定位置的数据
nd14[2, 4]
# 获取指定区域的数据
nd14[1:4, 1:4]
# 根据数值截取数据
nd14[(nd14 > 0.4) & (nd14 < 0.8)]
# 获取指定的行和列
print(nd14[:, 3])  # 列
print(nd14[3, :])  # 行
```


# 合并
```
# 一维数组的合并
a = np.array([1, 2, 3])
b = np.array([4, 5, 6])
c = np.append(a, b)        # 使用append函数进行合并
d = np.concatenate((a, b)) # 使用concatenate函数进行合并

# 多维数组的合并
a = np.arange(4).reshape(2, 2)   # 生成6个数字，2行2列
b = np.arange(4).reshape(2, 2)
c = np.append(a, b, axis=0)    # 按行合并
d = np.append(a, b, axis=1)    # 按列合并
```

# 展开
```
nd = np.arange(6).reshape(2, -1)
# 按照列展开
nd1 = nd.ravel("F")
# 按照行展开
nd2 = nd.ravel()
```