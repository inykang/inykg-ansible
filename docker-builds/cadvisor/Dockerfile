FROM alpine:3.2

ENV GLIBC_VERSION "2.23-r1"

RUN set -xe && \
    apk add --update ca-certificates device-mapper && \
    wget https://github.com/andyshinn/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk && \
    wget https://github.com/andyshinn/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-bin-${GLIBC_VERSION}.apk && \
    apk add --allow-untrusted glibc-${GLIBC_VERSION}.apk glibc-bin-${GLIBC_VERSION}.apk && \
    /usr/glibc-compat/sbin/ldconfig /lib /usr/glibc-compat/lib && \
    echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf && \
    rm -rf /var/cache/apk/*

RUN set -xe \
    && wget https://github.com/google/cadvisor/releases/download/v0.22.0/cadvisor -O /usr/bin/cadvisor \
    && chmod +x /usr/bin/cadvisor

EXPOSE 8080
ENTRYPOINT ["/usr/bin/cadvisor", "-logtostderr"]
