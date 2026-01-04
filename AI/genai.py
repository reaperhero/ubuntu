import google.generativeai as genai
import PIL.Image

# 配置你的 API Key
genai.configure(api_key="YOUR_API_KEY")

# 加载模型（Gemini 1.5 Pro/Flash 支持多模态）
model = genai.GenerativeModel('gemini-1.5-flash')

# 加载图片
img = PIL.Image.open('receipt.jpg')

# 多模态输入：文本 + 图片
response = model.generate_content([
    "请提取这张发票中的日期、商家名称和总金额，并以 JSON 格式输出。", 
    img
])

print(response.text)