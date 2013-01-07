#!/bin/bash
       	if [ $# -ne 4 ]; then
                        echo "Usage: $0  host db_name username password"
                        exit 1
       	fi
        CREATE_DB="CREATE DATABASE IF NOT EXISTS \`${2}\`;"
        CREATE_DB_USER="GRANT ALL PRIVILEGES ON \`${2}\`.* TO \`${3}\`@'${1}' IDENTIFIED BY '${4}';"
        SQL="${CREATE_DB}${CREATE_DB_USER}"
        mysql -e "$SQL"
        echo "${2} created successfully."
                                                                                                