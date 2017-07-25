
 市场上面，有太多的人装VOS收费，不管是VOS2009也好，VOS3000也好，各种各样的版本，都给出来了一个标志性语句“防掉线，防攻击”。可是事实上都是一个德性。普遍的作法无外乎下面几种：
1、通过修改防火墙，添加一条转发规则，做一个重定向，在数据包进入到prerouting这张表时，就优先被处理了。
-A PREROUTING -i eth0 -p tcp -m tcp --dport 1111 -j REDIRECT --to-ports 1202 把1111端口重定向到1202，客户端使用1111登陆。

2、通过修改防火墙，添加一条NAT映射规则。
iptables -t nat -I PREROUTING -p tcp --dport 1111  -j DNAT --to 1202
iptables -t nat -I POSTROUTING -p tcp --dport 1111 -j MASQUERADE 把1111端口重定向到1202，客户端使用1111登陆。

3、通过封锁ip，尽量的避免kunshi的ip段。
-A INPUT -s 58.212.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP 
-A INPUT -s 222.45.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP 
-A INPUT -s 222.95.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP 
-A INPUT -s 222.94.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 117.88.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 117.89.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 58.192.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 58.213.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 58.220.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 58.223.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 58.240.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 58.218.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 58.221.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 61.132.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 61.133.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 61.155.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 61.160.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 61.177.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 61.232.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 61.137.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 61.241.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 61.243.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 202.92.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 202.102.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 203.93.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 210.15.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 210.12.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 210.13.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 210.51.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 210.52.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 210.56.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 210.73.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 210.77.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 211.65.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 211.87.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 211.90.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 211.98.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 211.103.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 211.139.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 211.148.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 211.152.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 211.160.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 211.162.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 218.2.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 218.94.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 218.104.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 218.224.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 219.219.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 219.230.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 219.243.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 220.114.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 220.192.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 220.219.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 220.196.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 220.207.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 221.6.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 112.11.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 221.226.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 222.45.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 222.190.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 222.194.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP
-A INPUT -s 121.229.0.0/255.255.0.0 -p tcp -m tcp --dport 1202 -j DROP

4、通过杜绝所有，只允许特殊的ip段进入。例如只允许广东的运营商ip段访问服务器VOS登录port
ip段不一一列举，百度一下 CNNIC 广东ip段就出来了。

5、有一些直接通过，opt下面的port.txt文件来获取登录port，那这个是怎么做到的呢？原理性也是一样。这个涉及到nat功能，具体实现如下
   （1）、对 /etc/nat 文件进行配置，实现通过变量来调取
          etc/..info/opt/port.txt
               portt=`cat /opt/port.txt`
    （2）、下面定义获取到的 值 的调用。直接做一个nat转换，跟 作法2   的情况一样，没什么区别，变了一种情况而已。
          iptables -t nat -I PREROUTING -p tcp --dport $portt -j DNAT --to :1202
               iptables -t nat -I POSTROUTING -p tcp --dport $portt -j MASQUERADE
    （3）、有些人怕别人学会了，索性直接把nat这个文件给加密了，唯我独尊，呵呵。

6、端口改好了，那么下面就来处理被攻击后的恢复。如何恢复呢？一般都是通过mbx脚本检测是否在线，论坛很多，自己下载

7、有些人闲烦，直接我就不检测了，奶奶的，直接给你来一个每分钟启动一次mbx，让你得瑟。因为如果mbx没有掉线，启动mbx是不成功的，所以这种相对  作法6 来说，反而更好，更加有优势一些，作法6  需要执行很多东西，耗机器。命令如下： /etc/init.d/mbx2009d(3000d) start 

说明：由于kunshi的文件里面有vosdb这个账户密码，为了避免攻击，只有修改登陆端口，但是请问修改端口有用吗？
      你修改了端口，kunshi一样会扫描到你的client---server之间的tcp连接port，再攻击你，那不是一样吗？尽管你上面有多么华丽的作法，挨打的现实躲避不了。只是还没扫描到你而已，不要以为自己抵抗力很好，其实你是幸运罢了。
    
建议：1、直接修改VOS的配置文件，把默认1202端口给改成其他的，例如8888.   
         2、修改VOS的相关mysql连接文件，把vosdb账户密码切换成其他的，例如账户密码都是 voippub

呵呵，这个建议有点难度，对他们以后破解vos加大了工程量，嘿嘿，要么就不搞，要么就搞完美一点。请注意，你在搞D版的同时，kunshi也在蠢蠢欲动，不是你一个人在前进，别人也在前进，有攻有守，在所难免。



# Source function library.
. /etc/init.d/functions
    /etc/nat
. /etc/sysconfig/crond
