#!/bin/bash
if [ $# -lt 1 ]; then
	echo "----"
	echo "$0 | Removes an apache vhost log files."
	echo "Usage: $0 domain"
	echo "----"
	exit 1
fi
	

domain="$1"
/bin/rm /var/log/apache2/"${domain}"-access.log* > /dev/null 2>&1
/bin/rm /var/log/apache2/"${domain}"-error.log* > /dev/null 2>&1
/bin/rm /var/log/apache2/"${domain}"-access_log* > /dev/null 2>&1
/bin/rm /var/log/apache2/"${domain}"-error_log* > /dev/null 2>&1
