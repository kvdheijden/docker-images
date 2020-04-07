FROM php:fpm-alpine3.11

ADD https://raw.githubusercontent.com/mlocati/docker-php-extension-installer/master/install-php-extensions /usr/local/bin/

RUN chmod uga+x /usr/local/bin/install-php-extensions \
 && sync \
 && install-php-extensions pgsql imap intl ldap gd imagick zip pdo_pgsql 
