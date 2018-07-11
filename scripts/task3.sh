#!/bin/sh
sudo useradd karthik

sudo usermod -G apache karthik

portnum=$(sudo netstat -6tnlp | grep httpd |  awk ' {print $4}' | sed 's/^...//')

default_port="80"
echo "Port number is $portnum"

if(($portnum==$default_port)); then
NOW=$(date +"%F")
LOGFILE="log-$NOW.log"
touch $LOGFILE
echo "Port number is $portnum"  >> $LOGFILE
fi

cp /etc/httpd/conf/httpd.conf .

docroot=$(grep -m2  DocumentRoot httpd.conf | tail -n1)

echo "$docroot"  >> $LOGFILE

