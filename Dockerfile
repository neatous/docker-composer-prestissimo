FROM php:7.4-alpine
MAINTAINER Martin Venuš <martin.venus@gmail.com>

RUN apk --update add git tar zlib-dev libzip-dev && \
    docker-php-ext-configure zip && \
    docker-php-ext-install -j$(nproc) zip && \
    php -r "readfile('https://getcomposer.org/installer');" | php -- --install-dir=bin --filename=composer

WORKDIR /app

ENTRYPOINT ["composer"]
