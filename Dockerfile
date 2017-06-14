FROM php:7.1-alpine
MAINTAINER Martin Venuš <martin.venus@gmail.com>

RUN apk --update add tar git zip && \
    docker-php-ext-install zip && \
    php -r "readfile('https://getcomposer.org/installer');" | php -- --install-dir=bin --filename=composer && \
    composer global require hirak/prestissimo

WORKDIR /app

ENTRYPOINT ["composer"]
