FROM alpine:3.11

RUN set -x \
# Install postfix
 && apk update \
 && apk add --no-cache postfix

VOLUME /var/spool/mail /etc/postfix /etc/ssl
EXPOSE 25 465 587

CMD ["/usr/sbin/postfix", "-c", "/etc/postfix", "start-fg"]
