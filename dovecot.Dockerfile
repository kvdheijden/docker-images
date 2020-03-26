FROM alpine:3.11

RUN set -x \
# Install dovecot
 && apk update \
 && apk add --no-cache dovecot

VOLUME /var/spool/mail /etc/dovecot /etc/ssl
EXPOSE 110 143 993 995

CMD ["/usr/sbin/dovecot", "-F" "-c", "/etc/dovecot/dovecot.conf"]
