FROM alpine:3.12

RUN apk update \
    && apk --no-cache add alpine-sdk \
    && curl -s -OL http://forthworks.com/retro/r/latest.tar.gz \
    && tar -zxf latest.tar.gz \
    && cd `ls -1d /RETRO*` \
    && mkdir -p /usr/local/man/man1 \
    && make OPTIONS=-DBIT64 \
    && make install \
    && cd / \
    && rm -rf /RETRO* \
    && rm -rf /latest.tar.gz

