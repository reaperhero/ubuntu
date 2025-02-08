import requests
from bs4 import BeautifulSoup

# 目标URL
url = "https://www.jiaoyixingqiu.com/shouxufei/all"

# 发送HTTP请求
response = requests.get(url)

# 检查请求是否成功
if response.status_code == 200:
    # 解析HTML内容
    soup = BeautifulSoup(response.text, 'html.parser')

    # 假设手续费信息在一个表格中，我们可以通过查找表格来提取数据
    table = soup.find('table', {})  # 替换为实际的表格类名
    if table:
        # 遍历表格行
        for row in table.find_all(lambda tag: tag.name == 'tr' and tag.get('id')):
            # 提取每一行的单元格数据
            cells = row.find_all('td')
            chen_jiao_lian = int(cells[3].text.strip())
            if len(cells) == 14 and cells[13].text.strip() == "主力" and chen_jiao_lian > 10000:
                # 假设手续费信息在第一个和第二个单元格中
                fee_name = cells[1].text.strip()
                k_fee_value = cells[7].text.strip()
                p_fee_value = cells[9].text.strip()
                print(f"品种: {fee_name},开仓: {k_fee_value} 平仓: {p_fee_value}")
    else:
        print("未找到手续费表格")
else:
    print(f"请求失败，状态码: {response.status_code}")
