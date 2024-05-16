FROM debian:buster

RUN apt-get update && apt-get install -y openssl nginx 

RUN mkdir -p /etc/nginx/ssl/private /etc/nginx/ssl/cert

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
    -out /etc/nginx/ssl/cert/ael-mahm.42.fr.pem \
    -keyout /etc/nginx/ssl/private/ael-mahm.42.fr.key \
    -subj "/CN=ael-mahm.42.fr/O=none/OU=none/L=Casablanca/ST=Casablanca-Settat/C=MA"

COPY ./conf/default.conf /etc/nginx/conf.d/default.conf

CMD ["nginx", "-g", "daemon off;"]