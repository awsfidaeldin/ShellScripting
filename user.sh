var=`grep $USER /etc/passwd`
if [ ! $var ]
then 
echo "your user account is not managed locally" 
else
echo "your user account is managed locally" 
fi
