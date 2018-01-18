FROM alpine:3.7

ENV RCLONE_VERSION=1.39

RUN set -ex \
    && apk add --no-cache unzip \
    && wget https://downloads.rclone.org/rclone-v$RCLONE_VERSION-linux-amd64.zip -O /tmp/rclone.zip \
    && unzip -q /tmp/rclone.zip \
    && mv rclone-v$RCLONE_VERSION-linux-amd64/rclone /usr/local/bin/_rclone \
    && chmod +x /usr/local/bin/_rclone \
    && rm -rf /tmp/rclone.zip rclone-v$RCLONE_VERSION-linux-amd64

ADD ./rclone /usr/local/bin/rclone

ENTRYPOINT ["/usr/local/bin/rclone"]
