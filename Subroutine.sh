#!/bin/bash

fun1()
{
    sum=0
    for i in $@
    do
        sum=$((sum+$i))
    done
    echo "Sum = $sum"
    echo
}
fun1 10 20 30 40 50

fun2()
{
	directory=/home/aws/lab4
	find $directory -type f -perm -u=rw
}
fun2

fun3()
{
    for i in $(ls /home/aws/lab4)
    do
        if [ -f $i -a -r $i -a -w $i -a ! -x $i ]
        then
            echo "$i is rw"
            ls -l $i
        fi
    done
}
fun3