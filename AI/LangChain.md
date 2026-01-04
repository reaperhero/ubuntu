

LangChain 是一个专门为开发 LLM（大语言模型）应用而设计的**“胶水”框架**。

如果把 DeepSeek/GPT 比作一个强大的“大脑”，那么 LangChain 就是**“神经系统和手脚”**。它负责把大脑与外部工具（如你的 MinIO 存储、Milvus 数据库、搜索引擎、甚至本地文件）连接起来，组成一个完整的智能应用。



为什么需要 LangChain？
直接调用 DeepSeek API 很简单，但要开发一个复杂的应用会遇到很多麻烦：

Prompt 太长： 需要管理成百上千个提示词模板。

模型没有记忆： LLM 本身不记得上一轮说了什么，你需要手动管理历史记录。

无法连接外部数据： LLM 只知道训练数据里的知识，不知道你存放在 MinIO 里的私有合同。

多步骤任务： 需要先查数据库，再分析结果，最后写报告。手动写这些逻辑非常痛苦。

LangChain 的出现就是为了解决这些“脏活累活”。



```
from langchain_openai import ChatOpenAI
from langchain_community.vectorstores import Milvus
from langchain.chains import RetrievalQA
from langchain_huggingface import HuggingFaceEmbeddings

# 1. 定义大脑 (DeepSeek)
llm = ChatOpenAI(
    model='deepseek-chat', 
    openai_api_key='YOUR_KEY', 
    openai_api_base='https://api.deepseek.com/v1'
)

# 2. 定义记忆提取器 (连接 Milvus)
embeddings = HuggingFaceEmbeddings(model_name="all-MiniLM-L6-v2")
vector_db = Milvus(
    embedding_function=embeddings,
    connection_args={"host": "127.0.0.1", "port": "19530"},
    collection_name="your_collection"
)

# 3. 组装成一条“问答链”
qa_chain = RetrievalQA.from_chain_type(
    llm=llm,
    chain_type="stuff", # 简单把搜到的东西塞进提示词
    retriever=vector_db.as_retriever()
)

# 4. 执行
response = qa_chain.invoke("根据合同，违约金是多少？")
print(response["result"])
```