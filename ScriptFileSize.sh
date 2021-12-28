#!/bin/bash
clear
echo "Enter a file name"
read f
while [ "$f" != "end" ]
do
c=`wc -l < $f`
echo "File Size = $c"
echo
if [ "$c" > 1 -a "$c" < 30 ]
then
echo "short File"
cat $f
else
echo "long File"
more $f
fi
echo "Enter a file name"
read f
done
exit