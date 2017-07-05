#!/bin/sh
echo "Starting install VOS3000 System"
IP=www.kazoo.com.cn
FILE=vos3000.2.1.2.0.tar.gz
VOS2009_FILE=vos2009/$FILE
URL=http://$IP/$VOS2009_FILE
echo $URL
OS=`head -n 1 /etc/issue |awk '{ print $3}'`
echo $OS
check_version()
{
if [ "$OS" != 5.5 ]
then
echo "CentOS version must be 5.5"
        exit 0
fi
}
yum_install()
{
        yum -y install xulrunner.i686 libXtst.i686 glibc.i686 glibc-devel.i686
}
download_vos()
{
        wget $URL
        tar -xvzf $FILE
}
install_rpm()
{
        rpm -ivh jdk.i586.rpm
        rpm -ivh MySQL-server-community-5.0.51a-0.rhel5.i386.rpm --nodeps --force
        rpm -ivh MySQL-client-community-5.0.51a-0.rhel5.i386.rpm --nodeps --force
        rpm -ivh perl-DBI-1.40-5.i386.rpm --nodeps --force
        mysql -uroot -e 'create database vos3000db DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;'
}
tar_tomcat()
{
        PWD=`pwd`
        mv $PWD/apache-tomcat-5.5.15.tar.bz2 /usr
        tar -xvjf /usr/apache-tomcat-5.5.15.tar.bz2 -C /usr
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
        IP_ADDRESS=`ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1}'`
        MAC=`ifconfig | grep 'HWaddr'|cut -d: -f3`-`ifconfig | grep 'HWaddr'|cut -d: -f3`-`ifconfig | grep 'HWaddr'|cut -d: -f4`-`ifconfig | grep 'HWaddr'|cut -d: -f5`-`ifconfig | grep 'HWaddr'|cut -d: -f6`-`ifconfig | grep 'HWaddr'|cut -d: -f7`
echo "IP_ADDRESS="$IP_ADDRESS
echo "MAC="$MAC
echo "JDK_TIME="$JDK_TIME
echo "VOS_TIME="$VOS_TIME
echo "RPM_TIME="$RPM_TIME
rm -rf $CRACK_LOG
rm -rf $PWD/$FILE
}
check_version
yum_install
download_vos
install_rpm
tar_tomcat
java_home
source /etc/profile
install_vos
make_license
echo " Congratulation! VOS2009 has been installed successfully!"
