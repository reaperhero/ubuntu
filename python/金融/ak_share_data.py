import akshare as ak
import pandas as pd
from datetime import datetime, timedelta

# 2. 获取5分钟K线数据（默认返回较多历史数据）
df = ak.futures_zh_minute_sina(symbol='rb2505', period="5")

# 3. 转换为时间类型并筛选过去48小时
df["datetime"] = pd.to_datetime(df["datetime"])
cutoff_time = datetime.now() - timedelta(hours=48)  # 计算48小时前的时间点
df_recent = df[df["datetime"] >= cutoff_time]  # 筛选符合条件的行

# 4. 按时间倒序排列（最新数据在前）
df_recent = df_recent.sort_values("datetime", ascending=False).reset_index(drop=True)

# 5. 输出结果
print(df_recent.head(10))

# 4. 获取最后一个K线的收盘价
last_close = df.iloc[-1]["close"]
last_time = df.iloc[-1]["datetime"]
print(last_close, last_time)


last_10_k = df_recent.head(10)  # 最后10根K线

# 4. 计算全局最高价和最低价
max_high = last_10_k["high"].max()  # 10根K线中的最高价
min_low = last_10_k["low"].min()    # 10根K线中的最低价

# 5. 输出结果
print(f"全局最高价: {max_high}")
print(f"全局最低价: {min_low}")

# 6. 保存到CSV（可选）
# df_recent.to_csv(f"{'rb2505'}_5分钟K线_最近48小时.csv", index=False, encoding="utf_8_sig")