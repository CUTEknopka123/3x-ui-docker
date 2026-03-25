FROM alpine:latest

ENV XUI_VERSION=v2.8.10
ENV TZ=Europe/Moscow

RUN apk add --no-cache curl bash ca-certificates tzdata openssl

RUN mkdir -p /usr/local/x-ui && \
    curl -L "https://github.com/MHSanaei/3x-ui/releases/download/${XUI_VERSION}/x-ui-linux-amd64.tar.gz" -o /tmp/x-ui.tar.gz && \
    tar -xvf /tmp/x-ui.tar.gz -C /usr/local/ && \
    rm /tmp/x-ui.tar.gz

WORKDIR /usr/local/x-ui

RUN chmod +x x-ui bin/xray-linux-amd64

VOLUME ["/etc/x-ui"]

EXPOSE 54321 443 80

CMD ["./x-ui"]
