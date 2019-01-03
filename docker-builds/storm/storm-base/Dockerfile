# For Apache Storm Cluster
# obzen-reg:5000/obzen/storm-base:0.10.0
# Apache Storm 0.10.0
FROM obzen-reg:5000/obzen/alpine-oracle-jdk8-stripped:3.3

MAINTAINER Nemo <hunjae.lee@gmail.com>

# Storm need bash & supervisor(d) && sshd
RUN apk --update add bash supervisor openssh && rm -rf /var/cache/apk/*

# sshd configuration
RUN echo 'root:root' | chpasswd
# Default is "yes" in Alpine
# RUN sed -i 's/^#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN /usr/bin/ssh-keygen -A && ln -sf /usr/share/zoneinfo/UTC /etc/localtime

EXPOSE 22

ENV STORM_VERSION 0.10.0

# download & install storm
RUN wget -q -O - http://mirror.apache-kr.org/storm/apache-storm-${STORM_VERSION}/apache-storm-${STORM_VERSION}.tar.gz | tar zxvf - -C /opt \
    && ln -s /opt/apache-storm-${STORM_VERSION} /opt/storm

# add storm user and group
RUN addgroup storm; adduser -G storm -h /home/storm -s /bin/bash -D storm; chown -R storm:storm /opt/apache-storm-${STORM_VERSION}

ENV STORM_HOME /opt/storm

# make directory for storm logs
RUN mkdir -p /data/storm; chown -R storm:storm /data/storm

RUN ln -s ${STORM_HOME}/bin/storm /usr/bin/storm

COPY storm.yaml ${STORM_HOME}/conf/storm.yaml
COPY cluster.xml ${STORM_HOME}/log4j2/cluster.xml
COPY worker.xml ${STORM_HOME}/log4j2/worker.xml
COPY config-supervisord.sh /usr/bin/config-supervisord.sh
COPY start-supervisor.sh /usr/bin/start-supervisor.sh
RUN chmod 755 /usr/bin/config-supervisord.sh /usr/bin/start-supervisor.sh

# change supervisord.conf to run supervisor foreground
RUN sed -i 's/;nodaemon=false/nodaemon=true/' /etc/supervisord.conf
# change supervisord.conf to lay log file in the storm data directory
RUN sed -i 's/\/var\/log/\/data\/storm/' /etc/supervisord.conf

VOLUME ["/data/storm"]
