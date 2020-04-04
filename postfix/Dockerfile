FROM alpine:3.11

ARG UID=1000
ARG GID=1000

RUN set -x \
# Create user and group
 && addgroup -g $GID -S postfix \
 && adduser -S -D -H -u $UID -s /sbin/nologin -G postfix -g postfix postfix \
# Install postfix
 && apk update \
 && apk add --no-cache postfix postfix-pgsql

VOLUME /var/spool/mail /etc/postfix /etc/letsencrypt
EXPOSE 25 465 587

CMD ["/usr/sbin/postfix", "-c", "/etc/postfix", "start-fg"]
