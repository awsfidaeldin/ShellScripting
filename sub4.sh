# !/bin/sh
# File name sub4.sh

d=`date +%d%m%y`
mkdir $d
find /home/aws/dir1 -perm  700 -exec cp  {} /home/aws/backup \;
cd $d
chmod 500 $d/*

sudo find /home/aws -type f -size +100M > HOLDFILE.txt

speedtest > Results

#!/bin/bash

wget -q --spider https://google.com

if [ $? -eq 0 ]; then
    echo "Online"
    ping -c 8 10.20.102.1 > PingResults   
else
    echo "Offline"
    sleep 1
    shutdown -r +15
fi

#! /bin/bash
printf "Used Memory\tFree Memory\n"
end=$((SECONDS+30))
while [ $SECONDS -lt $end ]; do
MEMORYU=$(free -m | awk 'NR==2{printf "%.2f%%\t\t", $3*100/$2 }')
MEMORYF=$(free -m | awk 'NR==2{printf "%.2f%%\t\t", $4*100/$2 }')
echo "$MEMORYU$MEMORYF"
sleep 1
done

