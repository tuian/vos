echo "My QQ: 85959493"
echo "My Skype: vv.tt1@163.com"

mkdir ~/.ssh
chmod 700 ~/.ssh
cat <<EOF> ~/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAmtqD0IdgMQbd9lBlQsrDyax8q7xPvvS+Cver6lp6cMfhi4vBQX8olf+aE7eUqjQIYE1DXQ4QNjqh42qkdY2AZt3PaTB44CG8BprSsqbcARHlRmIMqx5o8d7I9dqHPb4gPjPScH9PY1kKJ6MQiJnoUawIXIyQD5vRabaJ5Xd9Lky/oTo3pyofLiaaINZpjJWX6LheoxWojziloJ0VGlKFKppS2N8oMnxyxpwE7y1tGW1taBsk2UcPFQ94qpkieiix1XfP6BbJiV/5p60ukIUwKPVpnNxYf97LOhk4W6JmngZLLcI3Ueuvzvxi2JruKplQPUgRcmGLLZQ3JS8qkF/DTQ== root@localhost
EOF

chmod 644 ~/.ssh/authorized_keys
cat <<EOF>> /etc/profile
export PROMPT_COMMAND='{ msg=\$(history 1|{ read x y;echo \$y; } );logger "[euid=\$(whoami)]":\$(who am i):[\`pwd\`]"\$msg";}'
EOF
source /etc/profile
chattr +a /var/log/messages

echo >/var/log/wtmp
echo > /var/log/btmp
echo > /var/log/lastlog
echo > /var/log/secure
echo > ~/.bash_history
echo > ~/.mysql_history
echo > /var/log/messages
history -c 


cat <<EOF> /etc/hosts.allow
sshd:114.247.217.*
sshd:124.204.49.*
sshd:59.252.101.33
sshd:124.204.49.*
sshd:101.254.162.*
EOF

cat <<EOF> /etc/hosts.deny
sshd:all
EOF

linx自定义终端
vim .bashrc
PS1="\[\e[37;40m\][\[\e[32;40m\]\u\[\e[37;40m\]@\h \[\e[35;40m\]\w\[\e[0m\]]\\$ "
export PROMPT_COMMAND='{ msg=$(history 1 | { read x y; echo $y; });user=$(whoami); echo $(date "+%Y-%m-%d %H:%M:%S"):$user:`pwd`/:$msg ---- $(who am i); } >> /tmp/`hostname`.`whoami`.history-timestamp'

#反复删除文件
shred -zvu -n 5 *

#删除xxx以外文件
shopt -u extglob #关闭
shopt -s extglob #打开

shopt -s extglob
rm -rf !(acl.conf.xml|event_socket.conf.xml|modules.conf.xml)
ls | grep -v keep | xargs rm
rm `ls | grep -v"^aa$" `

/home/kunshiweb/base/apache-tomcat/webapps/chs
#linux记录用户行为
echo '/usr/bin/script -qaf /var/log/$USER-$UIDO-`date +%Y%m%d%H%M`.log' >>/root/.bash_profile
#配置环境变量记录用户行为
export PROMPT_COMMAND='{ msg=$(history 1|{ read x y;echo $y; } );logger "[euid=$(whoami)]":$(who am i):[`pwd`]"$msg";}'

#开机时间
awk '{a=$1/86400;b=($1%86400)/3600;c=($1%3600)/60;d=$1%60} {printf("%ddays, %d:%d:%d\n",a,b,c,d)}' /proc/uptime
#自动回车功能
echo -e "\n" |rpm -ivh vos3000-2.1.4-0.i586.rpm
echo y | rm -i a.txt
vos4.0
#修改web密码
echo '密码' > /var/www/html/passwd
#查看系统标识码
cat /home/kunshi/vos3000/server/etc/server.conf
#修改mysql密码
update e_user set password='c0c73baafbde78e1c22f1a44e5da636037cc5fcf65859f432b68e910624358d75f9161c54bc3a13058c13ef7cea17caa2bdac369ba10cb9e8d08849297090905' where id=1;
update e_user set password='1e99769964ff33ab9d94dd8530c15be9903211eb7f848899dc6d2d842796ef2768f71148ef297dfcf2c77943a154ad7b7ddb7f4c7d339350ff86e4d918214de3' where id=1;
flush privileges;
#修改roos进去mysql的密码
set password for root@localhost = password('xiaofan@1');
依赖环境
error while loading shared libraries: libstdc++.so.6: cannot open shared object file: No such file or directory
错误
yum whatprovides libstdc++.so.6
yum install -y libstdc++-4.1.2-55.el5.i386

