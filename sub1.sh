# !/bin/sh
# File name execute.sh

Intro_Script()
{
        echo -e "\n*****************************"
        echo -e "Describe here what the script will do"
        echo -e "\n*****************************"
}

Run()
{
While [ 1 ]
do
EXEAT="12:00"
    DATE=`/bin/date +%H:%M`
    if [ $DATE = $EXEAT ]
    then	
        /home/aws/performance.sh
     break
    fi
done
}

Intro_Script
Run



