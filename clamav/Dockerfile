FROM alpine:edge

ARG UID=1000
ARG GID=1000

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

RUN set -x \
# Create user and group
 && addgroup -g $GID -S clamav \
 && adduser -S -D -H -u $UID -s /sbin/nologin -G clamav -g clamav clamav \
# Install clamav
 && apk update \
 && apk add --no-cache supervisor clamav clamav-milter clamav-libunrar \
# Entrypoint backwards compatability
 && ln -s usr/local/bin/docker-entrypoint.sh \
# Add diretory for socket
 && mkdir -p /run/clamav \ 
 && chown -R clamav:clamav /run/clamav \
 && chmod -R 0770 /run/clamav

COPY ./supervisord.conf /etc/supervisord.conf

VOLUME /etc/clamav
EXPOSE 7357

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf", "-n"]
