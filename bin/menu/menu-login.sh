#!/usr/bin/pdmenu -c

# version 2012082901
         color:desktop:blue:blue
         color:title:blue:white
         color:base:blue:white
                                
menu:main:Main Menu: (C) 2012/drupal256.com
	 exec:_Apache Web Server Panel::pdmenu -c /opt/drupal256/bin/menu/menu-apache.sh
 	 exec:Mysql _DB Server Panel::pdmenu -c /opt/drupal256/bin/menu/menu-mysql.sh
	 nop
	 exec:_Monitoring Panel::pdmenu -c /opt/drupal256/bin/menu/menu-monitor.sh	 
	 exec:_Date/Time Panel::pdmenu -c /opt/drupal256/bin/menu/menu-date_time.sh
	 nop
	 exec:_Change your SSH password::clear;/usr/bin/passwd
	 nop
	 exit:E_xit
