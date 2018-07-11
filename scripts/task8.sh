#!/bin/bash

echo "Downloading ZIP file and saving as temp.zip" 
wget --user jenkins --password redhat http://18.219.209.240/tmanserver_BUILD_1234.zip 
#mv tmanserver_BUILD_1234.zip tmanserver_BUILD_44456.zip
name=$(ls *.zip)

unzip $name

name="${name%.*}"
build=$(cat $name/bin/*.txt)

echo "$build"
if [[ $name = *"$build"* ]]; then
  echo "Same build files!"
else
 echo "DIfferent build files"
fi


