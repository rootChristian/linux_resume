#!/bin/bash
<<comment!!!
/************************************************************
******* Author:         Christian KEMGANG NGUESSOP 
******* Version:        1.0.0                    
******* Purpose:        Monitoring Disk Space utilization and send email alert      
******* Created date:   Mon Aug  8 12:49:23 CEST 2022        
******* Modified date:     
*************************************************************/
comment!!!
#************************** START **************************#
THRESHOULD=80
mailto="root"
HOSTNAME=$(hostname)

readonly dir='/var/tmp'
readonly new_file='temp'
TEMP=/$dir/$new_file

if [ -d "/$dir" ] ; then 
		if [ ! -f "$TEMP" ]; then 
			touch $TEMP 
		fi
else 
		mkdir /$dir && touch $TEMP 
fi

df -h | sed -n '1,1p' >> $TEMP 

for path in `/bin/df -h | grep -vE 'Filesystem|tmpfs' | awk '{print $5}' | sed 's/%//g'`
do
	if [ $path -ge $THRESHOULD ]; then
		df -h | grep $path >> $TEMP 
	fi 
done

VALUE=`cat $TEMP | wc -l`
	if [ $VALUE -ge 2 ]; then
		echo -e "`date "+%F %H:%M:%S"` $HOSTNAME Disk usage is critical\n" < $TEMP
		#mail -s "$HOSTNAME Disk usage is critical" $mailto < $TEMP
	fi
rm -rf $TEMP

#*************************** END ***************************#
