# !/bin/sh
# File name Memory.sh

sub1()
{
#! /bin/bash
printf "Used Memory\tFree Memory\n"
end=$((SECONDS+30))
while [ $SECONDS -lt $end ]; do
MEMORYU=$(free -m | awk 'NR==2{printf "%.2f%%\t\t", $3*100/$2 }')
MEMORYF=$(free -m | awk 'NR==2{printf "%.2f%%\t\t", $4*100/$2 }')
echo "$MEMORYU$MEMORYF"
sleep 1
done
}
sub1

