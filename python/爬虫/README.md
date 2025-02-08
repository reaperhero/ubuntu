

# 查找第一个 <h1> 标签
h1_tag = soup.find('h1')
print(h1_tag.text)  # 输出: 标题

# 查找第一个 class 为 "text" 的 <p> 标签
p_tag = soup.find('p', class_='text')
print(p_tag.text)  # 输出: 段落1


# 查找所有 <p> 标签
p_tags = soup.find_all('p')
for p in p_tags:
    print(p.text)  # 输出: 段落1, 段落2

# 查找所有 class 为 "text" 的 <p> 标签
p_text_tags = soup.find_all('p', class_='text')
for p in p_text_tags:
    print(p.text)  # 输出: 段落1, 段落2


# 查找 <a> 标签并获取 href 属性
a_tag = soup.find('a')
link = a_tag.get('href')

# 获取 <h1> 标签的文本
h1_text = soup.find('h1').text

# 获取所有 <p> 标签的文本
p_texts = [p.text for p in soup.find_all('p')]

# 查找所有 class 为 "text" 的 <p> 标签
p_tags = soup.select('p.text')
for p in p_tags:
    print(p.text)  # 输出: 段落1, 段落2

# 查找 <div> 下的所有 <p> 标签
p_tags_in_div = soup.select('div.content p')
for p in p_tags_in_div:
    print(p.text)  # 输出: 段落1, 段落2



# 遍历 <div> 的直接子节点
div_tag = soup.find('div', class_='content')
for child in div_tag.children:
    print(child)

# 遍历 <div> 的所有后代节点
for descendant in div_tag.descendants:
    print(descendant)

# 获取 <p> 标签的父节点
p_tag = soup.find('p')
parent = p_tag.parent
print(parent.name)  # 输出: div

# 获取下一个兄弟节点
next_sibling = p_tag.next_sibling
print(next_sibling)  # 输出: 下一个 <p> 标签

# 获取上一个兄弟节点
previous_sibling = p_tag.previous_sibling
print(previous_sibling)  # 输出: 上一个节点（可能是空白字符