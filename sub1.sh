# !/bin/sh
# File name sub1.sh

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
        /home/aws/sub2.sh
        sleep 1&;
        /home/aws/sub3.sh
        sleep 1&;
       /home/aws/sub4.sh
     break
    fi
done
}

Intro_Script
Run