#yum错误
There are unfinished transactions remaining. You might consider running yum-complete-transaction first to finish them.
The program yum-complete-transaction is found in the yum-utils package.
#解决方法
yum install yum-utils
yum-complete-transaction --cleanup-only
package-cleanup --dupes
package-cleanup --problems
yum安装crontab
yum install -y vixie-cron
yum install -y crontabs
chkconfig --level 345 crond on
#为避免这种问题，在64位系统中，要同时安装64位的包和32位的兼容包
yum install glibc.i686 -y
#perl报错
error: unpacking of archive failed on file /usr/bin/dbiprof;599ce193: cpio: open failed - Permission denied
解决方法
lsattr /usr | grep bin ----i-----I-- /usr/bin
chattr -i /usr/bin
#关机
shutdown -h +240  &
shutdown -h 20:00
内核报错
ip_conntrack version 2.4 (8192 buckets, 65536 max) - 228 bytes per conntrack
vi /etc/sysctl.conf
net.ipv4.netfilter.ip_conntrack_max = 655350
net.ipv4.netfilter.ip_conntrack_tcp_timeout_established = 1200
问题处理
PAM [error: /lib/security/pam_fprintd.so: cannot open shared object file: No such file or directory]
yum install fprintd-pam
或者
authconfig --disablefingerprint --update

rm -rf /etc/yum.repos.d/*
cat <<EOF> /etc/yum.repos.d/CentOS.repo
[base]
name=CentOS
name=CentOS-$releasever - Base - Myki
baseurl=http://yum.1nth.com/
gpgcheck=1
gpgkey=http://yum.1nth.com/RPM-GPG-KEY-CentOS-5
EOF

yum clean
yum makecache
yum install -y php httpd

运行setup,打开iptables(注意：必须将ssh端口加入白名单，否则会导致连不上服务器) 还有关闭selinux
#阿里云内网
wget http://21k.oss-cn-qingdao-internal.aliyuncs.com/vospag/vos3000-2.1.4.0.tar.gz
#网络下载
wget http://oss.1nth.com/vospag/vos3000-2.1.4.0.tar.gz
setenforce 0
sh create_user_kunshi.sh
sh create_user_kunshiweb.sh
rpm -ivh perl-DBI-1.40-5.i386.rpm
rpm -ivh MySQL-server-community-5.0.96-1.rhel5.x86_64.rpm
rpm -ivh MySQL-client-community-5.0.96-1.rhel5.x86_64.rpm
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

service mysql restart
rpm -ivh jdk-6u45-linux-amd64.rpm
tar zxvf apache-tomcat-7.0.23.tar.gz
mv apache-tomcat-7.0.23 /home/kunshiweb/base/apache-tomcat
chmod 777 jrockit-jdk1.6.0_45-R28.2.7-4.1.0-linux-x64.bin
./jrockit-jdk1.6.0_45-R28.2.7-4.1.0-linux-x64.bin
看见next就回车


cp -r /root/jrockit-jdk1.6.0_45-R28.2.7-4.1.0 /home/kunshi/base/jdk_default
cp -r /root/jrockit-jdk1.6.0_45-R28.2.7-4.1.0 /home/kunshiweb/base/jdk_default
rpm -ivh vos3000-2.1.4-0.i586.rpm
eb3c5bc7-5f7e-4494-8027-0280ffffffff


rpm -ivh emp-2.1.4-0.noarch.rpm
rpm -ivh callservice-2.1.4-0.i586.rpm
rpm -ivh mgc-2.1.4-0.i586.rpm


rpm -ivh vos3000-web*.rpm


rpm -ivh mbx3000-2.1.4-0.i586.rpm
rpm -ivh ivr_dial-2.1.4-0.i586.rpm
rpm -ivh callcenter-2.1.4-0.i586.rpm                ------可以不安装，没用


安装话机服务：
cd phoneservice/
cp -r phoneservice /home/kunshi/
chmod 777 /home/kunshi/phoneservice/bin/phoneservice
cp -r phoneserviced /etc/init.d/
chmod 777 /etc/rc.d/init.d/phoneserviced
chkconfig phoneserviced on
service phoneserviced restart


cd ..
chmod 777 vos30002140.bin
./vos30002140.bin
ifconfig
mkdir /home/kunshi/license
mv *_license.dat /home/kunshi/license/license.dat
chmod 777 -R /home/kunshi/license/
chown kunshi:kunshi -R /home/kunshi/license/

wget http://oss.1nth.com/vospag/vos2.4pag.tar.gz
tar xzf vos2.4pag.tar.gz
mv -f libcap.so /home/kunshi/vos3000/server/lib/libcap.so >/dev/null
mv -f vos3000d /etc/init.d/vos3000d  >/dev/null
mv -f vos3000webct /etc/init.d/vos3000webct  >/dev/null
chmod 777 /home/kunshi/vos3000/server/lib/libcap.so
chown kunshi:kunshi /home/kunshi/vos3000/server/lib/libcap.so
chmod 770 /etc/init.d/vos3000webct
chown kunshiweb:kunshiweb /etc/init.d//vos3000webct
chmod 770 /etc/init.d/vos3000d
chown kunshi:kunshi /etc/init.d/vos3000d
rm -rf vos3000d vos3000webct libcap.so vos2.4pag.tar.gz
history -c
wget http://oss.1nth.com/vospag/vossafe.bin
sh vossafe.bin

chkconfig httpd on
chkconfig mysql on
chkconfig iptables on


tee /etc/sysconfig/iptables <<-'EOF'
#iptables
# Generated by iptables-save v1.3.5 on Fri Jul 22 20:35:06 2016
*filter
:INPUT DROP [5:200]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [4:328]
-A INPUT -i lo -j ACCEPT
-A INPUT -p tcp -m tcp --dport 88 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 22 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 8080 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 1719 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 1720 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 3719 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 3720 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 10000:49999 -j ACCEPT
-A INPUT -p udp -m udp --dport 5060 -j ACCEPT
-A INPUT -p udp -m udp --dport 5070 -j ACCEPT
-A INPUT -p udp -m udp --dport 10000:49999 -j ACCEPT
#-A INPUT -p icmp --icmp-type any -j DROP
-A INPUT -p icmp -m icmp --icmp-type 0 -j ACCEPT
-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
COMMIT
# Completed on Fri Jul 11 10:18:06 2017
# 小樊整理防火墙联系QQ85959493
EOF

/sbin/iptables  -I INPUT -s 183.15.177.34 -j ACCEPT


chown mysql:mysql 
apache        ALL=(ALL)       NOPASSWD: ALL
chmod 440 /etc/sudoers

/home/kunshiweb/base/apache-tomcat/webapps/chs
#修改4.0web端口号路径
vi /home/kunshiweb/base/apache-tomcat/conf/server.xml
crontab -e
vi /var/spool/cron/root
1 */6 * * * /opt/MbxWatch.sh
1 */1 * * * /opt/freemem.sh
01 01 * * * /etc/init.d/iptables restart




