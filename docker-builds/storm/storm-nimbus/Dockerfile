From obzen-reg:5000/obzen/storm-base:0.10.0

MAINTAINER Nemo <hunjae.lee@gmail.com>

RUN /usr/bin/config-supervisord.sh nimbus
RUN /usr/bin/config-supervisord.sh drpc

# nimbus.thrift.port
EXPOSE 6627
# drpc.port
EXPOSE 3772
# drpc.invocation.port
EXPOSE 3773

CMD ["/usr/bin/start-supervisor.sh"]
