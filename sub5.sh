# !/bin/sh
# File name sub5.sh



#trap [COMMANDS] [SIGNALS] 

trap "./trap.sh" SIGINT SIGTERM
echo "Running .. "

while :			# This is the same as "while true".
do
         sleep 10	# This script is not really doing anything.
         echo " Can't interrupt me"
         ./code
done