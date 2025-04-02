from typing import List
import requests
from bs4 import BeautifulSoup

url = "https://www.iweiai.com/"
headers = {"User-Agent": "Mozilla/5.0"}
response = requests.get(url, headers=headers)
soup = BeautifulSoup(response.text, 'html.parser')


class shouxuFei:
    def __init__(self, vtSymbol: str, kai: float, pin: float, pin_zuo: float):
        self.vtSymbol = vtSymbol
        self.kai = kai
        self.pin = pin
        self.pin_zuo = pin_zuo


data: List[shouxuFei] = []
# 遍历所有 class 为 table-bordered 的表格
for table in soup.find_all("table", class_="table-bordered"):
    for row in table.find_all("tr")[1:]:  # 跳过表头
        cols = row.find_all("td")
        vtSymbol = cols[0].text.strip()
        k_fy = cols[8].text.strip()
        index1 = k_fy.find("≈")
        if index1 != -1:
            k_fy = k_fy.split("≈")[1]
        p_fy = cols[9].text.strip()
        index2 = p_fy.find("≈")
        if index2 != -1:
            p_fy = p_fy.split("≈")[1]
        pz_fy = cols[10].text.strip()
        index3 = pz_fy.find("≈")
        if index3 != -1:
            pz_fy = pz_fy.split("≈")[1]
        k_fy = float(k_fy.replace(" ", "").replace("元", ""))
        p_fy = float(p_fy.replace(" ", "").replace("元", ""))
        pz_fy = float(pz_fy.replace(" ", "").replace("元", ""))
        data.append(shouxuFei(vtSymbol, k_fy, p_fy, pz_fy))

data.sort(key=lambda x: x.kai, reverse=False)
# 确定要打印的属性
attributes = ["vtSymbol", "kai", "pin", "pin_zuo"]

# 计算每列的最大宽度
max_widths = {}
for attr in attributes:
    max_width = 0
    for item in data:
        text = str(getattr(item, attr))
        # 粗略计算中文字符占比调整宽度
        num_chinese = sum(1 for char in text if '\u4e00' <= char <= '\u9fff')
        width = len(text) + num_chinese
        max_width = max(max_width, width)
    max_widths[attr] = max_width


def ljust_custom(text, width):
    return text.ljust(width)


# 打印表头
header = "  ".join(ljust_custom(str(attr), max_widths[attr]) for attr in attributes)
print(header)
# 打印分隔线
separator = "-" * len(header)
print(separator)
# 打印数据行
for item in data:
    row = "  ".join(ljust_custom(str(getattr(item, attr)), max_widths[attr]) for attr in attributes)
    print(row)