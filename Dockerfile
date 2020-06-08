FROM centos:latest
ARG VERSION=v2.4.4
ARG RELEASE_DATE=20200605
RUN yum install -y wget \
    && wget -T 10 -O /opt/mongo-shake-${VERSION}.tar.gz https://github.com/alibaba/MongoShake/releases/download/release-${VERSION}-${RELEASE_DATE}/mongo-shake-${VERSION}.tar.gz \
    && cd /opt \
    && tar xzvf mongo-shake-${VERSION}.tar.gz -C ./ \
    && mv mongo-shake-${VERSION} mongo-shake \
    && rm -f mongo-shake-${VERSION}.tar.gz \
    && cd mongo-shake \
    && mkdir conf \
    && cp collector.conf conf/
WORKDIR /opt/mongo-shake
VOLUME [ "/opt/mongo-shake/conf" ]
CMD [ "./collector.linux", "-conf=conf/collector.conf", "--verbose" ]
