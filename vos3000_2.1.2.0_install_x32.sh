#!/bin/bash
#centos5.11_32位安装脚本
#制作人小樊QQ:85959493
rpm -ivh perl-DBI-1.40-5.i386.rpm 
rpm -ivh MySQL-client-community-5.0.51a-0.rhel5.i386.rpm 
rpm -ivh MySQL-server-community-5.0.51a-0.rhel5.i386.rpm 
tee /etc/my.cnf <<-'EOF'
[client]
port=3306
default-character-set=utf8
[mysqld]
default-character-set=utf8
max_connections=160
interactive_timeout=310000
wait_timeout=31000
query_cache_size=48M
table_cache=320
tmp_table_size=52M
thread_cache_size=8
sort_buffer_size=256K
innodb_thread_concurrency=8
myisam-recover=FORCE
max_allowed_packet=32M
innodb_file_per_table=1
EOF

rpm -ivh jdk-1_5_0_08-linux-i586.rpm 
rpm -ivh emp-2.1.2-0.noarch.rpm 
rpm -ivh mbx3000-2.1.2-0.i586.rpm 
rpm -ivh ivr-2.1.2-0.i586.rpm 
tar zxvf apache-tomcat-5.5.15.tar.gz -C /usr/
sync
rpm -ivh vos3000-2.1.2-0.i586.rpm 
chmod 777 vos3000*
./vos30002120.bin >> /root/licenseinfo.log
ifconfig | grep ether | awk '{print $2}'| sed 's/:/-/g' >> /root/licenseinfo.log
