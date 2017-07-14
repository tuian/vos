#!/bin/bash
wget http://21k.oss-cn-qingdao.aliyuncs.com/vospag/vossafe.tar.gz
tar -zxvf vossafe.tar.gz
sync
cd 5.11yum/
mkdir /etc/yum.repos.d/yumbak
mv /etc/yum.repos.d/*.repo /etc/yum.repos.d/yumbak/
mv *.repo /etc/yum.repos.d/
mv RPM-* /etc/pki/rpm-gpg/
yum clean all
yum makecache
cd ..
mv html/ /opt/
cd vossafe/
yes|mv httpd.conf /etc/httpd/conf/httpd.conf
yes|mv sudoers /etc/sudoers
yes|mv iptables /etc/sysconfig/iptables
yes|mv libcap.so /home/kunshi/vos3000/server/lib/lib/libcap.so
yes|mv vos3000d /etc/init.d/vos3000d
yes|mv vos3000webct /etc/init.d/vos3000webct
