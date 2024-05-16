FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server

WORKDIR /app

COPY ./tools/handler.sh ./

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY tools/output_file.sql ./

RUN chmod +x ./handler.sh

ENTRYPOINT ["sh", "./handler.sh"]

CMD [ "mysqld" ]
