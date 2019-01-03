#! /bin/sh

KIBANA_HOME=/opt/kibana
MAIN_CLASS='kibana/bin'
NAME=kibana-6.3.0

case "$1" in
  start)
    echo -e "Starting $NAME: \n"
    
    pscnt=`ps -ef | grep $MAIN_CLASS | grep -v grep | wc -l`
    if [ $pscnt -gt 0 ]; then
        echo "$NAME is already started."
        exit 1
    fi

    nohup $KIBANA_HOME/bin/kibana > /dev/null 2>&1 &
    loopcnt=0
    pscnt=0
    while [ $loopcnt -lt 30 ]; do
        sleep 1
        pscnt=`ps -ef | grep $MAIN_CLASS | grep -v grep | wc -l`
        if [ $pscnt -ne 1 ]; then
            echo "waiting for starting $NAME. waited time: $(( $loopcnt )) seconds"
            loopcnt=$(( $loopcnt + 1 ))
        else
            break
        fi
    done

    if [ $pscnt -eq 0 ]; then
        echo "faied to start $NAME for $loopcnt seconds."
    else
        echo "$NAME started."
    fi
    ;;
  stop)
    PID=`ps -ef | grep $MAIN_CLASS | grep -v grep | awk '{print $2}'`
    if [ -z $PID ]; then
        echo "$NAME is not running state." 
        exit 1;
    fi  
    echo -e "Stopping $NAME: \n"
    kill $PID

    loopcnt=0
    pscnt=0
    while [ $loopcnt -lt 30 ]; do
        pscnt=`ps -ef | grep $MAIN_CLASS | grep -v grep | wc -l`
        if [ $pscnt -ne 0 ]; then
            sleep 1
            echo "waiting for starting $NAME. waited time: $(( $loopcnt )) seconds"
            loopcnt=$(( $loopcnt + 1 ))
        else
            break
        fi
    done

    if [ $pscnt -eq 0 ]; then
        echo "$NAME stopped... [PID]:$PID"
    else
        echo "failed in gracefully stopping $NAME! [PID]:$PID"
        echo "$NAME will be forcely killed."
        kill -9 $PID
    fi
    ;;
  restart|force-reload)
    ${0} stop
    sleep 0.5
    ${0} start
    ;;
  *)
    echo "Usage: $0 {start|stop|restart|force-reload}" >&2
    exit 1
    ;;
esac

exit 0
