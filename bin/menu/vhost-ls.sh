#!/bin/bash

VER=$(grep RELEASE /etc/lsb-release |cut -d\= -f2|cut -d\. -f1)

        if [ $VER -gt 13 ]
                then
                	ls /etc/apache2/sites-enabled/ --ignore=default.conf --ignore=default-ssl.conf --ignore=000-default.conf |awk '{print $1}' FS=".conf"
                else
                	ls /etc/apache2/sites-enabled/ --ignore=default --ignore=default-ssl --ignore=000-default
                	
                fi
                

