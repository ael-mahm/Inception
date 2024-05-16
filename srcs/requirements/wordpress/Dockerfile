FROM debian:buster

RUN apt-get update && apt-get install -y \
	wget \
    php7.3 \
    php7.3-fpm \
    php7.3-mysql \
    mariadb-client \
    curl            \
    unzip


COPY    ./conf/www.conf /etc/php/7.3/fpm/pool.d

WORKDIR /var/www/html

RUN curl -LO https://wordpress.org/wordpress-6.2.2.zip

WORKDIR /app

COPY    tools/wp-config.php ./
COPY    tools/configure.sh ./
RUN     chmod +x ./configure.sh

ENTRYPOINT ["./configure.sh"]

CMD [ "php-fpm7.3", "--nodaemonize" ]