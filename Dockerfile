FROM alpine:3.2
MAINTAINER Cloud Mario <smcz@qq.com>

# install common packages
RUN apk add --update-cache curl bash sudo mariadb mariadb-client && \
	rm -rf /var/cache/apk/*

# install etcdctl
RUN curl -sSL -o /usr/local/bin/etcdctl http://sinacloud.net/hehe/etcd/etcdctl-v0.4.9 \
	&& chmod +x /usr/local/bin/etcdctl

# install confd
RUN curl -sSL -o /usr/local/bin/confd http://sinacloud.net/hehe/confd/confd-0.11.0-linux-amd64 \
	&& chmod +x /usr/local/bin/confd

ENV TZ "Asia/Shanghai"

ADD . /app
ADD my.cnf /etc/mysql/my.cnf

RUN chmod +x /app/bin/boot
RUN chmod +x /app/bin/clean

# Add VOLUMEs to allow backup of config and databases
VOLUME  ["/etc/mysql", "/var/lib/mysql"]

CMD ["/app/bin/boot"]

EXPOSE 3306
