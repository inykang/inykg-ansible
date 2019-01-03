echo [program:storm-$1] | tee -a /etc/supervisord.conf
echo command=storm $1 | tee -a /etc/supervisord.conf
echo directory=/home/storm | tee -a /etc/supervisord.conf
echo autorestart=true | tee -a /etc/supervisord.conf
echo user=root | tee -a /etc/supervisord.conf
#echo stderr_logfile=/data/storm/$1.err.log | tee -a /etc/supervisord.conf
#echo stdout_logfile=/data/storm/$1.out.log | tee -a /etc/supervisord.conf
echo stdout_logfile=/dev/stdout | tee -a /etc/supervisord.conf
echo stdout_logfile_maxbytes=0 | tee -a /etc/supervisord.conf
echo stderr_logfile=/dev/stderr | tee -a /etc/supervisord.conf
echo stderr_logfile_maxbytes=0 | tee -a /etc/supervisord.conf
