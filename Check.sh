#!/bin/bash

echo "Starting the shell script"
echo "today's date is $(date)"
echo "The calendar for this month"
cal 1 2022

for i in $(ls)
do 
	if [ -f $i -a -s $i ]
	then
		echo -e "$i is a file"
		let cf=cf+1
	elif [ -d $i ]
	then
		echo -e "$i is a directory"
		let cd=cd+1
	else
		echo -e "$i is an empty file"
		let ef=ef+1 
	fi
done
echo "# of files found $cf"
echo "# of directories found $cd"
echo "# of empty files found $ef"
echo 
echo "Rebooting the system . Please wait ......."
echo "Bye from $USER"
sleep 2
shutdown -r now
