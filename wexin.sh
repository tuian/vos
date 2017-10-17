#!/bin/bash
###SCRIPT_NAME:weixin.sh###
###send message from weixin for zabbix monitor###
###wuhf###
###V1-2015-08-25###
 
CropID='wx56adfb85d5e007e6'
Secret='WzZ1c2PYIYMUvpvFXZOfveNN17X9uhDmVUMz8O08st5nEQT50y_tNemVjuBs0sq7'
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
