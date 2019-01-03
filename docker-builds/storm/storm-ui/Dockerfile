FROM obzen-reg:5000/obzen/storm-base:0.10.0

MAINTAINER Nemo <hunjae.lee@gmail.com>

# web interface
EXPOSE 8080

RUN /usr/bin/config-supervisord.sh ui

CMD ["/usr/bin/start-supervisor.sh"]
