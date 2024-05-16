#!/bin/sh

service mysql start 2> /dev/null;

check_mysql_status_1() {
    while true; do
        mysql_status=$(service mysql status)

        active_status=$(echo "$mysql_status" | grep "/var/run/mysqld/mysqld.sock")

        if [ -n "$active_status" ]; then
            echo "MySQL is running"
            break
        else
            echo "MySQL is not running"
        fi

        sleep 5
    done
}

check_mysql_status_1


if [ ! -d /var/lib/mysql/wordpress ]; then

mysql -u root << EOF

CREATE DATABASE IF NOT EXISTS ${DATABASE_NAME};

CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${USER_PASSWORD}';

GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'%';

FLUSH PRIVILEGES;

EOF

mysql ${DATABASE_NAME} < /app/output_file.sql

fi

service mysql stop 2> /dev/null;
exec "$@"