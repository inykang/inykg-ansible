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
docker run -d --name mariadb --hostname mariadb\
    -p 3306:3306 \
    -e MYSQL_DATABASE=ignite \
    -e MYSQL_PASSWORD=obzcom1! \
    -e MYSQL_ALLOW_EMPTY_PASSWORD=yes \
    -v /data/prod/mariadb/mdb10:/var/lib/mysql \
    mariadb:10.3.5
;;
stop*)
docker stop mariadb && docker rm mariadb
;;
*)
    print_usage
;;
esac

