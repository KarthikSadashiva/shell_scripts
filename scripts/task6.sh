#!/bin/sh

hostname=$(hostname)
time=$(date +"%T")
date=$(date +"%F")
fname="$hostname-$date-$time.log"
touch $fname


service httpd stop

portnum=$(sudo netstat -6tnlp | grep httpd |  awk ' {print $4}' | sed 's/^...//')

if [ -z "$portnum" ]
then
   echo "Httpd Service stopped" >> $fname

fi

echo "Downloading ZIP file and saving as temp.zip" >> $fname
wget https://github.com/Akashbhaskaran/sample/raw/master/trial.zip -O temp.zip; 

echo "Unzipping temp.zip" >> $fname
unzip temp.zip

echo "List of files unzipped " >> $fname

ls /home/U65986/trial/ >> $fname 
echo "Removing temp.zip" >> $fname
rm temp.zip

echo "Changing file group to apache" >> $fname
sudo chown -R apache /home/U65986/trial/*

echo "Creating symlink from /home/U65989/public_html to /home/U65989/www/html/" >> $fname
ln -s /home/U65986/public_html /home/U65986/www/html/


service httpd start
portnum=$(sudo netstat -6tnlp | grep httpd |  awk ' {print $4}' | sed 's/^...//')

if ! [ -z "$portnum" ]
then
   pid=$(ps -ef | grep apache |  awk ' { print $2 } '| head -n 1)

   echo "Httpd Service started" >> $fname
   echo "Apache process id is $pid " >> $fname
else
echo "$portnum"
fi

