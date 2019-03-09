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

#run this script only once!
#https://crontab.guru/
#https://linux.die.net/man/1/md5sum
#https://stackoverflow.com/questions/5155923/sending-a-mail-from-a-linux-shell-script
#https://unix.stackexchange.com/questions/171860/how-to-monitor-the-integrity-of-a-script-that-is-running
#http://www.codenet.ru/webmast/php/cron.php