FROM php:8.1-alpine
MAINTAINER Martin Venuš <martin.venus@gmail.com>

RUN apk --update add git openssh-client tar zlib-dev libzip-dev && \
    docker-php-ext-configure zip && \
    docker-php-ext-install -j$(nproc) zip && \
    php -r "readfile('https://getcomposer.org/installer');" | php -- --install-dir=bin --filename=composer

RUN mkdir -p /root/.ssh && \
    ssh-keyscan github.com >> /root/.ssh/known_hosts

WORKDIR /app

COPY run.sh /

ENTRYPOINT ["/run.sh"]
