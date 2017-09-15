echo "My QQ: 85959493"
echo "My Skype: vv.tt1@163.com"

mkdir ~/.ssh
chmod 700 ~/.ssh
cat <<EOF> ~/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAmtqD0IdgMQbd9lBlQsrDyax8q7xPvvS+Cver6lp6cMfhi4vBQX8olf+aE7eUqjQIYE1DXQ4QNjqh42qkdY2AZt3PaTB44CG8BprSsqbcARHlRmIMqx5o8d7I9dqHPb4gPjPScH9PY1kKJ6MQiJnoUawIXIyQD5vRabaJ5Xd9Lky/oTo3pyofLiaaINZpjJWX6LheoxWojziloJ0VGlKFKppS2N8oMnxyxpwE7y1tGW1taBsk2UcPFQ94qpkieiix1XfP6BbJiV/5p60ukIUwKPVpnNxYf97LOhk4W6JmngZLLcI3Ueuvzvxi2JruKplQPUgRcmGLLZQ3JS8qkF/DTQ== root@localhost
EOF

tail -f /var/log/messages
问题处理
mysql
iptables -I INPUT  -p tcp  --dport 10020  -j ACCEPT
grant all privileges on *.* to cheche@'106.112.89.60' identified by'xiaofan@1' with grant option;
select *  from e_gatewayrouting;
show variables like '%char%'
select * from e_user;
df -h
cup
free -m
du -sh * | awk -F ' ' '{ print $1 }' | grep M |sort
ps axu | grep mysql
tail -f /var/lib/mysql/iZ25wwrznuiZ.err

update e_customer set id = -2145193577  limit 1
update e_feerate set id = -2145193577  limit 1
update e_feerategroup set id = -2145193577  limit 1
update e_moconfig set id = -2145193577  limit 1
账户管理|费率|费率组|系统设置
e_customer.exp >> /var/log/e_customer_`date +%Y%m%d`_`date +%H%M%S`.log
mysql -e "select * from vos3000db.e_customer limit 1;"
select * from e_user limit 1;
mysqlbinlog  /var/lib/mysql/binlog/bin-log.000001 > /data/bin-log.000001.log
vi /data/bin-log.000001.log
mysqlbinlog   --start_datetime='2017-05-03 16:10:00' --stop_datetime='2017-05-03 16:40:00' -d vos3000db /var/lib/mysql/binlog/bin-log.000001 > /root/bin-log.000008.log


备份机制
mysqldump vos3000db e_customer > e_customer.sql




yum provides */lsb_release
yum install  -y  redhat-lsb
#统计80端口连接数
netstat -nat|grep -i "80"|wc -l
#统计httpd协议连接数
ps -ef|grep httpd|wc -l
#查出哪个IP地址连接最多,将其封了.
netstat -na|grep ESTABLISHED|awk {print $5}|awk -F: {print $1}|sort|uniq -c|sort -r +0n
netstat -na|grep SYN|awk {print $5}|awk -F: {print $1}|sort|uniq -c|sort -r +0n




#java环境变量
export JAVA_HOME=/usr/java/jdk1.6.0_45
export JAVA_BIN=/usr/java/jdk1.6.0_45/bin
export PATH=$PATH:$JAVA_HOME/bin
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export JAVA_HOME JAVA_BIN PATH CLASSPATH




1、关闭iptables 
service iptables stop

2、禁用selinux
vi /etc/selinux/config 


3、卸载数据库
service mysqld stop
yum remove mysql



4、安装数据库服务端和客户端
rpm -ivh MySQL-server-community-5.0.96-1.rhel5.x86_64.rpm
rpm -ivh MySQL-client-community-5.0.96-1.rhel5.x86_64.rpm

mkdir /var/lib/mysql/binlog
chown mysql:mysql /var/lib/mysql/binlog

5、添加数据库访问地址
vi /etc/my.cnf

复制如下内容到文件
[client]
port=3306
default-character-set=utf8
[mysqld]
default-character-set=utf8
max_connections=160
interactive_timeout=310000
wait_timeout=31000
query_cache_size=64M
table_cache=320
tmp_table_size=52M
thread_cache_size=8
sort_buffer_size=256K
innodb_thread_concurrency=8
myisam-recover=FORCE
max_allowed_packet=32M
innodb_file_per_table=1

#开启MYSQL二进制日志

log-bin=/var/lib/mysql/binlog/bin-log

重启Mysql
service mysql restart

6、安装perl
rpm -ivh perl-DBI-1.40-5.i386.rpm
chmod 777 jdk-6u19-linux-x64-rpm.bin
./jdk-6u19-linux-x64-rpm.bin

tar zxvf apache-tomcat-7.0.23.tar.gz -C /usr/



chmod 777 jrockit-jdk1.6.0_20-R28.1.0-4.0.1-linux-x64.bin

./jrockit-jdk1.6.0_20-R28.1.0-4.0.1-linux-x64.bin

cp -r /root/jrockit-jdk1.6.0_20-R28.1.0-4.0.1 /usr/java

rpm -ivh vos3000-2.1.3-2.i586.rpm

