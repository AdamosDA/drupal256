#!/bin/bash

USERS=`mysql --skip-column-names -uroot -e "use mysql;select user from user;" |sort|uniq`
USERSEXCLUDE="debian-sys-maint phpmyadmin zenoss root"

for EXCLUDE in $USERSEXCLUDE
do
    USERS=`echo $USERS | sed "s/\b$EXCLUDE\b//g"`
done
printf "%s\n" $USERS 
