vos4.0
查看系统标识码
cat /home/kunshi/vos3000/server/etc/server.conf
#修改mysql密码
update e_user set password='c0c73baafbde78e1c22f1a44e5da636037cc5fcf65859f432b68e910624358d75f9161c54bc3a13058c13ef7cea17caa2bdac369ba10cb9e8d08849297090905' where id=1;
update e_user set password='1e99769964ff33ab9d94dd8530c15be9903211eb7f848899dc6d2d842796ef2768f71148ef297dfcf2c77943a154ad7b7ddb7f4c7d339350ff86e4d918214de3' where id=1;
#修改roos进去mysql的密码
set password for root@localhost = password('xiaofan@1');




运行setup,打开iptables(注意：必须将ssh端口加入白名单，否则会导致连不上服务器) 还有关闭selinux

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