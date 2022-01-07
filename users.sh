#!/bin/sh

sub1()
{
for i in `cat /home/aws/users/userlist`
do 
	sudo useradd -m $i
done
}

sub2()
{
for i in `cat /home/aws/users/userlist`
do 
	id $i
done
}

sub3()
{
for i in `cat /home/aws/users/userlist`
do 
	sudo passwd $i
done
}
sub1
sub2
sub3