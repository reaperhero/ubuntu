FROM alpine:3.19.1
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
RUN apk update && apk add curl && rm -rf /var/cache/apk/*