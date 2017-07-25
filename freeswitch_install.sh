#官网文档安装
rpm -ivh http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
rpm -ivh http://mirror.cedia.org.ec/fedora-epel/6/x86_64/epel-release-6-8.noarch.rpm
yum install git gcc-c++ autoconf automake libtool wget python ncurses-devel zlib-devel libjpeg-devel openssl-devel e2fsprogs-devel sqlite-devel libcurl-devel pcre-devel speex-devel ldns-devel libedit-devel
cd /usr/src
git clone https://freeswitch.org/stash/scm/fs/freeswitch.git
git clone -b v1.4 https://freeswitch.org/stash/scm/fs/freeswitch.git
cd /usr/src/freeswitch
./bootstrap.sh -j
./configure -C
make && make install


make cd-sounds-install
make cd-moh-install
make sounds-install
make moh-install

cd /usr/local
useradd --system --home-dir /usr/local/freeswitch -G daemon freeswitch
passwd -l freeswitch
 
chown -R freeswitch:daemon /usr/local/freeswitch/ 
chmod -R 770 /usr/local/freeswitch/
chmod -R 750 /usr/local/freeswitch/bin/*
 
mkdir /var/run/freeswitch
chown -R freeswitch:daemon  /var/run/freeswitch
 
ln -s /usr/local/freeswitch/bin/freeswitch /usr/bin/ # needed by /etc/init.d/freeswitch