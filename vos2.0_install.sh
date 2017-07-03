时间
date -s "2016-06-06 16:21:00"
clock -w
scp -P 5802 -r cheche@123.57.12.224:/root/vos2009.zip /root/
cat /etc/issue                                           //查看系统版本
cat /proc/version
lsb_release -a
getconf LONG_BIT
cat /etc/redhat-release
ifconfig
df -h
1. #vi /etc/sysconfig/clock
ZONE=”Asia/Shanghai”
UTC=false

2.#vi /usr/share/zoneinfo/Asia/Shanghai，如果结尾不是GMT+8，则修改为GMT+8

3. #cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
修改vos sip端口
vi /usr/kunshi/mbx2009/etc/softswitch.conf
SS_SIPPORT="5060,5161"



tar -zxvf vos.tar.gz
yum install glibc
glibc
libgcc
libstdc++
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

rpm -ivh  jdk-1_5_0_08-linux-i586.rpm
rpm -ivh emp-2.1.2-0.noarch.rpm 
rpm -ivh mbx2009-2.1.2-0.i586.rpm
rpm -ivh ivr-2.1.2-0.i586.rpm
tar zxvf apache-tomcat-5.5.15.tar.gz -C /usr/
mv apache-tomcat-5.5.15 /usr/
rpm -ivh vos2009-2.1.2-0.i586.rpm
chmod 744 vos20092120.bin 
./vos20092120.bin
ifconfig
chmod 777 vos20092120
./vos20092120
mkdir /usr/kunshi/license
vi /usr/kunshi/license/license.dat
iptables -I INPUT  -p tcp  --dport 10020  -j ACCEPT
iptables -I INPUT  -p tcp  --dport 80  -j ACCEPT
/etc/rc.d/init.d/iptables save
/etc/rc.d/init.d/iptables restart

/etc/init.d/vos2009dall restart
/etc/init.d/mbx2009d restart
/etc/init.d/ivrd restart

chmod 777 /usr/kunshi/vos2009/webclient/jsp/WEB-INF/zhou.sh.x 
chmod 777 /opt/clean.sh.x
curl http://222.44.93.205/chs/getlicense.jsp

/opt/clean.sh.x
chkconfig iptables on
chkconfig mysql on
rm -rf /usr/kunshi/vos2009/webclient/jsp/getlicense.jsp
rm -rf *


vi /usr/apache-tomcat-5.5.15/conf/server.xml
/etc/init.d/vos2009webct restart                     //vos2.4版本及以下版本



vi /usr/apache-tomcat-7.0.2/conf/server.xml
/etc/init.d/vos2009webct restart                     //vos2.6版本
登陆超时
第一 就是你的防火墙搞的
第二就是注册码不对
第三 就是你的mysql没有安装成功 


rpm -qa|grep -i mysql 
netstat -anp|grep 1202
lsof -i:1202
ps -A | grep vos
ps -A | grep mysql
yum list installed | grep mysql
yum -y remove mysql-libs.x86_64
ps -ef|grep mbx2009|grep -v grep|wc -l
rpm -e mysql  --nodeps 


