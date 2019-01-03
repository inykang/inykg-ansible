#!/bin/bash
ZK_SERVERS=""
for i in `echo "$ZK" | tr ',' "\\n"`; do
    if [ "x$i" != "x" ]; then
        if [ "x$ZK_SERVERS" != "x" ]; then
            ZK_SERVERS=`echo "$ZK_SERVERS\\n - \"$i\""`
        else
            ZK_SERVERS=`echo " - \"$i\""`
        fi
    fi
done

sed -i -e "s/%zookeeper%/$ZK_SERVERS/g" $STORM_HOME/conf/storm.yaml
sed -i -e "s/%nimbus%/$NIMBUS_HOST/g" $STORM_HOME/conf/storm.yaml
echo "storm.local.hostname: $HOST_NAME" >> $STORM_HOME/conf/storm.yaml

exec supervisord --nodaemon --configuration /etc/supervisord.conf
