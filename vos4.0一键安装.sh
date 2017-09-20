#!/bin/sh
echo "Starting install VOS3000 System"
IP=21k.oss-cn-qingdao-internal.aliyuncs.com/vospag
FILE=vos3000-2.1.4.0.tar.gz
VOS3000_FILE=$FILE
URL=http://$IP/$VOS3000_FILE
echo $URL
OS=`head -n 1 /etc/issue |awk '{ print $3}'`
echo $OS
#检查服务器系统是满足安装VOS要求
check_version()
{
if [ "$OS" -lt 6.0 ]
then
        echo "CentOS version must be 5.x"
        exit 0

fi
}
download_vos()
{
        wget $URL
}
#添加kunshi和kunshiweb用户
add_kunshi_user()
{
        tar -xvzf $FILE
	cd vos4.0/
	sh create_user_kunshi.sh
	sh create_user_kunshiweb.sh	
}
#安装数据库
install_mysql()
{
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
        
	echo -e "\n"
	chkconfig mysqld on
}
#安装tomcat和java环境
java_tomcat_home()
{

	rpm -ivh jdk-6u45-linux-amd64.rpm
	tar zxvf apache-tomcat-7.0.23.tar.gz
	mv apache-tomcat-7.0.23 /home/kunshiweb/base/apache-tomcat
	chmod 777 jrockit-jdk1.6.0_45-R28.2.7-4.1.0-linux-x64.bin
	./jrockit-jdk1.6.0_45-R28.2.7-4.1.0-linux-x64.bin
	cp -r /root/jrockit-jdk1.6.0_45-R28.2.7-4.1.0 /home/kunshi/base/jdk_default
	cp -r /root/jrockit-jdk1.6.0_45-R28.2.7-4.1.0 /home/kunshiweb/base/jdk_default

}
#安装VOS安装包
install_vos()
{
	rpm -ivh vos3000-2.1.4-0.i586.rpm
        rpm -ivh emp-2.1.4-0.noarch.rpm
	rpm -ivh callservice-2.1.4-0.i586.rpm
        rpm -ivh mgc-2.1.4-0.i586.rpm
	rpm -ivh vos3000-web*.rpm
	rpm -ivh mbx3000-2.1.4-0.i586.rpm
	rpm -ivh ivr_dial-2.1.4-0.i586.rpm
	rpm -ivh callcenter-2.1.4-0.i586.rpm
}
#安装话机服务
install_phoneservice()
{
	cd phoneservice/
	cp -r phoneservice /home/kunshi/
	chmod 777 /home/kunshi/phoneservice/bin/phoneservice
	cp -r phoneserviced /etc/init.d/
	chmod 777 /etc/rc.d/init.d/phoneserviced
	chkconfig phoneserviced on
	service phoneserviced restart
}
#获取授权信息
make_license()
{
	cd ..
	PWD=`pwd`
	chmod 777 vos30002140.bin
	mkdir -p /home/kunshi/license
	chmod 777 -R /home/kunshi/license/
	chown kunshi:kunshi -R /home/kunshi/license/
	CRACK_FILE=$PWD/vos30002140.bin
	CRACK_LOG=$PWD/crackvos.log
        $PWD/vos30002140.bin >$PWD/crackvos.log
	JDK_TIME=`sed -n 11p $CRACK_LOG`
	VOS_TIME=`sed -n 9p $CRACK_LOG`
	RPM_TIME=`sed -n 7p $CRACK_LOG`
        IP_ADDRESS=`ifconfig  | grep -v '127.0.0.1' | awk '/inet addr/ {split($2,x,":");print x[2]}'`
        MAC=`ifconfig |grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}'|sed 's|:|-|g'`
	echo -e "\033[40;32mIP_ADDRESS=$IP_ADDRESS\n\033[40;37m"
	echo -e "\033[40;32mMAC=$MAC\n\033[40;37m"
	echo -e "\033[40;32mRPM_TIME=$RPM_TIME\n\033[40;37m"
	echo -e "\033[40;32mVOS_TIME=$VOS_TIME\n\033[40;37m"
	echo -e "\033[40;32mJDK_TIME=$JDK_TIME\n\033[40;37m"	
}
#清除VOS文件和历史记录
erase_vos_file_history()
{
	cd ..
	VOSPWD=`pwd`
	rm -rf $VOSPWD/vos3000-2.1.4.0.tar.gz
	rm -rf $VOSPWD/vos4.0
	#清楚操作记录
	echo >/var/log/wtmp
	echo > /var/log/btmp
	echo > /var/log/lastlog
	echo > /var/log/secure
	echo > ~/.bash_history
	echo > ~/.mysql_history
	echo > /var/log/messages
	history -c 
}
#运行步骤1/2/3...
#check_version
#download_vos
add_kunshi_user
install_mysql
java_tomcat_home
install_vos
install_phoneservice
make_license
#erase_vos_file_history
echo "Congratulation! VOS3000 has been installed successfully!"
echo "Contact me if you want to crack the vos3000 2.1.4.0"
echo -e "\033[45;37;5m My QQ: 85959493 \033[0m"


