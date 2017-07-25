一、联系昆石公司更换新的授权
更换好新IP后请您将以下信息发送给昆石相关人员，我们将及时为您更换授权（更换IP时vos所有服务都将停止运行）。
原IP：172.16.1.31 用户名：root 密码：*****
新IP：172.16.1.35 用户名：root 密码：*****

二、vos的设置更改
原IP 172.16.1.31 新IP 172.16.1.35 为例做以下说明

1）服务器端操作

/etc/init.d/ivrdiald restart
/etc/init.d/mbx3000d restar
2）客户端操作

登录vos客户端(以直拨回拨为例)
点击【语音服务】->【直拨回拨】->【直拨回拨设备】->【编辑】
修改IVR_SOFTSWITCHIPADDRESS参数（参数说明：软交换地址）
修改IVR_SSAVAILABLEIP参数(参数书名：允许接入IP地址列表, 可使用逗号分隔多个 )
此处原IP 172.16.1.31 修改成新IP 172.16.1.35

修改所有ivr接入号话机的ip地址
点击接入号话机的【话机管理】->【高级配置】->【编辑】->【基本】
IP地址：此处原IP 172.16.1.31 修改成新IP 172.16.1.35

 

附：
如何修改服务器的ip地址，可参考http://www.linknat.com/chs/support/faqs/faq18.html
修改 /etc/sysconfig/network-scripts/ifcfg-eth0 内的配置信息
DEVICE=eth0	#网络设备名称，与ifcfg-eth0对应
BOOTPROTO=static	#启动eth0接口时使用静态IP地址分配
IPADDR=172.16.1.35	#设置IP地址
NETMASK=255.255.255.0	#设置子网掩码
NETWORK=172.16.1.0	#设置网关
ONBOOT=yes	#开机时启动
TYPE=Ethernet	#以太网

修改网关 /etc/sysconfig/network 内GATEWAY的配置信息

NETWORKING=yes
HOSTNAME=vos
GATEWAY=172.16.1.1

重新启动网络配置
/etc/init.d/network restart

 
