#!/bin/bash

HOSTNAME=$(/bin/hostname)
IPADDR=$(ifconfig eth0 |grep inet |head -1 | cut  -d\  -f 12-13|cut -d\: -f2|cut -d\  -f1)
PLATFORM=$(/bin/cat /etc/drupal256/platform)
UPDVER=$(/bin/cat /etc/drupal256/version)
UPTIME=$(uptime |cut -f 1 -d\, |cut -f 4 -d\ ) 
SWAP=$(free|grep Swap|cut -d\  -f14)
TXBW=$(vnstat |grep estimated|head -1|cut -f 2 -d\| | cut -d\  -f5-9)
OSREL=$(tail -1 /etc/lsb-release|cut -d\= -f2)
KERNVER=$(/bin/uname -r|cut -d\- -f1-2)
LATKERN=$(/opt/drupal256/bin/kernel_clean.sh  -i|tail -1|cut -d\  -f3|cut -d\- -f3-4)
OBSKERN=$(/opt/drupal256/bin/kernel_clean.sh  -o|grep linux |wc -l)
APACHEVER=$(/usr/sbin/apache2ctl -v|head -1|cut -f 2 -d\/ |cut -f 1 -d\ )
MYSQLVER=$(mysql -V|cut -f 6 -d\ |cut -f 1 -d,)
PHPVER=$(php5-fpm -v|head -1|cut -f 1 -d\-|cut -f 2 -d\ )
DATE=$(date '+%Y%m%d-%H:%M%:z')

echo 
echo \{ \"ServerName\"\:\"$HOSTNAME\"\, 
echo \  \"IPaddr\"\:\"$IPADDR\"\, 
echo \ 	\"Platform\"\:\"$PLATFORM\"\, 
echo \ 	\"UpdVer\"\:\"$UPDVER\"\, 
echo \ 	\"Uptime\"\:\"$UPTIME\"\,
echo \  \"SwapUsed\"\:\"$SWAP\"\,
echo \ 	\"TXBwidth\"\:\"$TXBW\"\,
echo \  \"OSRelease\"\:$OSREL\,
echo \  \"KernVer\"\:\"$KERNVER\"\, 
echo \  \"LatestKern\"\:\"$LATKERN\"\,
echo \  \"ObsKernels\"\:\"$OBSKERN\"\,
echo \ 	\"ApacheVer\"\:\"$APACHEVER\"\, 
echo \ 	\"MysqlVer\"\:\"$MYSQLVER\"\,
echo \ 	\"PhpVer\"\:\"$PHPVER\"\,
echo \  \"LastUpd\"\:\"$DATE\"
echo \}
