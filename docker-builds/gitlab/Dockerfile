# For the official Cassandra Docker File, please refer to https://hub.docker.com/_/cassandra/
#

FROM obzen-reg:5000/obzen/alpine-oracle-jdk8-stripped:3.3

RUN apk --update add bash && rm -rf /var/cache/apk/*

ENV CASSANDRA_VERSION 2.1.12

RUN wget -q -O - http://apache.mirror.cdnetworks.com/cassandra/${CASSANDRA_VERSION}/apache-cassandra-${CASSANDRA_VERSION}-bin.tar.gz | tar zxvf - -C /opt \
    && ln -s /opt/apache-cassandra-${CASSANDRA_VERSION} /opt/cassandra \
    && mkdir -p /data/cassandra

COPY start.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/start.sh

ENV CASSANDRA_CONFIG /opt/cassandra/conf
#Storage
ENV CASSANDRA_DATA_FILE_DIRECTORIES /data/cassandra/data
ENV CASSANDRA_COMMIT_LOG_DIRECTORIE /data/cassandra/commitlog
ENV CASSANDRA_SAVED_CACHE_DIRECTORY /data/cassandra/saved_caches

ENTRYPOINT ["/usr/local/bin/start.sh"]

VOLUME ["/data/cassandra"]
    
EXPOSE 7000 7001 7199 9042 9160

CMD ["/opt/cassandra/bin/cassandra", "-f"]


#RUN apt-get update \
#    && apt-get install -y cassandra="$CASSANDRA_VERSION" \
#        && rm -rf /var/lib/apt/lists/*
#
#        ENV CASSANDRA_CONFIG /etc/cassandra
#
#        COPY docker-entrypoint.sh /docker-entrypoint.sh
#        ENTRYPOINT ["/docker-entrypoint.sh"]
#
#        VOLUME /var/lib/cassandra

# 7000: intra-node communication
# 7001: TLS intra-node communication
# 7199: JMX
# 9042: CQL
# 9160: thrift service
#EXPOSE 7000 7001 7199 9042 9160
#CMD ["cassandra", "-f"]
