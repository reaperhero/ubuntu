
https://mp.weixin.qq.com/s/vsKuWyj-DWq2EPdLWYFklw


全局参数
```
pd.set_option('display.max_rows', None)     # 显示所有行
pd.set_option('display.max_columns', None)  # 显示所有列
```

常用基本函数
```
1.head和tail

2.unique和nunique

3.count和value_counts

4.describe和info

5.idxmax和nlargest

6.clip和replace

7.apply函数
```

排序
```
1.索引排序

2.值排序
```


```
user_action = pd.read_csv('jdata_action.csv')
user_data = user_action[(user_action['action_time'] > '2018-03-30') & (user_action['action_time'] < '2018-04-15')]  # 截取'2018-03-30'至'2018-04-15'之间的数据完成本次分析
user_data.to_csv('user_data.csv',sep=',')  # 保存
```

```
behavior = pd.read_csv('user_data.csv', index_col=0)   # 查看原始数据各字段类型
behavior[:10] 
```

```
user_id   sku_id   action_time   module_id   type
17   1455298   208441   2018-04-11 15:21:43   6190659   1
18   1455298   334318   2018-04-11 15:14:54   6190659   1
19   1455298   237755   2018-04-11 15:14:13   6190659   1
20   1455298   6422     2018-04-11 15:22:25   6190659   1
21   1455298   268566   2018-04-11 15:14:26   6190659   1
22   1455298   115915   2018-04-11 15:13:35   6190659   1
23   1455298   208254   2018-04-11 15:22:16   6190659   1
24   1455298   177209   2018-04-14 14:09:59   6628254   1
25   1455298   71793    2018-04-14 14:10:29   6628254   1
26   1455298   141950   2018-04-12 15:37:53   10207258   1
```

# 添加字段
```
behavior['date'] = pd.to_datetime(behavior['action_time']).dt.date # 日期
behavior['hour'] = pd.to_datetime(behavior['action_time']).dt.hour # 时间
behavior['weekday'] = pd.to_datetime(behavior['action_time']).dt.weekday_name # 周

```

# 删除字段
```
behavior = behavior.drop('module_id', axis=1)
```

# 修改字段
```
behavior_type = {1:'pv',2:'pay',3:'fav',4:'comm',5:'cart'}
behavior['type'] = behavior['type'].apply(lambda x: behavior_type[x])
behavior.reset_index(drop=True,inplace=True)
```

# 查询
```

# 总访问量
pv = behavior[behavior['type'] == 'pv']['user_id'].count()
# 总访客数
uv = behavior['user_id'].nunique()
# 消费用户数
user_pay = behavior[behavior['type'] == 'pay']['user_id'].unique()
# 日均访问量
pv_per_day = pv / behavior['date'].nunique()
# 人均访问量
pv_per_user = pv / uv
# 消费用户访问量
pv_pay = behavior[behavior['user_id'].isin(user_pay)]['type'].value_counts().pv
# 消费用户数占比
user_pay_rate = len(user_pay) / uv
# 消费用户访问量占比
pv_pay_rate = pv_pay / pv
# 消费用户人均访问量
pv_per_buy_user = pv_pay / len(user_pay)
# 跳失率：只进行了一次操作就离开的用户数/总用户数
attrition_rates = sum(behavior.groupby('user_id')['type'].count() == 1) / (behavior['user_id'].nunique())

# 单个用户消费总次数
total_buy_count = (behavior[behavior['type']=='pay'].groupby(['user_id'])['type'].count().to_frame().rename(columns={'type':'total'}))
# 消费次数前10客户
topbuyer10 = total_buy_count.sort_values(by='total',ascending=False)[:10]
# 复购率
re_buy_rate = total_buy_count[total_buy_count>=2].count()/total_buy_count.count()
topbuyer10.reset_index().style.bar(color='skyblue',subset=['total'])


# 单个用户消费总次数可视化
tbc_box = total_buy_count.reset_index()
fig, ax = plt.subplots(figsize=[16,6])
ax.set_yscale("log")
sns.countplot(x=tbc_box['total'],data=tbc_box,palette='Set1')
for p in ax.patches:
        ax.annotate('{:.2f}%'.format(100*p.get_height()/len(tbc_box['total'])), (p.get_x() - 0.1, p.get_height()))
plt.title('用户消费总次数')


# 日活跃人数（有一次操作即视为活跃）
daily_active_user = behavior.groupby('date')['user_id'].nunique()
# 日消费人数
daily_buy_user = behavior[behavior['type'] == 'pay'].groupby('date')['user_id'].nunique()
# 日消费人数占比
proportion_of_buyer = daily_buy_user / daily_active_user
# 日消费总次数
daily_buy_count = behavior[behavior['type'] == 'pay'].groupby('date')['type'].count()
# 消费用户日人均消费次数
consumption_per_buyer = daily_buy_count / daily_buy_user

# 消费用户日人均消费次数可视化

# 柱状图数据
cpb_bar = (daily_buy_count.reset_index().rename(columns={'type':'Num'}))
# 线图数据
cpb_line = (consumption_per_buyer.reset_index().rename(columns={0:'Frequency'}))

fig2 = plt.figure(figsize=[16,6])
ax3 = fig2.add_subplot(111)
ax4 = ax3.twinx()

sns.barplot(x='date', y='Num', data=cpb_bar, ax=ax3, alpha=0.8, palette='pastel')
sns.pointplot(cpb_line['date'], cpb_line['Frequency'], ax=ax4, markers='D', linestyles='--',color='teal')

x=list(range(0,16))
for a,b in zip(x,cpb_line['Frequency']):
    plt.text(a+0.1, b + 0.001, '%.2f' % b, ha='center', va= 'bottom',fontsize=12)
plt.title('消费用户日人均消费次数')

```
