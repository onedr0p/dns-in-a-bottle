FROM docker.io/library/alpine:3.19

RUN \
    apk add --no-cache \
        ca-certificates \
        curl \
        bash \
        bind \
        tzdata \
    && \
    apk add --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community \
        blocky \
        dnsdist \
        s6-overlay \
    && \
    apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/ \
        dockerize

COPY rootfs/ /

VOLUME ["/config"]
VOLUME ["/data"]
EXPOSE \
    53/udp 53/tcp \
    5354/tcp 5354/udp \
    5354/tcp 5354/udp 4000/tcp

ENTRYPOINT ["/init"]
