#!/bin/bash

	if [ $# -ne 2 ]; then
		echo "Usage: $0 username password"
		echo  " "
		exit 1
	fi
	u=$1;
	p=$2;
		mysql -e "use mysql; update user set password = PASSWORD('$p') where user = '$u';FLUSH PRIVILEGES;"
