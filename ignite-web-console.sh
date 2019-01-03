#!/bin/sh
print_usage() {
    echo "Usage: $0 [start / stop]"
}

if [ $# -ne 1 ]; then
    print_usage
    exit 0
fi 

case $1 in
start*)
    docker run -d --name ignite-web-console \
        -p 80:80 -p 3001:3001 \
        -v /data/prod/ignite:/var/lib/mongodb \
        apacheignite/web-console-standalone
;;
stop*)
docker stop ignite-web-console && docker rm ignite-web-console
;;
*)
    print_usage
;;
esac

