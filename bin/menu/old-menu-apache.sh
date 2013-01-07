#!/usr/bin/pdmenu -c

# version 2012082901


menu:apache:Apache:Apache administration panel | Press ESC or Q to exit to main menu
	exec:Add _New Virtual Host:edit:clear;/usr/local/bin/menu/add-vhost.sh ~Enter domain name (Example\: domain.com):~
	nop
	group:_Active Virtual Hosts...
           exec::makemenu: \
           echo "menu:make_svcs:Virtual Hosts:Select a virtual host | Press ESC or Q to exit menu"; \
            for I in `/usr/local/bin/menu/ls-vhosts.sh `; do \
         echo "exec:_$I::export SERVICE=$I; pdmenu -c /usr/local/bin/menu/menu-apache.sh  --menu=services"; \
        done
         show:::make_svcs
         remove:::make_svcs
         endgroup
	 nop
	 exec:_Display Apache server status:display:sudo /etc/init.d/apache2 status
	 exec:_Restart Apache server:disp:sudo /etc/init.d/apache2 restart	
	 exec:_Start Apache server:disp:sudo /etc/init.d/apache2 start
	 exec:S_top Apache server:disp:sudo /etc/init.d/apache2 stop
	 nop
	 exec:_Version:disp:apache2 -V
	 exec:_Pid:disp:echo $PPID
	 nop
	 exit:E_xit
preproc:echo "menu:services:$SERVICE:Select"
        exec:_Monitor access log::clear;/usr/local/bin/menu/colortail.sh /var/log/apache2/$SERVICE-access_log
        exec:_Display config:disp:cat /etc/apache2/sites-available/$SERVICE
	nop
        exec:_Delete Virtual host:pause:clear;/usr/local/bin/menu/del-vhost.sh $SERVICE;kill `pgrep -o menu-apache.sh`;/usr/local/bin/menu/menu-apache.sh
        exec:_Pid:disp:echo $PPID
        nop
        exit:E_xit