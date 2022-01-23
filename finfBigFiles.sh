#! /bin/bash


#findBigFiles.sh: is a script that takes a size as an argument in MB and find the list of files in current directory, 
#displays the numbers of files found, and the date and time of the search.

#usage function displays a messege log
usage(){
echo -e  "**************************************\n
USAGE: $0  [$MEG_BYTES]\n
Will Find Files Larger Than $MEG_BYTES Mb in and below the $pwd... \n
 
EXITING... \n
**************************************\n"
 
}


#define MEG_BYTES variable to hold user input
MEG_BYTES=$1 

#check if numbers of the arguments is greater than 1  
if [ "MEG_BYTES" != "" ]; then
	usage
else
{
	usage
	exit 0
}
fi
#define OUTFILE and HOLDFILE variables to store the files
OUTFILE="/tmp/largefiles.out"
HOLDFILE="/tmp/temp_hold_file.out"
#get the system current Date/Time
DATESTAMP=$(date +"%h %d %Y at %T")
#get the current directory path
SEARCHPATH=$(pwd)

#redirect the Date and Time to OUTFILE
echo "Date/Time of Search:"$DATESTAMP > $OUTFILE

#print a messege
echo "Searching for Files Larger Than $MEG_BYTES Mb starting in $SEARCHPATH
Please Standby for the Search Results..."

#define variable SIZE
SIZE=$MEG_BYTES"M"

#search for the files with size MEG_BYTES and redirect it to holdfile
find $SEARCHPATH -type f -size +$SIZE > $HOLDFILE


#check if holdfile is not empty and do the following tasks
if [ -s $HOLDFILE ]
then
{	
    wordCount=`cat $HOLDFILE | wc -l`
    echo "The Number of files : $wordCount " >> $OUTFILE
}
else
     echo -e "No files were found that are larger than 5MB\nExiting..."
fi
#ddd content of holdfile to outfile
cat $HOLDFILE >> $OUTFILE
#display the Outfile on screen
cat $OUTFILE
#initialize to a null file 
cat /dev/null>$OUTFILE
#initialize to a null file 
cat /dev/null>$HOLDFILE
#display a messege on screen
echo -e "These search results are stored in /temp/largefiles.out
Search complete …Exiting…"




