centos下双网卡双线双IP的配置方法(转)

Linux双网卡双线双IP。
【方法1】
例如：
固定电信和网通IP地址/掩码/网关到网卡:eth0和eth1
eth0配置文件固定：60.29.231.160 255.255.255.192 60.29.231.1（网通IP）
eth1配置文件固定：114.80.66.145 255.255.255.192 114.80.66.1（电信IP）
#vi /etc/iproute2/rt_tables（增加电信和网通两个路由表）
252  tel （电信）
251  cnc （网通）
 
复制代码 代码示例:
#vi /etc/rc.d/rc.local（设置电信和网通路由表内容）
ip route replace default via 114.80.66.1 dev eth1（默认路由线路）
ip route flush table tel  （刷新tel路由表）
ip route add default via 114.80.66.1 dev eth1 src 114.80.66.145 table tel（添加回环地址）
ip rule add from 114.80.66.145 table tel（从114.80.66.145过来的，走tel路由）
ip route flush table cnc
ip route add default via 60.29.231.1 dev eth0 src 60.29.231.160 table cnc
ip rule add from 60.29.231.160 table cnc 保存退出
#reboot（重启）


【方法2】 
例如：
固定电信和网通IP地址/掩码/网关到网卡:eth0和eth1
eth0配置文件固定：60.29.231.160 255.255.255.192 60.29.231.1（网通IP）
eth1配置文件固定：114.80.66.145 255.255.255.192 114.80.66.1（电信IP）

eth1:（电信）
114.80.66.145(IP地址)
255.255.255.192(掩码)
114.80.66.1(网关)

eth0: （网通）
60.29.231.160(IP地址)
255.255.255.192(掩码)
注意：此处不要再设置网通的gateway(网关)

# vi /etc/iproute2/rt_tables
251 cnc (251可以是1-254之间任意，但不能与路由表已有的一样)
 
复制代码 代码示例:
# vi /etc/rc.local
ip route add default via 60.29.231.1 dev eth0 src 60.29.231.160  table cnc
ip rule add from 60.29.231.160 lookup cnc
ip rule add to 60.29.231.160 lookup cnc
# reboot

说明：
因为就2个线路，此方法和上面的方法区别：
电信做主路由，只需新建一个cnc的路由表即可。
推荐使用方法2。

