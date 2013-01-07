#!/usr/bin/pdmenu -c

# version 2012082901

menu:date_menu:Date & Time Panel: Date & Time administration panel  | Press ESC or Q to exit to main menu | (C)2012/drupal256.com
	 exec:_Date & time:disp:date
         exec:_Timezone:disp:cat /etc/timezone
         exec:_Edit timezone::clear;sudo /usr/sbin/dpkg-reconfigure tzdata
      	 exit:E_xit
