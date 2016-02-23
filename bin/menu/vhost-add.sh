#!/bin/bash
# use for ubuntu 14
if [ $# -lt 1 ]; then
	echo "----"
	echo "$0 | Adds 'domain.com' virtual host to apache (ubuntu 14)."
	echo "Usage: $0 domain.com"
	echo "----"
	exit 1
fi
	

domain="$1"
DOCROOT="/var/www/vhosts/${domain}"
VER=$(grep RELEASE /etc/lsb-release |cut -d\= -f2|cut -d\. -f1)
		
	if [ $VER -gt 13 ]
	then
             cat > /etc/apache2/sites-available/"${domain}.conf" <<-EOF
             <VirtualHost *:80>
                        ServerName $domain
                        ServerAlias www.$domain
                        ServerAlias direct.$domain                        
                        DocumentRoot ${DOCROOT}
                        <Directory ${DOCROOT}>
                                AllowOverride All
                        </Directory>
                        CustomLog /var/log/apache2/$domain-access.log combined
                        ErrorLog /var/log/apache2/$domain-error.log
              </VirtualHost>
	EOF



        else
             cat > /etc/apache2/sites-available/"${domain}" <<-EOF
             <VirtualHost *:80>
                        ServerName $domain
                        ServerAlias www.$domain
                        ServerAlias direct.$domain                        
                        DocumentRoot ${DOCROOT}
                        <Directory ${DOCROOT}>
                                AllowOverride All
                        </Directory>
                        CustomLog /var/log/apache2/$domain-access.log combined
                        ErrorLog /var/log/apache2/$domain-error.log
              </VirtualHost>
	EOF
             
        fi



         mkdir  ${DOCROOT}
         echo "Enabling virtual host..."
         a2ensite $domain > /dev/null 2>&1
         echo "Restarting apache..."         
         sudo /etc/init.d/apache2 restart  > /dev/null 2>&1
	 echo "..done!"