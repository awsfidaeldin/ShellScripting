echo "Please enter a directory name: \c"
read dname
if [ "$dname" = "" ]
then
  echo You did not enter a directory

elif [ -d $dname -a -w $dname ]

then
    echo Well done! > $dname/hello

else
    echo $dname is not a writable directory - nothing written
fi