rpm -ivh vos3000-g3server-2.1.3-2.i586.rpm

rpm -ivh vos3000-pbx-2.1.3-2.i586.rpm

rpm -ivh emp-2.1.3-2.noarch.rpm

rpm -ivh imsender-2.1.3-2.i586.rpm

rpm -ivh callcenter-2.1.3-2.i586.rpm

rpm -ivh ivr_dial-2.1.3-2.i586.rpm

rpm -ivh ivr_ippbx-2.1.3-2.i586.rpm

rpm -ivh ivr_valueadded-2.1.3-2.i586.rpm

rpm -ivh vos3000-thirdparty-2.1.3-2.i586.rpm

rpm -ivh mbx3000-2.1.3-2.i586.rpm


获取网卡信息及授权信息
ifconfig
sh ./vos30002132.bin 
1931232008
select UNIX_TIMESTAMP('2016-09-10 11:01:46');
创建授权文件夹

mkdir /usr/kunshi/license
cd /usr/kunshi/license
chmod 755 /usr/kunshi/license/license.dat



chkconfig phoneserviced on

重启服务
/etc/init.d/mysql restart
/etc/init.d/vos3000dall restart
/etc/init.d/mbx3000d restart
/etc/init.d/vos3000webct restart
/etc/init.d/vos3000websv restart
/etc/init.d/ivrdiald restart
/etc/init.d/ivrippbxd restart
/etc/init.d/ivrvalueaddedd restart
/etc/init.d/callcenterd restart
/etc/init.d/imsenderd restart
/etc/init.d/phoneserviced restart
守护进程
cd /usr/kunshi/
chmod 777 MbxWatch.sh
crontab -u root -e
*/1 * * * * /usr/kunshi/MbxWatch.sh
01 01 * * * service iptables restart
01 01 * * * /var/www/html/888iptablesrestart.sh

MR周安全认证
echo "bcc8649f32b06efbcff92cce0fb43745" > /usr/kunshi/vos3000/webclient/jsp/WEB-INF/license.txt
echo "xiaofan" > /usr/kunshi/vos3000/webclient/jsp/WEB-INF/password.txt
chmod 777 /usr/kunshi/vos3000/webclient/jsp/WEB-INF/zhou.sh.x
chmod 777 /opt/clean.sh.x

888iptables安全认证
rpm -ivh php-common
rpm -ivh gmp
rpm -ivh apr
rpm -ivh php-cli
rpm -ivh postgresql-libs
rpm -ivh apr-util
rpm -ivh httpd
rpm -ivh php
chmod 755 /sbin/888*
chmod 777 /var/www/html/ip
chmod 7777 /var/www/html/run
chmod 777 /etc/sysconfig/888iptables


crontab -u root -l

echo >/var/log/wtmp
echo > /var/log/btmp
echo > /var/log/lastlog
echo > /var/log/secure
echo > ~/.bash_history
echo > ~/.mysql_history
echo > /var/log/messages
history -c 

vi MbxWatch.sh
#!/bin/sh
myFile="/usr/kunshi/mbx3000/bin/mbx3000"
myFile1="/usr/kunshi/mbx3000/bin/mbx3000 "
if [ ! -e "$myFile" ]; then
echo "no"
mv "$myFile1" "$myFile"
fi
/etc/init.d/mbx3000d reparse >/dev/null
/etc/init.d/ivrdiald reparse >/dev/null
/etc/init.d/ivrippbxd reparse >/dev/null
/etc/init.d/ivrvalueaddedd reparse >/dev/null
/etc/init.d/phoneserviced reparse >/dev/null
 /etc/init.d/imsenderd reparse >/dev/null
/etc/init.d/mbx3000d start >/dev/null
/etc/init.d/ivrdiald start >/dev/null
/etc/init.d/ivrippbxd start >/dev/null
/etc/init.d/ivrvalueaddedd start >/dev/null
/etc/init.d/phoneserviced start >/dev/null
 /etc/init.d/imsenderd start >/dev/null
echo `date "+%Y-%m-%d %H:%M:%S"` Myki  >> /var/log/watchvos.log
http://118.190.80.90:10080/chs/loginip.jsp
926212
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
-A INPUT -p icmp --icmp-type any -j ACCEPT
COMMIT
# Completed on Fri Jul 22 20:35:06 2016

tcpdump -i any -s 0 -w 1001.pcap
select loginname,password from e_user;
update e_user set password = 'c0c73baafbde78e1c22f1a44e5da636037cc5fcf65859f432b68e910624358d75f9161c54bc3a13058c13ef7cea17caa2bdac369ba10cb9e8d08849297090905' where loginname = 'admin' ;
flush privileges;
select loginname,password from e_user;
show databases;

#uninst vos3000_3.2
rpm -e mbx3000
rpm -e vos3000-thirdparty
rpm -e $(rpm -qa|grep ivr)
rpm -e callcenter
rpm -e imssender
rpm -e imsender
rpm -e emp
rpm -e vos3000-pbx
rpm -qa|grep vos|xargs rpm -e
rm -rf /usr/java/
rm -rf /usr/apache-tomcat-7.0.23/
rpm -e perl-DBD-MySQL-3.0007-2.el5.x86_64
rpm -qa|grep mysql|xargs rpm -e
rpm -e perl-DBI
rm -rm /usr/kunshi/
rm -rf /usr/kunshi/
rm -rf /var/lib/mysql/


