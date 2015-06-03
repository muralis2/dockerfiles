FROM centos:centos7

RUN \
    yum update -y && \
    yum install -y golang git wget tar && \
    mkdir -p /opt/logstash/ssl && \
    mkdir -p /opt/logstash-forwarder && \
    wget https://github.com/elasticsearch/logstash-forwarder/archive/v0.4.0.tar.gz && \
    tar zxvf v0.4.0.tar.gz -C /opt/logstash-forwarder --strip-components=1 && \
    cd /opt/logstash-forwarder/ && \
    go build && \
    yum remove -y tar wget git golang && \
    yum clean all

ENV LOGSTASH_IP 10.118.182.28
ENV LOGSTASH_PORT 5500

ADD config/logstash-forwarder.conf /etc/logstash/logstash-forwarder.conf
ADD config/logstash-forwarder.crt /opt/ssl/logstash-forwarder.crt
ADD config/logstash-forwarder.key /opt/ssl/logstash-forwarder.key

RUN mkdir /opt/logstash/logs

COPY start.sh /

RUN chmod +x /start.sh

EXPOSE 5500

CMD /start.sh

