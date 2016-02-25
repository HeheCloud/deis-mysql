FROM mariadb:10.1
MAINTAINER Cloud Mario <smcz@qq.com>

RUN apt-get update && apt-get install -y curl net-tools && rm -rf /var/lib/apt/lists/*

# install etcdctl
RUN curl -sSL -o /usr/local/bin/etcdctl http://sinacloud.net/hehe/etcd/etcdctl-v0.4.9 \
	&& chmod +x /usr/local/bin/etcdctl

# install confd
# RUN curl -sSL -o /usr/local/bin/confd http://sinacloud.net/hehe/confd/confd-0.11.0-linux-amd64 \
#	&& chmod +x /usr/local/bin/confd

ENV TZ "Asia/Shanghai"
ENV TERM xterm
# ENV TERM dumb

ADD . /app

RUN chmod +x /app/bin/init
RUN chmod +x /app/bin/boot

CMD ["/app/bin/boot"]

EXPOSE 3306
