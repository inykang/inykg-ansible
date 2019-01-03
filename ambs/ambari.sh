#!/bin/bash
if [ $# -ne 1 ]; then
    echo "Usage: $0 [start/stop]"
    exit -1
fi

case $1 in
start)
    ansible ambs -m shell -a "ambari-agent start" --become
    sleep 5
    ansible ambs -m shell -a "ambari-server start" --become
    ;;
stop)
    ansible ambs -m shell -a "ambari-server stop" --become
    sleep 5
    ansible ambs -m shell -a "ambari-agent stop" --become
    ;;
*)
    echo "Usage: $0 [start/stop]"
    ;;
esac
