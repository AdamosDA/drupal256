#!/bin/bash
# Script to update user password in batch mode
# You must be a root user to use this script
# -------------------------------------------------------------------------
# ----------------------------------------------------------------------
# /root is good place to store clear text password
# create file with random password


if [ -z "$(/opt/drupal256/bin/menu/mysql-show_active_dbs.sh)" ];
then echo "Currently there are NO active databases";
else 
for i in $(/opt/drupal256/bin/menu/mysql-show_active_dbs.sh); do
echo "Optimizing tables for database: $i"
echo ""
/usr/bin/mysqlcheck --auto-repair -c -o $i
done
fi
