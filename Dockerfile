FROM php:7-apache
LABEL maintainer="jean-francois@frebourg.com"
RUN docker-php-source extract && \
    apt-get update && \
    apt-get install libldap2-dev -y && \
    apt-get install locales-all -y && \
    docker-php-ext-install mysqli && \
    docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ && \    
    docker-php-ext-install ldap &&  \
    docker-php-source delete
COPY *.zip /var/www/html
#COPY html /var/www/html
#COPY conf /var/www/html/include
#COPY php.ini /usr/local/etc/php

