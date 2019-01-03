# /data volume
When bind a directory to /data, the directory's ownership should be ```1000:1000```.

# hadoop.log.dir
It is /data/logs, but it does not exist, because hadoop daemon will start with ```-Dhadoop.root.logger=INFO,console```.

# Web Interfaces
HDFS Name Node: http://name-node:50070/
HDFS Secondary Name Node: http://secondary-name-node:50090/
HDFS Data Node: http://data-node:50075/
YARN Resource Manager: http://resource-manager:8088/
YARN Node Manager: http://node-manager:8042/
MR Job History: http://history-server:19888/
