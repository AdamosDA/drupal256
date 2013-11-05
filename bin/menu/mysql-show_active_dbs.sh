#!/bin/bash

DBS=`mysql --skip-column-names -uroot -e "show databases;" |sort`
DBSEXCLUDE="information_schema mysql phpmyadmin"

for EXCLUDE in $DBSEXCLUDE
do
    DBS=`echo $DBS | sed "s/\b$EXCLUDE\b//g"`
done
printf "%s\n" $DBS 
