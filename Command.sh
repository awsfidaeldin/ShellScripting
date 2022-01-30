#!/bin/bash
clear
echo "Enter a command"
read command
while [ $command != "clear" ]
do
echo "You entered $command"
$command
echo "Enter another command"
read command
done