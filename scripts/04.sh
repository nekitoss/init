#!/bin/sh
echo "0 0 * * * $(pwd)/04.sh" >> /etc/crontab
file=/etc/crontab
IFS= read -r line
md5sum='md5sum $file | awk '{print$1}''

$IFS < $md5sum
if [ $md5sum == $line]
	echo "File NOT modified"
else
	echo "$md5sum" | mail -s "Crontab MODIFIED" root