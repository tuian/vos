#!/bin/bash
CC=`top -b1 -n1 | sed '1,5d' | awk '{if($9>=80.00)print}' | awk '{print $1}' |wc -l`
#列出cpu大于80%的数量(可以根据自己服务器负载设置数值)
if [ $CC -gt 0 ];then
#vos如果超过80%要重启服务,这里以vos3000 2.4为例具体依照自己安装版本为例
/etc/init.d/vos3000dall restart >/dev/null
/etc/init.d/mbx3000d restart >/dev/null
/etc/init.d/ivrd restart >/dev/null
else 
echo `date "+%Y-%m-%d %H:%M:%S"`  "VOS正常" >> /var/log/kill.log
fi




#!/bin/bash
CC=`top -b1 -n1 | sed '1,5d' | awk '{if($9>=80.00)print}' | awk '{print $1}' |wc -l`
#列出cpu大于80%的数量(可以根据自己服务器负载设置数值)
if [ $CC -gt 0 ];then
#vos如果超过80%要重启服务,这里以vos3000 2.4为例具体依照自己安装版本为例
/etc/init.d/vos3000dall restart >/dev/null
/etc/init.d/mbx3000d restart >/dev/null
/etc/init.d/ivrd restart >/dev/null
bash /opt/wexin.sh test test 前方高能预警\\n昆石正在攻击
else
echo `date "+%Y-%m-%d %H:%M:%S"`  "VOS正常" >> /var/log/kill.log
fi

#vos20092.0攻击防范脚本 联系作者QQ85959493