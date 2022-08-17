#!/bin/bash
<<comment!!!
/************************************************************
******* Author:         Christian KEMGANG NGUESSOP 
******* Version:        1.0.0                    
******* Purpose:        Real time CPU utilization monitoring      
******* Created date:   Mon Aug  8 11:42:57 CEST 2022        
******* Modified date:     
*************************************************************/
comment!!!
#************************** START **************************#
PATHS="/"
HOSTNAME=$(hostname)
CRITICAL=98
WARNING=90
CRITICALMAIL="alert.critical@chagest.local"
WARNINGMAIL="alert.warning@chagest.local"
mkdir -p /var/log/cputil
LOGFILE=/var/log/cputilhist/cpusage-`date +%h%d%y`.log
touch $LOGFILE
RESTOP=/var/log/cputilhist/restop-`date +%h%d%y`.log
touch $RESTOP

for path in $PATHS
do	
	CPULOAD=`top -b -n 2 -d1 > $RESTOP | grep "Cpu(s)" | tail -n1 | awk '{print $2}' | awk -F . '{print $1}'`
	DATA=`sed -n '1,10p' $RESTOP`

	echo -e "\n\n*****RESULTS******\n $DATA" >> $LOGFILE
	rm -rf $RESTOP

if [ -n $WARNING -a -n $CRITICAL ]; then
	if [ "$CPULOAD" -ge "$WARNING" -a "$CPULOAD" -lt "$CRITICAL" ]; then
		echo "`date "+%F %H:%M:%S"` WARNING - $CPULOAD on host $HOSTNAME" >> $LOGFILE
		#echo "WARNING Cpuload $CPULOAD host is $HOSTNAME | mail -s "CPULOAD is Warning" $WARNINGMAIL
		exit 1
	elif [ "$CPULOAD" -ge "$CRITICAL" ]; then
		echo "`date "+%F %H:%M:%S"` CRITICAL - $CPULOAD on host $HOSTNAME" >> $LOGFILE
		#echo "CRITICAL Cpuload $CPULOAD host is $HOSTNAME | mail -s "CPULOAD is Critical" $CRITICALMAIL
		exit 2
    else 
		echo "`date "+%F %H:%M:%S"` OK - $CPULOAD on host $HOSTNAME" >> $LOGFILE
		exit 0
	fi
fi
done

#*************************** END ***************************#
