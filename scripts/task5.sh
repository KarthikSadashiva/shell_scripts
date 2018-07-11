#!/bin/bash

mkdir sample
i=0

while [ $i -lt 10 ]
do
name="$i.txt"
touch ./sample/$name
i=`expr $i + 1`
done

hostname=$(hostname)
time=$(date +"%T") 
date=$(date +"%F")
fname="$hostname-$date-$time.log"
touch $fname
i=0
while [ $i -lt 10 ]
do
name="$i.txt"
timestamp=$(stat -c %y ./sample/$name)
echo "$name --  $timestamp"  >> $fname
i=`expr $i + 1`
done

