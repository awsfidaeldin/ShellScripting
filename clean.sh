#!/bin/bash

clear
sub1()
{
for i in $@
do
  if [ ! -s "$i" ]
  then
    file $i >> results.txt
  fi 
done
rm f?
cat results.txt
}
sub1 f1 f2 f3

