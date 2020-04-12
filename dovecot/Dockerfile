FROM alpine:3.11

ARG UID=1000
ARG GID=1000

ARG VUID=5000
ARG VGID=5000

RUN set -x \
# Create user and group
 && addgroup -g $GID -S dovecot \
 && adduser -S -D -H -u $UID -s /sbin/nologin -G dovecot -g dovecot dovecot \
# Create vmail user and group
 && addgroup -g $VGID vmail \
 && adduser -D -h /home/vmail -u $VUID -s /sbin/nologin -G vmail -g vmail vmail \
# Install dovecot
 && apk update \
 && apk add --no-cache dovecot dovecot-pgsql dovecot-lmtpd dovecot-pop3d

VOLUME /home/vmail /etc/dovecot /etc/letsencrypt
EXPOSE 24 110 143 993 995 12345

CMD ["/usr/sbin/dovecot", "-F", "-c", "/etc/dovecot/dovecot.conf"]
