FROM alpine:3.3

ENV CONSUL_TEMPLATE_VERSION 0.14.0

RUN apk --update add bash curl nginx

RUN curl -L https://releases.hashicorp.com/consul-template/$CONSUL_TEMPLATE_VERSION/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip -o /usr/local/bin/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip && \
    cd /usr/local/bin && unzip /usr/local/bin/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip && \
    rm /usr/local/bin/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip
RUN chmod 755 /usr/local/bin/consul-template

ADD bin/consul-watch /usr/local/bin/consul-watch
RUN chmod 755 /usr/local/bin/consul-watch && chown root:root /usr/local/bin/consul-watch

ADD etc/nginx/nginx.conf /etc/nginx/nginx.conf
ADD etc/consul /etc/consul

EXPOSE 80

ENTRYPOINT ["/usr/local/bin/consul-watch"]
