#! /bin/bash
printf "Memory Used\tFree Memory\tDisk Usage\tCPU Load Time\n"
end=$((SECONDS+30))
while [ $SECONDS -lt $end ]; do
	MEMORYU=$(free -m | awk 'NR==2{printf "%.2f%%\t\t", $3*100/$2 }')
	MEMORYF=$(free -m | awk 'NR==2{printf "%.2f%%\t\t", $4*100/$2 }')
	DISK=$(df -h | awk '$NF=="/"{printf "%s\t\t", $5}')
	CPU=$(top -bn1 | grep load | awk '{printf "%.2f%%\t", $(NF-2)}')
	echo "$MEMORYU$MEMORYF$DISK$CPU"
	sleep 5
done
