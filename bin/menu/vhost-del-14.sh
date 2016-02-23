#!/bin/bash

if [ $# -lt 1 ]; then
	echo "----"
	echo "$0 | Deletes 'domain.com' virtual host to apache (ubuntu 14)."
	echo "Usage: $0 domain.com"
	echo "----"
	exit 1
fi
	

domain="$1"
DOCROOT="/var/www/vhosts/${domain}"
VER=$(grep RELEASE /etc/lsb-release |cut -d\= -f2|cut -d\. -f1)

        if [ $VER -gt 13 ]
                then
	                 rm  /etc/apache2/sites-available/"${domain}.conf"
                 else
                 	rm  /etc/apache2/sites-available/"${domain}"
                 fi
              
         rmdir ${DOCROOT}
         echo "Disabling virtual host..."	 
         a2dissite $domain > /dev/null 2>&1
         echo "Restarting apache..."                  
         /etc/init.d/apache2 restart  > /dev/null 2>&1
	 sudo /opt/drupal256/bin/menu/vhost-log_delete.sh $domain
         echo "Success!"                                                      	 
         echo "Note: Virtual host directory was not removed, if not empty. Please remove manually (sftp)."                                                      	 
	 echo "*** Please EXIT to MAIN MENU to reload active virtual host list  ***"                                                      	          
	 echo " "                                                      	 