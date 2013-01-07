#!/bin/bash

#RED=`echo -en '\e[31m'`
#YELLOW=`echo -en '\e[91m'`
#COLORA=`echo -e "\033[36;44m"`
#COLORB=`echo -e "\033[37;44m"`
#RESET=`echo -e "\033[37;44m"`
COLORA=`echo -en '\e[36m'`
COLORB=`echo -en '\e[37m'`
RESET=`echo -en '\e[00m'`



if [ $# -lt 1 ]; then
	echo "----"
	echo "$0 | Tails continuously an apache vhost access log file."
	echo "Usage: $0 domain"
	echo "----"
	exit 1
fi
	

domain="$1"
tail -f /var/log/apache2/$domain-access_log | sed -E "s/([0-9]+)/$COLORA\1$RESET/g;s/(\"[^\"]*\")/$COLORB\1$RESET/g"
