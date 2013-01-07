#!/usr/bin/pdmenu -c

# version 2012102701


menu:apache:Apache Control Panel:Apache administration panel | Press ESC or Q to exit to main menu | (C)2012/drupal256.com
	exec:_Active Virtual Hosts:disp:if [ -z "$(/usr/local/bin/menu/vhost-ls.sh)" ]; then echo "Currently there are NO active virtual hosts";else /usr/local/bin/menu/vhost-ls.sh;fi
	nop
	exec:Add _New Virtual Host:edit:clear;/usr/local/bin/menu/vhost-add.sh ~Enter domain name (Example\: domain.com):~	
	group:_Delete an Active Virtual Host
           exec::makemenu: \
           echo "menu:dvhosts:Select a Virtual Host to Delete:Select a virtual host | Press ESC or Q to exit menu"; \
            for I in `/usr/local/bin/menu/vhost-ls.sh `; do \
         echo "exec:_$I:disp:/usr/local/bin/menu/vhost-del.sh $I"; \
	 done
	 nop
         show:::dvhosts
         remove:::dvhosts
         endgroup
         group:_Monitor access log for an Active Virtual Host
           exec::makemenu: \
           echo "menu:mvhosts:Select an active Virtual Host:Select a virtual host | Press ESC or Q to exit menu"; \
            for I in `/usr/local/bin/menu/vhost-ls.sh `; do \
         echo "exec:_$I::clear;sudo /usr/local/bin/menu/vhost-log_tail.sh $I"; \
        done
         show:::mvhosts
         remove:::mvhosts
         endgroup
	 nop
	 exec:Apache server stat_us:display:sudo /etc/init.d/apache2 status
	 exec:_Restart Apache server:disp:sudo /etc/init.d/apache2 restart	
	 exec:_Start Apache server:disp:sudo /etc/init.d/apache2 start
	 exec:S_top Apache server:disp:sudo /etc/init.d/apache2 stop
	 nop
	 exec:_Enable Munin HTTP Password Protection:edit:sudo chattr -i /home/drupal256/.munin.htpasswd /home/drupal256/.munin.htaccess;clear;htpasswd -b -c /home/drupal256/.munin.htpasswd drupal256 ~Enter password for user 'drupal256':~;sed -i "s/#Require/Require/g" /home/drupal256/.munin.htaccess;sudo chattr +i /home/drupal256/.munin.htpasswd /home/drupal256/.munin.htaccess
 	 exec:_Disable Munin HTTP Password Protection:disp:sudo chattr -i /home/drupal256/.munin.htpasswd /home/drupal256/.munin.htaccess;cat /dev/null > /home/drupal256/.munin.htpasswd;sed -i "s/Require/#Require/g" /home/drupal256/.munin.htaccess;sudo chattr +i /home/drupal256/.munin.htpasswd /home/drupal256/.munin.htaccess;echo "Password disabled."
	 nop
	 exec:_Version:disp:apache2 -V
	 exit:E_xit
