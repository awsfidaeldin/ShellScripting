sudo apt install mysql-server 2>logErr.txt
service mysql restart 2>logErr.txt
sudo apt update 2>logErr.txt
echo -e "Restarting the Machine after 5 minutes\n"
sudo shutdown -r +5 2>logErr.txt


