# hbase


## 增删改查

> hbase shell

```
# 创建表
create 'table_name', 'column_family1', 'column_family2'

# 创建表时指定版本数
create 'table_name', {NAME => 'cf1', VERSIONS => 3}, {NAME => 'cf2', VERSIONS => 5}

# 查看所有命名空间
list_namespace

# 查看hbase系统命名空间下的表
list_namespace_tables 'hbase'

# 查看default命名空间下的表
list_namespace_tables 'default'

# 创建新的命名空间
create_namespace 'analytics'

# 在新命名空间中创建表
create 'analytics:log_data', 'info', 'stats'

# 查看所有表
list

# 查看表结构
describe 'table_name'

# 禁用表
disable 'table_name'

# 启用表
enable 'table_name'

# 删除表（需要先禁用）
disable 'table_name'
drop 'table_name'

# 检查表是否存在
exists 'table_name'

# 判断表是否启用
is_enabled 'table_name'

# 判断表是否禁用
is_disabled 'table_name'

# 添加列族
alter 'table_name', NAME => 'new_cf'

# 删除列族
alter 'table_name', 'delete' => 'cf_name'

# 修改列族属性
alter 'table_name', {NAME => 'cf1', VERSIONS => 5}

# 修改多个列族
alter 'table_name', {NAME => 'cf1', VERSIONS => 3}, {NAME => 'cf2', MAX_FILESIZE => '134217728'}


# 插入/更新数据
put 'table_name', 'row_key', 'column_family:column', 'value'

# 带时间戳插入
put 'table_name', 'row_key', 'cf:col', 'value', timestamp

# 示例
put 'user', '001', 'info:name', '张三'
put 'user', '001', 'info:age', '25'
put 'user', '001', 'contact:email', 'zhangsan@example.com'

# 获取单行数据
get 'table_name', 'row_key'

# 获取指定列族的数据
get 'table_name', 'row_key', 'column_family'

# 获取指定列的数据
get 'table_name', 'row_key', 'column_family:column'

# 获取多个版本的数据
get 'table_name', 'row_key', {COLUMN => 'cf:col', VERSIONS => 3}

# 扫描表
scan 'table_name'

# 扫描指定列族
scan 'table_name', {COLUMNS => ['cf1']}

# 扫描指定列
scan 'table_name', {COLUMNS => ['cf1:col1', 'cf2:col2']}

# 限制扫描行数
scan 'table_name', {LIMIT => 10}

# 按时间范围扫描
scan 'table_name', {TIMERANGE => [start_timestamp, end_timestamp]}

# 使用过滤器扫描
scan 'table_name', {FILTER => "ValueFilter(=, 'binary:value')"}


# 删除指定列
delete 'table_name', 'row_key', 'column_family:column'

# 删除整行
deleteall 'table_name', 'row_key'

# 删除指定时间戳的版本
delete 'table_name', 'row_key', 'cf:col', timestamp

# 清空表（需要先禁用）
truncate 'table_name'


# 统计表行数
count 'table_name'

# 快速计数（不精确但更快）
count 'table_name', INTERVAL => 1000

```