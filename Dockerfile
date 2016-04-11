FROM alpine:3.3

ENV GOPATH /go
ENV GO15VENDOREXPERIMENT 1
ENV CONFD_VERSION 0.12.0-alpha3

RUN mkdir -p "$GOPATH/src/" "$GOPATH/bin" && chmod -R 777 "$GOPATH" && \
    mkdir -p /go/src/github.com/kelseyhightower/confd && \
    ln -s /go/src/github.com/kelseyhightower/confd /app

RUN apk --update add bash curl nginx

RUN curl -L https://github.com/kelseyhightower/confd/releases/download/v0.12.0-alpha3/confd-0.12.0-alpha3-linux-amd64 -o /usr/local/bin/confd
ADD bin/confd-watch /usr/local/bin/confd-watch
RUN chmod 755 /usr/local/bin/confd*

ADD etc/nginx/nginx.conf /etc/nginx/nginx.conf
ADD etc/confd /etc/confd

EXPOSE 80 443