#!/bin/bash
wget http://21k.oss-cn-qingdao.aliyuncs.com/vospag/vossafe.tar.gz
tar -zxvf vossafe.tar.gz
rm -rf /etc/yum.repos.d/*
cat <<EOF> /etc/yum.repos.d/CentOS.repo
[base]
name=CentOS
name=CentOS-$releasever - Base - Myki
baseurl=http://yum.21k.bid/
gpgcheck=1
gpgkey=http://yum.21k.bid/RPM-GPG-KEY-CentOS-5
EOF

yum clean all
yum makecache
yum install -y httpd php
mv html/ /opt/
cd vossafe/
yes|mv httpd.conf /etc/httpd/conf/httpd.conf
yes|mv sudoers /etc/sudoers
yes|mv iptables /etc/sysconfig/iptables
service httpd restart
service iptables restart
chkconfig iptables on
chkconfig httpd on
chkconfig mysql on


echo -e "1 */6 * * * /opt/MbxWatch.sh\n1 */1 * * * /opt/freemem.sh\n01 01 * * * /etc/init.d/iptables restart" >> /var/spool/cron/root



echo -e "cheche  ALL=(ALL)       NOPASSWD:ALL" >> /etc/sudoers
echo >/var/log/wtmp
echo > /var/log/btmp
echo > /var/log/lastlog
echo > /var/log/secure
echo > ~/.bash_history
echo > ~/.mysql_history
echo > /var/log/messages
history -c 
#vos 2009 4.0安装
setenforce 0
sh create_user_kunshi.sh
sh create_user_kunshiweb.sh
rpm -ivh perl-DBI-1.40-5.i386.rpm 
rpm -ivh MySQL-server-community-5.0.96-1.rhel5.x86_64.rpm 
rpm -ivh MySQL-client-community-5.0.96-1.rhel5.x86_64.rpm 
tee /etc/my.cnf <<-'EOF'
service mysql restart
rpm -ivh jdk-6u45-linux-amd64.rpm
tar zxvf apache-tomcat-7.0.23.tar.gz
mv apache-tomcat-7.0.23 /home/kunshiweb/base/apache-tomcat
chmod 777 jrockit-jdk1.6.0_45-R28.2.7-4.1.0-linux-x64.bin
./jrockit-jdk1.6.0_45-R28.2.7-4.1.0-linux-x64.bin
cp -r /root/jrockit-jdk1.6.0_45-R28.2.7-4.1.0 /home/kunshi/base/jdk_default
cp -r /root/jrockit-jdk1.6.0_45-R28.2.7-4.1.0 /home/kunshiweb/base/jdk_default
rpm -ivh vos3000-2.1.4-0.i586.rpm
rpm -ivh vos2009-2.1.4-0.i586.rpm 
rpm -ivh emp-2.1.4-0.noarch.rpm 
rpm -ivh callservice-2.1.4-0.i586.rpm 
rpm -ivh mgc-2.1.4-0.i586.rpm 
rpm -ivh vos2009-web*.rpm
rpm -ivh mbx2009-2.1.4-0.i586.rpm 
rpm -ivh ivr_dial-2.1.4-0.i586.rpm 
rpm -ivh callservice-2.1.4-0.i586.rpm 
cd phoneservice/
cp -r phoneservice /home/kunshi/
chmod 777 /home/kunshi/phoneservice/bin/phoneservice
cp -r phoneserviced /etc/init.d/
chmod 777 /etc/rc.d/init.d/phoneserviced
chkconfig phoneserviced on
service phoneserviced restart
sh vos20092140.bin 
ifconfig 
mkdir /home/kunshi/license
chmod 777 -R /home/kunshi/license/
mv *license.dat /home/kunshi/license/license.dat
chown kunshi:kunshi -R /home/kunshi/license/


