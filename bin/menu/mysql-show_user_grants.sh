#!/bin/bash

	if [ $# -ne 1 ]; then
		echo "Usage: $0 username"
		echo  " "
		exit 1
	fi
	user=$1;
	 	mysql --skip-column-name -e "show grants for \`$user\`@'localhost'"
