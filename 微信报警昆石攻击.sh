##!/bin/bash
#1.创建计划任务
cat <<EOF> /var/spool/cron/root
*/1 * * * * /opt/restartvos.sh
0 0 * * 0 rm -rf /var/log/kill.log
EOF

#2.监控vos攻击
tee  /opt/restartvos.sh <<-'EOF'
#!/bin/bash
CC=`top -b1 -n1 | sed '1,5d' | awk '{if($9>=80.00)print}' | awk '{print $1}' |wc -l`
MBX=`netstat -anlp|grep mbx|wc -l`
AST=`ps -ef|grep asterisk|grep -v grep|wc -l`
FS=`ps -ef|grep freeswitch|grep -v grep|wc -l`
IP=`ifconfig  | grep -v '127.0.0.1' | awk '/inet addr/ {split($2,x,":");print x[2]}'|egrep -v "^10|^172"`
#列出cpu大于80%的数量(可以根据自己服务器负载设置数值)
if [ "$CC" -gt "0" ] || [ "$MBX" -eq "0" ];then
#vos如果超过80%要重启服务,这里以vos2009 2.0为例具体依照自己安装版本为例
/etc/init.d/vos2009dall restart >/dev/null
/etc/init.d/mbx2009d restart >/dev/null
/etc/init.d/ivrd restart >/dev/null
bash /opt/wexin.sh test test 前方高能预警\\n昆石正在攻击
elif [ "$FS" -gt "0" ] || [ "$AST" -gt "0" ];then
bash /opt/wexin.sh test test "$IP\\n可能正在被盗打\\n发出高能警告"
else
echo `date "+%Y-%m-%d %H:%M:%S"`  "VOS正常" >> /var/log/kill.log
fi
EOF

#3.微信报警
tee  /opt/wexin.sh <<-'EOF'
#!/bin/bash
###SCRIPT_NAME:weixin.sh###
###send message from weixin for zabbix monitor###
###wuhf###
###V1-2015-08-25###
 
CropID='微信企业ID'
Secret='群组密钥'
GURL="https://qyapi.weixin.qq.com/cgi-bin/gettoken?corpid=$CropID&corpsecret=$Secret"
Gtoken=$(/usr/bin/curl -s -G "$GURL" | awk -F\" '{print $10}')
 
PURL="https://qyapi.weixin.qq.com/cgi-bin/message/send?access_token=$Gtoken"
function body() {
        local int AppID=1                        #企业号中的应用ID
        local UserID=$1                          #部门成员ID,zabbix中定义微信接受者
        local PartyID=3                          #部门ID,定义了范围,组内成员都可接收到消息
        local Msg=$(echo "$@" | cut -d" " -f3-)  #过滤出zabbix中传递的第三个参数
        printf '{\n'
        printf '\t"touser": "'"$UserID"\"",\n"
        printf '\t"toparty": "'"$PartyID"\"",\n"
        printf '\t"msgtype": "text",\n'
        printf '\t"agentid": "'" $AppID "\"",\n"
        printf '\t"text": {\n'
        printf '\t\t"content": "'"$Msg"\""\n"
        printf '\t},\n'
        printf '\t"safe":"0"\n'
        printf '}\n'
}
 
/usr/bin/curl --data-ascii "$(body $1 $2 $3)" $PURL
EOF
#有问题请联系Myki