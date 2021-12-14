# !/bin/sh
# File name sub3.sh
# AUTHOR: Aws
# DATE: 12/25/2019
# PURPOSE: This script is used to search for files that are larger than $1 Meg. Bytes. The search starts at the current directory that the user is in, `pwd`, and includes files in and below the user’s current directory. The output is both displayed to the user and stored in a file for later review.
#
SCRIPT_NAME=$(basename $0)
####### FUNCTIONS ###################
usage()
{
echo -e "\n ***************************************"
echo -e "\n USAGE: $SCRIPT_NAME [Number_Of_Meg_Bytes]"
echo -e "\n EXAMPLE: $SCRIPT_NAME 5"
echo -e "\n\n Will Find Files Larger Than 5 Mb in, and below the Current Directory..."
echo -e "\n\n\t...EXITING..."
echo -e "\n ***************************************"
}
# Check for the correct number of arguments
if [ $# -ne 1 ]
then
usage # Caller to the above function
exit 1
fi
# Define and initialize files and variables here...
DATESTAMP=$(date +"%h%d:%Y:%T") # Date/Time Stamp
SEARCH_PATH=$(pwd) # Top-level directory to search (CURRENT DIR!)
MEG_BYTES=$1 # Number of MB for file size trigger
OUTFILE="/tmp/largefiles.out" # Output user file
cat /dev/null > $OUTFILE # Initialize to a null file
HOLDFILE="/tmp/temp_hold_file.out" # Temporary storage file
cat /dev/null > $HOLDFILE # Initialize to a null file
############################################
# Prepare the Output File Header
echo -e "\n Searching for Files Larger Than ${MEG_BYTES}Mb Starting in:"
echo -e "\n ==> $SEARCH_PATH"
echo -e "\n Date/Time of Search: `date`" >> $OUTFILE
echo -e "\n Please Standby for the Search Results..."
############################################
# Search for files > $MEG_BYTES starting at the $SEARCH_PATH
find $SEARCH_PATH -type f -size +${MEG_BYTES}000000c -print > $HOLDFILE
# How many files were found?
if [ -s $HOLDFILE ] # File greater than zero bytes?
then
NUMBER_OF_FILES=`cat $HOLDFILE | wc -l`
echo -e "\nNumber of Files Found: ==> $NUMBER_OF_FILES\n\n" >> $OUTFILE
# Append to the end of the Output File...
cat $HOLDFILE >> $OUTFILE
# Display the Time Sorted Output File...
more $OUTFILE
echo -e "\n These Search Results are Stored in ==> $OUTFILE"
echo -e "\n Search Complete...EXITING...\n"
else
cat $OUTFILE # Show the header information!
echo -e "\n\nNo Files were Found in the Search Path that"
echo -e "are Larger than ${MEG_BYTES}Mb\n"
echo -e "\n\t...EXITING...\n"
fi
rm -f $HOLDFILE # Remove the temp. file
# End of the findBigFile
