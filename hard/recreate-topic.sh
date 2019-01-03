#!/bin/bash
if [ $# -ne 2 ]; then
    echo "Usage: $0 [on where kafka is installed (hard|docker)] [command (delete|create)]"
    exit 1
fi

case "$1" in
'hard')
  COMM_PRE='/opt/kafka/bin/kafka-topics.sh'
  ;;

'docker')
  COMM_PRE='docker exec -it prod-kafka /opt/kafka/bin/kafka-topics.sh'
  ;;

*)
  echo "Wrong parameter: $1"
  ;;

esac

ZK_HOST='113.131.57.90:2181'
REP_FACTOR=2
PARTITIONS=1

case "$2" in
'delete')
/opt/kafka/bin/kafka-topics.sh --delete --zookeeper ${ZK_HOST} --topic CLICK_PC_WEB-IN-TOPIC
/opt/kafka/bin/kafka-topics.sh --delete --zookeeper ${ZK_HOST} --topic TRACKER_PC_WEB-IN-TOPIC
/opt/kafka/bin/kafka-topics.sh --delete --zookeeper ${ZK_HOST} --topic TRACKER_MOBILE_APP-IN-TOPIC
/opt/kafka/bin/kafka-topics.sh --delete --zookeeper ${ZK_HOST} --topic CLICK_MOBILE_WEB-IN-TOPIC
/opt/kafka/bin/kafka-topics.sh --delete --zookeeper ${ZK_HOST} --topic CLICK_MOBILE_WEBVIEW-IN-TOPIC
/opt/kafka/bin/kafka-topics.sh --delete --zookeeper ${ZK_HOST} --topic TRACKER_MOBILE_WEB-IN-TOPIC
/opt/kafka/bin/kafka-topics.sh --delete --zookeeper ${ZK_HOST} --topic TRACKER_MOBILE_WEBVIEW-IN-TOPIC
/opt/kafka/bin/kafka-topics.sh --delete --zookeeper ${ZK_HOST} --topic MAIN_BASE-ENT7259-SP-OUT01-TOPIC
/opt/kafka/bin/kafka-topics.sh --delete --zookeeper ${ZK_HOST} --topic MAIN_BASE-ENT4499-MEMORYGRID-OUT01-TOPIC
/opt/kafka/bin/kafka-topics.sh --delete --zookeeper ${ZK_HOST} --topic SUB_BASE_01-ENT4139-BRMS-OUT01-TOPIC
/opt/kafka/bin/kafka-topics.sh --delete --zookeeper ${ZK_HOST} --topic SUB_BASE_01-ENT4273-BRMS-OUT01-TOPIC
/opt/kafka/bin/kafka-topics.sh --delete --zookeeper ${ZK_HOST} --topic SUB_BASE_02-ENT9102-BRMS-OUT01-TOPIC
;;

'create')
/opt/kafka/bin/kafka-topics.sh --create --zookeeper ${ZK_HOST} --replication-factor ${REP_FACTOR} --partitions ${PARTITIONS} --topic CLICK_PC_WEB-IN-TOPIC
/opt/kafka/bin/kafka-topics.sh --create --zookeeper ${ZK_HOST} --replication-factor ${REP_FACTOR} --partitions ${PARTITIONS} --topic TRACKER_PC_WEB-IN-TOPIC
/opt/kafka/bin/kafka-topics.sh --create --zookeeper ${ZK_HOST} --replication-factor ${REP_FACTOR} --partitions ${PARTITIONS} --topic TRACKER_MOBILE_APP-IN-TOPIC
/opt/kafka/bin/kafka-topics.sh --create --zookeeper ${ZK_HOST} --replication-factor ${REP_FACTOR} --partitions ${PARTITIONS} --topic CLICK_MOBILE_WEB-IN-TOPIC
/opt/kafka/bin/kafka-topics.sh --create --zookeeper ${ZK_HOST} --replication-factor ${REP_FACTOR} --partitions ${PARTITIONS} --topic CLICK_MOBILE_WEBVIEW-IN-TOPIC
/opt/kafka/bin/kafka-topics.sh --create --zookeeper ${ZK_HOST} --replication-factor ${REP_FACTOR} --partitions ${PARTITIONS} --topic TRACKER_MOBILE_WEB-IN-TOPIC
/opt/kafka/bin/kafka-topics.sh --create --zookeeper ${ZK_HOST} --replication-factor ${REP_FACTOR} --partitions ${PARTITIONS} --topic TRACKER_MOBILE_WEBVIEW-IN-TOPIC
/opt/kafka/bin/kafka-topics.sh --create --zookeeper ${ZK_HOST} --replication-factor ${REP_FACTOR} --partitions ${PARTITIONS} --topic MAIN_BASE-ENT7259-SP-OUT01-TOPIC
/opt/kafka/bin/kafka-topics.sh --create --zookeeper ${ZK_HOST} --replication-factor ${REP_FACTOR} --partitions ${PARTITIONS} --topic MAIN_BASE-ENT4499-MEMORYGRID-OUT01-TOPIC
/opt/kafka/bin/kafka-topics.sh --create --zookeeper ${ZK_HOST} --replication-factor ${REP_FACTOR} --partitions ${PARTITIONS} --topic SUB_BASE_01-ENT4139-BRMS-OUT01-TOPIC
/opt/kafka/bin/kafka-topics.sh --create --zookeeper ${ZK_HOST} --replication-factor ${REP_FACTOR} --partitions ${PARTITIONS} --topic SUB_BASE_01-ENT4273-BRMS-OUT01-TOPIC
/opt/kafka/bin/kafka-topics.sh --create --zookeeper ${ZK_HOST} --replication-factor ${REP_FACTOR} --partitions ${PARTITIONS} --topic SUB_BASE_02-ENT9102-BRMS-OUT01-TOPIC
;;

*)
echo "Wrong command: $2"
;;
esac
