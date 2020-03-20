FROM alpine:3.11

LABEL maintainer="Koen van der Heijden <koen@kvdheijden.com>"

ENV UID=1000
ENV GID=1000
ENV USER=minecraft
ENV USERDIR=/home/$USER

ENV OBJECT=bb2b6b1aefcd70dfd1892149ac3a215f6c636b07
ENV SHA256=80cf86dc2004ec6a2dc0183d1c75a9af3ba0669f7c332e4247afb1d76fb67e8a

RUN set -x \
# Create user/group
 && addgroup -g $GID -S $USER \
 && adduser -S -D -u $UID -h $USERDIR -s /sbin/nologin -G $USER -g $USER $USER \
# Install java 8 headless jre
 && apk update \
 && apk add --no-cache openjdk8-jre-base \
# Download the minecraft server and verify the SHA256 sum
 && wget https://launcher.mojang.com/v1/objects/${OBJECT}/server.jar \
 && echo "${SHA256} server.jar" | sha256sum -c

USER $UID:$GID
WORKDIR $USERDIR
VOLUME $USERDIR

EXPOSE 25565 25575

STOPSIGNAL SIGTERM

CMD ["/usr/bin/java", "-Xms1G", "-Xmx1G", "-jar", "/server.jar", "--nogui"]
