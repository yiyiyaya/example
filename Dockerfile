# ---- 第一阶段：编译代码 ----
FROM golang:1.22-alpine AS builder
WORKDIR /app
COPY main.go .
# CGO_ENABLED=0 才能在极简镜像 alpine 里运行
RUN CGO_ENABLED=0 GOOS=linux go build -o server main.go

# ---- 第二阶段：打包运行 ----
FROM alpine:latest
WORKDIR /app
# 只把编译好的二进制文件拷过来
COPY --from=builder /app/server .
EXPOSE 8080
CMD ["./server"]