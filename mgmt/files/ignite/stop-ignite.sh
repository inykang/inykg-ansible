#!/bin/bash
PID=`ps -ef | grep "com.obzen.ignite.adminrest.IgniteRest" | grep -v grep | awk '{print $2}'`
echo "Ignite server is stopping..."
kill $PID
sleep 1;

loopcnt=0
pscnt=0
while [ $loopcnt -lt 40 ]; do
    pscnt=`ps -ef | grep IgniteRest | grep -v grep | wc -l`
    if [ $pscnt -ne 0 ]; then
        loopcnt=$(( $loopcnt + 1 ))
        sleep 2
    else
        break;
    fi
done

if [ $pscnt -eq 0 ]; then
    echo "Ignite server is stopped... [PID]:"$PID
else
    echo "FAILED to stop Ignite rest! [PID]:"$PID
    echo "stop ignite rest in force(kill -9)!"
    kill -9 $PID
fi
