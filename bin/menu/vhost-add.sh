#!/bin/bash

if [ $# -lt 1 ]; then
	echo "----"
	echo "$0 | Adds 'domain.com' virtual host to apache."
	echo "Usage: $0 domain.com"
	echo "----"
	exit 1
fi
	

domain="$1"
DOCROOT="/var/www/vhosts/${domain}"

             cat > /etc/apache2/sites-available/"${domain}" <<-EOF
             <VirtualHost *:80>
                        ServerName $domain
                        ServerAlias www.$domain
                        ServerAlias direct.$domain                        
                        DocumentRoot ${DOCROOT}
                        <Directory ${DOCROOT}>
                                AllowOverride All
                        </Directory>
		
		        Alias /munin /var/cache/munin/www/
        		<Directory /var/cache/munin/www/>
         			Options +FollowSymLinks
	         		AllowOverride None
			        Order allow,deny
         			Allow from all
       			</Directory>

                        CustomLog /var/log/apache2/$domain-access.log combined
                        ErrorLog /var/log/apache2/$domain-error.log
              </VirtualHost>
	EOF

         mkdir  ${DOCROOT}
         echo "Enabling virtual host..."
         a2ensite $domain > /dev/null 2>&1
         echo "Restarting apache..."         
         sudo /etc/init.d/apache2 restart  > /dev/null 2>&1
	 echo "..done!"