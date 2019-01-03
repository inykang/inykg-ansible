#!/bin/bash
if [ $# -ne 2 ]; then
    echo "Usage: $0 [original ip name] [change name]"
    exit 1
fi
sudo /sbin/ip link set $1 down
sudo /sbin/ip link set $1 name $2
sudo /sbin/ip link set $2 up
