#!/usr/bin/pdmenu -c

# version 2012082901


menu:monitor:Server Monitoring panel: Server Monitoring panel  | Press ESC or Q to exit to main menu | (C)2012/drupal256.com
	 exec:_Hostname:display:/bin/hostname
	 exec:_Users Online:disp:uptime;who	 
	 exec:_OS Version:truncate:lsb_release -d	 
	 nop
	 exec:System _Load::clear;echo "Use CTRL-C to QUIT";/usr/bin/ttyload  2>/dev/null
	 exec:System _Performance::htop	
	 nop
	 exec:_Filesystems Status:truncate:df -l -h
	 exec:Top 50 _Big Files Uploaded:truncate:find /var/www/vhosts -type f -printf "%s %h/%f\n" | sort -rn -k1 | head -n 50 | awk '{ print $1/1048576 "MB" " " $2}'
	 nop
	 exec:_Network Interfaces:disp:/sbin/ifconfig | awk '/^eth/ { printf("%s\t",$1) } /inet addr:/ { gsub(/.*:/,"",$2); if ($2 !~ /^127/) print $2; }'
	 exec:_Active Connections:disp:/opt/drupal256/bin/menu/connections.sh
	 nop
	 exit:E_xit
