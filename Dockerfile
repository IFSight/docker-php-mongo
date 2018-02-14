FROM fulcrum/php:latest-alpine
MAINTAINER IF Fulcrum "fulcrum@ifsight.net"

RUN apk add --no-cache php5-pear php5-xml autoconf openssl-dev g++ make php5-dev && \
    sed -i "$ s|\-n||g" /usr/bin/pecl && \
    printf "\n" | pecl install mongo && \
    echo "extension=mongo.so" > /etc/php5/conf.d/mongo.ini && \
    apk del --purge php5-pear autoconf openssl-dev g++ make php5-dev
