FROM golang:1.13.15 AS build-env

WORKDIR /works

COPY go.mod go.sum ./
RUN git config --global url."https://user:password@git.hub,com/".insteadOf "https://git.hub,com/" \
    && CGO_ENABLED=0 GOOS=linux GOARCH=amd64 \
    && GO111MODULE="on" \
    && GOPRIVATE="git.hub,com" \
    && GOSUMDB="off" \
    && GOPROXY="https://goproxy.cn,direct" \
    && env \
    && time go mod download

COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 \
    && go build -o main \
    && go test --cover  $(go list ./...)

# final stage
FROM golang:1.13.15 

WORKDIR /app

COPY --from=build-env /works/main /app/
RUN chmod +x /app/main

# RUN mkdir -p /fluentd/log \
#     && mkdir -p /fluentd/etc /fluentd/plugins \
#     && mkdir -p /etc/fluent \
#     && mkdir -p /app/migrations \
#     && mkdir -p /app/tmp \
#     && mkdir -p log

# COPY fluentd/fluent.conf /etc/fluent/

# ENV FLUENTD_OPT=""
# ENV FLUENTD_CONF="fluent.conf"
# ENV LD_PRELOAD="/usr/lib/libjemalloc.so.2"
# ENV DUMB_INIT_SETSID 0

RUN mkdir -p /data/

# COPY start.sh /bin/
RUN chmod +x /app/main