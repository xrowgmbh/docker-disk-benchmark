FROM centos:7

MAINTAINER "bjoern@xrow.de"

RUN yum install epel-release -y
RUN yum install sysbench hdparm -y

COPY benchmark.sh /root/benshmark.sh

WORKDIR /root

CMD ["/usr/sbin/init"]