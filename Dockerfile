FROM mariadb:10.1
MAINTAINER Cloud Mario <smcz@qq.com>

# install etcdctl
RUN curl -sSL -o /usr/local/bin/etcdctl http://sinacloud.net/hehe/etcd/etcdctl-v0.4.9 \
	&& chmod +x /usr/local/bin/etcdctl

# install confd
# RUN curl -sSL -o /usr/local/bin/confd http://sinacloud.net/hehe/confd/confd-0.11.0-linux-amd64 \
#	&& chmod +x /usr/local/bin/confd

ENV TZ "Asia/Shanghai"

ADD . /app

RUN chmod +x /app/bin/boot

CMD ["/app/bin/boot"]

EXPOSE 3306
