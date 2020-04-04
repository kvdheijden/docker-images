FROM alpine:3.11

ARG UID=1000
ARG GID=1000

RUN set -x \
# Create user and group
 && addgroup -g $GID -S rspamd \
 && adduser -S -D -H -u $UID -s /sbin/nologin -G rspamd -g rspamd rspamd \
# Install rspamd
 && apk update \
 && apk add --no-cache rspamd

USER rspamd
VOLUME /etc/rspamd/local.d /etc/rspamd/override.d /etc/letsencrypt
EXPOSE 11332 11333 11334

CMD ["/usr/sbin/rspamd", "-f", "-c", "/etc/rspamd/rspamd.conf"]
