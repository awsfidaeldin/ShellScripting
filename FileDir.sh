#!/bin/bash

for i in $(ls)
do
if [ -f "$i" -a -s "$i" ]
then
echo "$i is a file"
elif [ -d "$i" ]
then
echo "$i is a directory" 
else
echo "$i is empty"
fi
done