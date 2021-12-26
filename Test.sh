# !/bin/sh

Date1=`date`
sleep 20
Date2=`date`
if test "$Date1" = "$Date2"
then
   echo "Stop! The computer clock is dead!"
else
   echo "Everything is fine"
   echo "$Date1"
   echo "$Date2"
fi