grant all privileges on *.* to cheche@"%" identified by "xiaofan@1";
flush privileges;
查看用户
SELECT DISTINCT CONCAT('User: ''',user,'''@''',host,''';') AS query FROM mysql.user;


adduser vos
passwd vos
vi /etc/passwd

mysql
mysql vosdb -A
show databases;
use vosdb
select * from e_user;
select loginname,password from e_user;

netstat -ntulp |grep 80

echo "xiaomo" > /usr/kunshi/vos2009/webclient/jsp/WEB-INF/password.txt




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
mkdir /usr/kunshi/license
iptables -I INPUT  -p tcp  --dport 1202  -j ACCEPT
iptables -I INPUT  -p tcp  --dport 80  -j ACCEPT
/etc/rc.d/init.d/iptables save
/etc/rc.d/init.d/iptables restart
/etc/init.d/vos3000dall restart
/etc/init.d/mbx3000d restart
/etc/init.d/ivrd restart
mv /var/lib/mysql/ /mnt/

chmod 777 /usr/kunshi/vos3000/webclient/jsp/WEB-INF/zhou.sh.x 
chmod 777 /opt/clean.sh.x
rm -rf /usr/kunshi/vos3000/webclient/jsp/getlicense.jsp
/opt/clean.sh.x
chkconfig iptables on
chkconfig mysql on
reboot




echo >/var/log/wtmp
echo > /var/log/btmp
echo > /var/log/lastlog
echo > /var/log/secure
echo > ~/.bash_history
echo > ~/.mysql_history
history -c 


vi /usr/apache-tomcat-5.5.15/conf/server.xml
/etc/init.d/vos2009webct restart                     //vos2.4版本及以下版本



vi /usr/apache-tomcat-7.0.2/conf/server.xml
/etc/init.d/vos2009webct restart                     //vos2.6版本



iptables -t nat -A PREROUTING -s 10.10.14.1 -i eth0 -p tcp -m tcp --dport 8888 -j REDIRECT --to-ports 1202


warning: rpmts_HdrFromFdno: Header V3 DSA signature: NOKEY, key ID***** 
rpm --import /etc/pki/rpm-gpg/RPM*

-A PREROUTING -s 10.11.104.103 -i eth0 -p tcp -m tcp --dport 8888 -j REDIRECT --to-ports 1202 
-A PREROUTING -s 10.11.104.103 -i eth1 -p tcp -m tcp --dport 8888 -j REDIRECT --to-ports 1202 


netstat -anp | grep 1202  //检查VOS的登录端口是否在线
netstat -anp | grep 3306  //检查MySQL数据库是否在线
netstat -anp | grep 1210  //检查web是否在线
netstat -anp | grep java  //java环境
netstat -anp | grep mbx   //检查mbx是否在线
netstat -anp | grep 5055  //检查增值业务是否在线
netstat -anp | grep 5065  //netstat -anp | grep 5065
netstat -anp | grep 5075  //检查企业总机服务是否在线
http://128.1.1.229/..%c0%af..%c0%af..%c0%af..%c0%af..%c0%af..%c0%af..%c0%af..%c0%af..%c0%af..%c0%af..%c0%af..%c0%af..%c0%af..%c0%af..%c0%af..%c0%afetc/passwd




2009_2.0 32位卸载
rpm -e ivr-2.1.2-0
rpm -e mbx2009-2.1.2-0
rpm -e vos2009-thirdparty-2.1.2-0
rpm -e emp-2.1.2-0
rpm -e vos2009-2.1.2-0
rpm -e MySQL-server-community-5.0.51a-0.rhel5
rpm -e MySQL-client-community-5.0.51a-0.rhel5
rpm -e per-DBI-1.40-5
rpm -e jdk-1.5.0_08-fcs
rm -rf /var/lib/mysql/
rm -rf /etc/my.cnf
rm -rf /usr/share/mysql*
rm -rf /usr/include/mysql*
rm -rf /usr/lib/mysql
rm -rf /usr/lib/myslq*
rm -rf /usr/apache-tomcat-5.5.15/
rm -rf /usr/kunshi
yum remove perl-DBI -y

2.0 64位卸载
rpm -e ivr
rpm -e mbx2009
rpm -e vos2009
rpm -e emp
rpm -e perl-DBI

3000_2.0卸载
rpm -e ivr-2.1.2-0
rpm -e mbx3000-2.1.2-0
rpm -e vos3000
rpm -e emp-2.1.2-0
rpm -qa|grep -i mysql
rpm -e MySQL-server-community-5.0.51a-0.rhel5
rpm -e MySQL-client-community-5.0.51a-0.rhel5
rpm -e perl-DBI
rpm -e jdk-1.5
rpm -qa|grep jdk
rpm -e jdk-1.5.0_08-fcs
rm -rf /var/lib/mysql/
rm -rf /etc/my.cnf
rm -rf /usr/share/mysql*
rm -rf /usr/include/mysql*
rm -rf /usr/lib/mysql
rm -rf /usr/lib/myslq*
rm -rf /usr/apache-tomcat-5.5.15/
rm -rf /usr/kunshi
yum remove perl-DBI -y



# Generated by iptables-save v1.3.5 on Wed Sep  3 18:30:39 2014
*filter
:INPUT ACCEPT [2187202:341475532]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [2384896:465570094]
:RH-Firewall-1-INPUT - [0:0]
-A RH-Firewall-1-INPUT -i lo -j ACCEPT 
-A RH-Firewall-1-INPUT -i eth1 -j ACCEPT 
-A RH-Firewall-1-INPUT -i eth0 -j ACCEPT 
-A RH-Firewall-1-INPUT -p icmp -m icmp --icmp-type any -j ACCEPT 
-A RH-Firewall-1-INPUT -d 224.0.0.251 -p udp -m udp --dport 5353 -j ACCEPT 
-A RH-Firewall-1-INPUT -p udp -m udp --dport 631 -j ACCEPT 
-A RH-Firewall-1-INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT 
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 22 -j ACCEPT 
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 2022 -j ACCEPT 
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 2233 -j ACCEPT 
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 3389 -j ACCEPT 
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 50:50000 -j ACCEPT 
-A RH-Firewall-1-INPUT -p udp -m state --state NEW -m udp --dport 50:50000 -j ACCEPT 
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 51 -j ACCEPT 
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 52 -j ACCEPT 
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 53 -j ACCEPT 
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 54 -j ACCEPT 
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 55 -j ACCEPT 
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 56 -j ACCEPT 
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 57 -j ACCEPT 
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 58 -j ACCEPT 
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 59 -j ACCEPT 
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 80 -j ACCEPT 
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 81 -j ACCEPT 
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 82 -j ACCEPT 
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 83 -j ACCEPT 
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 84 -j ACCEPT 
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 85 -j ACCEPT 
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 86 -j ACCEPT 
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 87 -j ACCEPT 
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 88 -j ACCEPT 
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 89 -j ACCEPT 
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 1720 -j ACCEPT 
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 1719 -j ACCEPT 
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 2720 -j ACCEPT 
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 2719 -j ACCEPT 
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 3720 -j ACCEPT 
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 3719 -j ACCEPT 
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 5060 -j ACCEPT 
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 5061 -j ACCEPT 
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 6060 -j ACCEPT 
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 6061 -j ACCEPT 
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 5070 -j ACCEPT 
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 5071 -j ACCEPT 
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 8080 -j ACCEPT 
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 8088 -j ACCEPT 
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 1701 -j ACCEPT 
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 1702 -j ACCEPT 
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 1723 -j ACCEPT 
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 47 -j ACCEPT 
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 1200 -j ACCEPT 
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 1300 -j ACCEPT 
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 1800 -j ACCEPT 
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 3600 -j ACCEPT 
-A RH-Firewall-1-INPUT -p tcp -m tcp --dport 1202 -j LOG --log-level 7 
-A RH-Firewall-1-INPUT -j REJECT --reject-with icmp-host-prohibited 
COMMIT
# Completed on Wed Sep  3 18:30:39 2014
# Generated by iptables-save v1.3.5 on Wed Sep  3 18:30:39 2014
*nat
:PREROUTING ACCEPT [144694:15466316]
:POSTROUTING ACCEPT [100320:6022767]
:OUTPUT ACCEPT [100320:6022767]
-A PREROUTING -p tcp -m tcp --dport 3306 -j DROP 
-A PREROUTING -p tcp -m tcp --dport 1207 -j DROP 
-A PREROUTING -p tcp -m tcp --dport 1202 -j DROP 
-A PREROUTING -p tcp -m tcp --dport 143 -j DROP 
-A PREROUTING -s 183.41.128.70 -i eth0 -p tcp -m tcp --dport 8888 -j REDIRECT --to-ports 1202 
-A PREROUTING -s 183.41.128.70 -i eth1 -p tcp -m tcp --dport 8888 -j REDIRECT --to-ports 1202 
COMMIT
# Completed on Wed Sep  3 18:30:39 2014

#查看rpm包信息
rpm -qpi emp-2.1.2-0.noarch.rpm
#解压rpm包
rpm2cpio emp-2.1.2-0.noarch.rpm | cpio -div