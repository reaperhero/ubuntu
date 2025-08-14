# 使用 ubuntu:20.04 作为基础镜像
FROM ubuntu:20.04

# 设置环境变量，避免交互式配置
ENV DEBIAN_FRONTEND=noninteractive

# 备份原有的软件源配置文件，并替换为阿里云镜像源
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak && \
    echo "deb http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse" > /etc/apt/sources.list && \
    echo "deb http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse" >> /etc/apt/sources.list && \
    echo "deb http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse" >> /etc/apt/sources.list && \
    echo "deb http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse" >> /etc/apt/sources.list

# 更新系统软件包并安装编译 Python 所需的依赖
RUN apt-get update && apt-get install -y \
    build-essential \
    zlib1g-dev \
    libncurses5-dev \
    libgdbm-dev \
    libnss3-dev \
    libssl-dev \
    libreadline-dev \
    libffi-dev \
    wget

# 下载 Python 2.7 源码
RUN wget https://www.python.org/ftp/python/2.7.18/Python-2.7.18.tgz

# 解压源码包
RUN tar -zxvf Python-2.7.18.tgz

# 进入解压后的目录
WORKDIR /Python-2.7.18

# 配置编译选项并指定安装目录
RUN ./configure --prefix=/usr/local/python2.7 --enable-optimizations

# 编译并安装 Python 2.7
RUN make -j$(nproc) && make install

# 设置工作目录为根目录
WORKDIR /

# 清理临时文件以减小镜像体积
RUN rm -rf Python-2.7.18.tgz Python-2.7.18

# 以下是将 Python 2.7 从容器拷贝到服务器的步骤说明
# 1. 构建 Docker 镜像
#    docker build -t python27-ubuntu:20.04 .
# 2. 运行容器
#    docker run -d --name python27-container python27-ubuntu:20.04
# 3. 从容器中拷贝 Python 2.7 到服务器
#    docker cp python27-container:/usr/local/python2.7 /path/on/server    

