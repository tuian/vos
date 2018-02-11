fdisk /dev/xvdb
n
p
1


wq
mkfs.ext3 /dev/xvdb

mkdir /Sicdtwork
mount /dev/xvdb /Sicdtwork/
/dev/xvdb               /Sicdtwork              ext3    defaults        0 0

