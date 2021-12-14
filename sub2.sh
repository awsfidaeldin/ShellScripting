# !/bin/sh
# File name performance.sh
Usage()
{
du -h > disk_usage.txt
du -h | sort -r > disk_usage_sort.txt
dmesg > message_log.txt
dmesg | grep CPU > cpu_info.txt
dmesg | wc > dmesg_wc.txt

tar -cf compess.tar message_log.txt
tar -rf compess.tar cpu_info.txt 	
tar -rf compess.tar dmesg_wc.txt 
tar -rf compess.tar disk_usage.txt
gzip compess.tar 
p=`date +%H%M%S`
mkdir $p
cp compess.tar.gz /home/aws/$p 
}
Backup()		
{
d=`date +%y%m%d%H%M%S`
mkdir $d
for var in `ls`
do
  if [ -f $var -a -w $var ]
    then
countwrite=`expr $countwrite + 1`;
cp $var /home/aws/$d
cd /home/aws/$d
chmod 400 $var
cd ..
    fi
done
}

end()
{
echo "number of files with write permission ";
echo $countwrite;
echo "End of execution"
}
Usage
Backup
end

