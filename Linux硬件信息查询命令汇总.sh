Linux硬件信息查询命令汇总。

1, 主板信息-查看主板的序列号
使用命令
dmidecode | grep -i 'serial number'
查看板卡信息
cat /proc/pci

2, cpu信息
通过/proc文件系统
1) cat /proc/cpuinfo
通过查看开机信息
2) dmesg | grep -i 'cpu'
3)dmidecode -t processor
3, 硬盘信息
查看分区情况
fdisk -l
查看大小情况
df -h
查看使用情况
du -h
hdparm -I /dev/sda
dmesg | grep sda
查看IDE硬盘信息：sudo hdparm -i /dev/hda
查看SATA硬盘信息 ：sudo hdparm -I /dev/sda 或 sudo blktool /dev/sda id

4, 内存信息
1) cat /proc/meminfo
2) dmesg | grep mem
3) free -m
4) vmstat #Report virtual memory statistics
5) dmidecode | grep -i mem

5, 网卡信息
1) dmesg | grep -i 'eth'
2) cat /etc/sysconfig/hwconf | grep -i eth
3) lspci | grep -i 'eth'

6, 鼠标键盘和USB信息
查看键盘和鼠标：cat /proc/bus/input/devices
查看USB设备：cat /proc/bus/usb/devices
查看各设备的中断请求(IRQ):cat /proc/interrupts

7, 显卡信息
1)lspci |grep -i 'VGA'
2)dmesg | grep -i 'VGA'

8, 声卡信息
1)lspci |grep -i 'VGA'
2)dmesg | grep -i 'VGA'
7, 其他命令
用硬件检测程序kuduz探测新硬件：service kudzu start ( or restart)
dmesg (查看所有启动时检测到的硬件信息)
lspci (显示外设信息, 如usb，网卡等信息)
cat /etc/sysconfig/hwconf
mpstat
查看PCI设备：lspci
查看USB设备：lsusb -v
查看网卡状态：sudo ethtool eth0
查看CPU信息：cat /proc/cpuinfo
显示当前硬件信息：sudo lshw