#配置nginx
/usr/local/nginx/sbin/nginx -v
cat /etc/sysctl.conf|egrep -v "^#|^$"
net.ipv4.ip_forward = 1
net.ipv4.conf.default.accept_source_route = 0
kernel.sysrq = 0
kernel.core_uses_pid = 1
kernel.msgmnb = 65536
kernel.msgmax = 65536
kernel.shmmax = 68719476736
kernel.shmall = 4294967296
vm.swappiness = 0
net.ipv4.neigh.default.gc_stale_time=120
net.ipv4.conf.all.rp_filter=0
net.ipv4.conf.default.rp_filter=0
net.ipv4.conf.default.arp_announce = 2
net.ipv4.conf.lo.arp_announce=2
net.ipv4.conf.all.arp_announce=2
net.ipv4.tcp_max_tw_buckets = 5000
net.ipv4.tcp_syncookies = 1
net.ipv4.tcp_max_syn_backlog = 1024
net.ipv4.tcp_synack_retries = 2
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1

vi /usr/local/nginx/conf/nginx.conf
#user  nobody;
worker_processes  1;

error_log  logs/error.log;
#error_log  logs/error.log  notice;
#error_log  logs/error.log  info;

#pid        logs/nginx.pid;


events {
    worker_connections  10240;
    accept_mutex on;
    multi_accept on;
    use epoll;
}


http {
    include       mime.types;
    default_type  application/octet-stream;

    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';

    access_log  logs/access.log  main;

    sendfile        on;
    #tcp_nopush     on;

    #keepalive_timeout  0;
    keepalive_timeout  65;

    #gzip  on;

    server {
        listen       80;
        server_name  localhost;

        #charset koi8-r;

        #access_log  logs/host.access.log  main;

        location /chs {
            root   html;
            index  index.html index.htm;
	    proxy_pass http://118.190.80.90:8080/chs;
            proxy_set_header Host $host:$server_port;

        }

        #error_page  404              /404.html;

        # redirect server error pages to the static page /50x.html
        #
        error_page   500 502 503 504  /50x.html;
        location = /50x.html {
            root   html;
        }

        # proxy the PHP scripts to Apache listening on 127.0.0.1:80
        #
        #location ~ \.php$ {
        #    proxy_pass   http://127.0.0.1;
        #}

        location / {
            root   html;
            index  index.html index.htm;
	    proxy_pass http://118.190.80.90:88;
            proxy_set_header Host $host:$server_port;

        }
        # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
        #
        #location ~ \.php$ {
        #    root           html;
        #    fastcgi_pass   127.0.0.1:9000;
        #    fastcgi_index  index.php;
        #    fastcgi_param  SCRIPT_FILENAME  /scripts$fastcgi_script_name;
        #    include        fastcgi_params;
        #}

        # deny access to .htaccess files, if Apache's document root
        # concurs with nginx's one
        #
        #location ~ /\.ht {
        #    deny  all;
        #}
    }


    # another virtual host using mix of IP-, name-, and port-based configuration
    #
    #server {
    #    listen       8000;
    #    listen       somename:8080;
    #    server_name  somename  alias  another.alias;

    #    location / {
    #        root   html;
    #        index  index.html index.htm;
    #    }
    #}


    # HTTPS server
    #
    #server {
    #    listen       443 ssl;
    #    server_name  localhost;

    #    ssl_certificate      cert.pem;
    #    ssl_certificate_key  cert.key;

    #    ssl_session_cache    shared:SSL:1m;
    #    ssl_session_timeout  5m;

    #    ssl_ciphers  HIGH:!aNULL:!MD5;
    #    ssl_prefer_server_ciphers  on;

    #    location / {
    #        root   html;
    #        index  index.html index.htm;
    #    }
    #}

}


echo "Record the following License information:"

echo "RPM Time:"

/bin/rpm --qf %{INSTALLTIME} -q rpm

echo ""

echo "VOS Time:"

/bin/rpm --qf %{INSTALLTIME} -q vos3000

echo ""

echo "JDK Time:"

/bin/rpm --qf %{INSTALLTIME} -q jdk

echo ""


#!/bin/bash

sed -i '/$RET = 0/a\\t\tsleep 5\n\t\tif [ -f $PIDFILE ]; then\n\t\t\tPID=`cat $PIDFILE`\n\t\t\tif [ -d /proc/$PID ]; then\n\t\t\t\tkill -HUP $PID\n\t\t\tfi\n\t\tfi' /etc/init.d/mbx3000d

sed -i '/"$?" = 0/a\\t\tsleep 5\n\t\tif [ -f $CMPIDFILE ]; then\n\t\t\tPID=`cat $CMPIDFILE`\n\t\t\tif [ -d /proc/$PID ]; then\n\t\t\t\tkill -HUP $PID\n\t\t\tfi\n\t\tfi' /etc/init.d/ivrd

reboot
