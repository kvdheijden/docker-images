FROM alpine:3.11 as build

LABEL maintainer="Koen van der Heijden <koen@kvdheijden.com>"

ENV BUILD_VERSION=4.29-9680-rtm
ENV SHA256_SUM=c19cd49835c613cb5551ce66c91f90da3d3496ab3e15e8c61e22b464dc55d9b0
ENV LANG=en_US.UTF-8

RUN set -x \
# Download the server, verify sha256 checksum and unpack it
 && wget https://github.com/SoftEtherVPN/SoftEtherVPN_Stable/archive/v${BUILD_VERSION}.tar.gz \
 && echo "${SHA256_SUM}  v${BUILD_VERSION}.tar.gz" | sha256sum -c \
 && mkdir -p /usr/local/src \
 && tar -x -C /usr/local/src/ -f v${BUILD_VERSION}.tar.gz \
 && rm v${BUILD_VERSION}.tar.gz \
# Install dependecies
 && apk update \
 && apk add --no-cache build-base ncurses-dev openssl-dev readline-dev zip zlib-dev \
# Change to the source directory and build the server
 && cd /usr/local/src/SoftEtherVPN_Stable-* \
 && ./configure \
 && make \
 && make install \
# Zip the build artifacts
 && zip -r9 /artifacts.zip /usr/vpn* /usr/bin/vpn*

FROM alpine:3.11

ENV LANG=en_US.UTF-8

COPY --from=build /artifacts.zip /

RUN set -x \
# Install dependecies
 && apk update \
 && apk add --no-cache bash iptables openssl-dev \
# Unpack the artifacts from the build image
 && unzip -o /artifacts.zip -d / \
 && rm /artifacts.zip

WORKDIR /usr/vpnserver/

VOLUME /usr/vpnserver/vpn_server.config

EXPOSE 500/udp 4500/udp 1701/tcp 1194/udp 5555/tcp 443/tcp

STOPSIGNAL SIGTERM

CMD ["/usr/bin/vpnserver", "execsvc"]
