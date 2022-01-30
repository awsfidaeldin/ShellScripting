#!/bin/bash
clear

list=$(ls /etc)

for i in $list
do
  if [ $i = resolv.conf ]
  then
    echo "Found $i"
    grep -c nameserver /etc/$i
    exit 
  fi
done
 