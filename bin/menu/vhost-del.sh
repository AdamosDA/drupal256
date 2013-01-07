#!/bin/bash

if [ $# -lt 1 ]; then
	echo "----"
	echo "$0 | Deletes 'domain.com' virtual host to apache."
	echo "Usage: $0 domain.com"
	echo "----"
	exit 1
fi
	

domain="$1"
DOCROOT="/var/www/vhosts/${domain}"

   	 rm  /etc/apache2/sites-available/"${domain}"
         rmdir ${DOCROOT}
         echo "Disabling virtual host..."	 
         a2dissite $domain > /dev/null 2>&1
         echo "Restarting apache..."                  
         /etc/init.d/apache2 restart  > /dev/null 2>&1
	 sudo /opt/drupal256/bin/menu/vhost-log_delete.sh $domain
         echo "Success!"                                                      	 
         echo " "                                                      	 
	 echo "*** Please EXIT to MAIN MENU to reload active virtual host list  ***"                                                      	          
	 echo " "                                                      	 