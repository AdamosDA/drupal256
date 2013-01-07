#!/usr/bin/pdmenu -c

# version 2012090101


menu:monitor:Mysql Administration panel: Mysql Administration panel  | Press ESC or Q to exit to main menu | (C)2012/drupal256.com
	 exec:Active Mysql Databases:disp:/opt/drupal256/bin/menu/mysql-show_active_dbs.sh
	 exec:Active Mysql Users:disp:/opt/drupal256/bin/menu/mysql-show_active_users.sh
	 group:Show _GRANTS for an Active Mysql User:
	 	exec::makemenu:\
	 	echo "menu:active_users:Select an active user:Select an active user | Press ESC or Q to exit menu"; \
	 	for I in `/opt/drupal256/bin/menu/mysql-show_active_users.sh`; do \
	 	echo "exec:_$I:disp:/opt/drupal256/bin/menu/mysql-show_user_grants.sh $I"; \
	 	done
	 	show:::active_users
	 	remove:::active_users
	 	endgroup
 	 nop
	 exec:_Create a new database and grant ALL privileges for a user:edit:clear;/opt/drupal256/bin/menu/mysql-create_db_user.sh localhost ~Enter the name of the new database:~ ~Enter username for the user (if non-existent, a new user will be created):~ ~Enter password for the user (if user exists, password will be updated):~
	 group:Change _Password for an Active Mysql User:
	 	exec::makemenu:\
	 	echo "menu:active_pusers:Select an active user:Select an active user | Press ESC or Q to exit menu"; \
	 	for I in `/opt/drupal256/bin/menu/mysql-show_active_users.sh`; do \
	 	echo "exec:_$I:edit:/opt/drupal256/bin/menu/mysql-change_user_password.sh $I ~Enter NEW password for user \"$I\":~"; \
	 	done
	 	show:::active_pusers
	 	remove:::active_pusers
	 	endgroup
	 nop
	 exec:Check and _optimize tables for active databases:disp:/opt/drupal256/bin/menu/mysql-optimize_tables.sh
	 nop
	 exec:Current Mysql _Root Password:disp:cat ~drupal256/.my.cnf|tail -3 |head -2 
	 exec:Generate _New Mysql Root Password:disp:sudo /opt/drupal256/bin/init/drupal256-mysql-generate-passwd > /dev/null 2>&1;echo "New credentials generated.";echo "-------------------------- ";cat ~drupal256/.my.cnf|tail -3 |head -2
	 exit:E_xit