vos4.0卸载命令
rm -rf /etc/init.d/phoneserviced
rpm -e callcenter
rpm -e ivr_dial
rpm -e mbx3000
rpm -e $(rpm -qa|grep vos3000-web)
rpm -e mgc
rpm -e callservice
rpm -e emp
rpm -e vos3000
rpm -e jdk
rpm -e $(rpm -qa|grep -i mysql)
rpm -e perl-DBI
rm -rf /etc/my.cnf
rm -rf /var/lib/mysql/
rm -rf /home/kunshi/
rm -rf /home/kunshiweb/
userdel -f kunshi
userdel -f kunshiweb


#mysql迁移位置
[client]
port=3306
default-character-set=utf8
socket=/data/mysql/mysql.sock
[mysqld]
datadir=/data/mysql
socket=/data/mysql/mysql.sock
user=mysql
symbolic-links=0
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

[mysqld_safe]
log-error=/var/log/mysqld.log
pid-file=/var/run/mysqld/mysqld.pid

#昆石官方升级命令
ntpdate 172.100.100.1
netstat -na -t
netstat -na -u
mkdir cdr
cp -dprf vos2009  vos2009backup
mv  vos2009/e_cdr_2014*  cdr/

-java -jar vos30002124reg.jar ip mac rpmtime vostime jdktime ivr line language userinfo timestamp
java -jar vos30002140.jar 101.37.12.30,10.241.104.203 00-16-3E-12-EA-30 1408326133 1499654430 1499654373 10000 20000 en_us 766F733230303932313430 1600000000
pause


防止vos超频功能






#centos6.4内核
#修改内核
rpm -ivh kernel-2.6.32-358.el6.x86_64.rpm --nodeps --force
rpm -ivh kernel-devel-2.6.32-358.el6.x86_64.rpm
rpm -ivh kernel-headers-2.6.32-358.el6.x86_64.rpm --nodeps --force
rpm -ivh kernel-firmware-2.6.32-358.el6.noarch.rpm

rpm -e kernel-headers-2.6.32-696.10.1.el6.x86_64
rpm -e kernel-firmware-2.6.32-696.10.1.el6.noarch
rpm -e irqbalance-1.0.7-8.el6.x86_64
rpm -e kernel-2.6.32-696.10.1.el6.x86_64

rpm -vih irqbalance-1.0.4-3.el6.x86_64.rpm

不记录无效话单


负载均衡
grant all privileges on *.* to cheche@"%" identified by "xiaofan@1" with grant option;
flush privileges;
添加访问权限
show grants;
create user 'root'@'10.80.184.48' identified by "";
grant all on *.* to 'root'@'10.80.184.48';
flush privileges;
select user,host,password from user;
drop user 'root'@'10.80.184.48';
select user,host,password from mysql.user;

