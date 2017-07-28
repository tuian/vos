#!/bin/sh
echo "Starting install VOS2009 System"
IP=21k.oss-cn-qingdao.aliyuncs.com/vospag
FILE=vos2009_32.tar.gz
VOS2009_FILE=$FILE
URL=http://$IP/$VOS2009_FILE
echo $URL
OS=`head -n 1 /etc/issue |awk '{ print $3}'`
echo $OS
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
        tar -xvzf $FILE
}
install_rpm()
{
        rpm -ivh perl-DBI-1.40-5.i386.rpm --nodeps --force
        rpm -ivh MySQL-server-community-5.0.51a-0.rhel5.i386.rpm --nodeps --force
        rpm -ivh MySQL-client-community-5.0.51a-0.rhel5.i386.rpm --nodeps --force
        rpm -ivh  jdk-1_5_0_08-linux-i586.rpm --nodeps --force
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
        chkconfig --level mysqld 2345 on
}
tar_tomcat()
{
        PWD=`pwd`
        #mv $PWD/apache-tomcat-5.5.15.tar.bz2  /usr
        tar zxvf apache-tomcat-5.5.15.tar.gz -C /usr/
}
java_home()
{
        cp -f $PWD/profile /etc/profile
}
install_vos()
{
        source /etc/profile
        PWD=`pwd`
        rpm -ivh $PWD/emp-2.1.2-0.noarch.rpm
        rpm -ivh $PWD/ivr-2.1.2-0.i586.rpm
        rpm -ivh $PWD/mbx2009-2.1.2-0.i586.rpm
        rpm -ivh $PWD/vos2009-2.1.2-0.i586.rpm
        LIBJVM=/usr/java/jdk1.5.0_08/jre/lib/i386/client/libjvm.so
        ln -s $LIBJVM /lib/libjvm.so
}
make_license()
{
  mkdir -p /usr/kunshi/license
	CRACK_FILE=$PWD/vos20092120.bin
	CRACK_LOG=$PWD/crackvos.log
        $PWD/vos20092120.bin >$PWD/crackvos.log
	JDK_TIME=`sed -n 12p $CRACK_LOG`
	VOS_TIME=`sed -n 10p $CRACK_LOG`
	RPM_TIME=`sed -n 8p $CRACK_LOG`
        IP_ADDRESS=`ifconfig  | grep -v '127.0.0.1' | awk '/inet addr/ {split($2,x,":");print x[2]}'`
        MAC=`ifconfig |grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}'|sed 's|:|-|g'`
	echo "IP_ADDRESS="$IP_ADDRESS
	echo "MAC="$MAC
	echo "JDK_TIME="$JDK_TIME
	echo "VOS_TIME="$VOS_TIME
	echo "RPM_TIME="$RPM_TIME
	rm -rf $CRACK_LOG
	rm -rf $PWD/$FILE
}
check_version
download_vos
install_rpm
tar_tomcat
#java_home
source /etc/profile
install_vos
make_license
echo "Congratulation! VOS2009 has been installed successfully!"
echo "Contact me if you want to crack the vos2009 2.1.2.0"
echo "My QQ: 85959493"
