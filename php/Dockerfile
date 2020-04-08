FROM php:fpm-alpine3.11

ADD https://raw.githubusercontent.com/mlocati/docker-php-extension-installer/master/install-php-extensions /usr/local/bin/

RUN chmod uga+x /usr/local/bin/install-php-extensions \
 && sync \
 && install-php-extensions pgsql imap intl exif ldap gd imagick zip pdo_pgsql \
 && pear install Auth_SASL Net_SMTP Net_IDNA2-0.2.0 Mail_mime Net_LDAP3
