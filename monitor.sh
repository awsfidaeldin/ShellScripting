#!/bin/bash
#monitor available disk space
#free -m | awk 'NR==2{printf "Percentage of used memeary space %.2f%\n", $3*100/$2 }'
#echo -e
#df -h | awk 'NR==4{printf "The percentage of free disk space = %s\n",$5}'
#echo -e
#top -bn1 | grep load | awk '{printf "CPU Percentage  %.2f%%\t\t\n", $(NF-2)}'


#! /bin/bash
printf "Memory\t\tDisk\t\tCPU\n"
end=$((SECONDS+1))
while [ $SECONDS -lt $end ]; do
MEMORY=$(free -m | awk 'NR==2{printf "%.2f%%\t\t", $3*100/$2 }')
DISK=$(df -h | awk '$NF=="/"{printf "%s\t\t", $5}')
CPU=$(top -bn1 | grep load | awk '{printf "%.2f%%\t\t\n", $(NF-2)}')
echo "$MEMORY$DISK$CPU"
sleep 5
done



#!/bin/bash

wget -q --spider https://google.com

if [ $? -eq 0 ]; then
    echo "Online"
 #   speedtest
 #   fast
else
    echo "Offline"
fi


#!/bin/sh

filename='bigfiles'
find /home/aws -maxdepth 6 -type f -size +1M > $filename
count=`cat bigfiles | wc -l`

if [ $? -ne 0 ]
then
  date >> $filename
  mail -s "Large log files found on server" aws@qu.edu.qa < $filename
fi

#!/bin/bash
DATE=$(date +'%F %H:%M:%S')
DIR=/home/aws/project
echo "Current date and time: $DATE" > $DIR/file1.txt


#!/bin/bash
path="/home/aws/project/file1.txt"
if [[ -f $path ]]
then
echo "$path file exsists"
if [[ -w $path ]]
then
echo "$path file is writable"
else
echo "$path file is not writable"
echo "Now we are adding write acess to the file"
#chmod u+w $path
if [[ -w $path ]]
then
echo "$path  file is writable now"
fi
fi
else
echo "$path file doesnt exsists"
fi


FILE="/home/aws/project/file1.txt"

if [[ -r $FILE && -w $FILE  && -x $FILE ]]
then
echo "FULL PERMISSION"
else
echo "NOT FULL PERMISSION"
fi

p1=$(find ./home/aws/project -perm -777)
echo $p1
for i in `ls`
do
chmod 700 $i
done


