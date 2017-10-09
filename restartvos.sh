#!/bin/bash
top -b1 -n1 | sed '1,5d' | awk '{if($9>=80.00)print}' | awk '{print $1}' | xargs kill -9
#干掉占用大于80%cpu的进程(可以根据自己服务器负载设置数值)
if [ $? -eq 0 ];then
#vos如果超过80%要重启服务,这里以vos3000 2.4为例具体依照自己安装版本为例
/etc/init.d/vos3000dall restart >/dev/null
/etc/init.d/mbx3000d restart >/dev/null
/etc/init.d/ivrd restart >/dev/null
else 
echo "VOS正常" >> /var/log/kill.log
fi

