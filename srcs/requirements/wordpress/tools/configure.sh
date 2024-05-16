#!/bin/bash

if [ ! -d /run/php/ ]; then
    mkdir /run/php/ 2>/dev/null
fi

cd /var/www/html

if [ ! -f /var/www/html/test.sh ]; then 
    unzip  wordpress-6.2.2.zip
    mv wordpress/* .
    rm -rf wordpress
    cp  /app/wp-config.php ./wp-config.php
    sed -i "s/MYSQL_USER/$MYSQL_USER/g" ./wp-config.php && \
    sed -i "s/USER_PASSWORD/$USER_PASSWORD/g" ./wp-config.php && \
    sed -i "s/DATABASE_NAME/$DATABASE_NAME/g" ./wp-config.php && \
    sed -i "s/DATABASE_HOSTNAME/$DATABASE_HOSTNAME/g" ./wp-config.php
    chown -R www-data:www-data *
    touch test.sh
fi
echo "Wordpress is ready"
exec "$@"