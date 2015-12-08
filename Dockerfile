FROM alpine:3.2

# Note: We add a dummy xclip because we don't want to support clipboard
# from within the container.
RUN apk add --update \
        g++ \
        libffi \
        libffi-dev \
        libjpeg-turbo \
        libjpeg-turbo-dev \
        libxml2 \
        libxml2-dev \
        libxslt \
        libxslt-dev \
        openssl \
        openssl-dev \
        python \
        python-dev \
        zlib \
        zlib-dev \
    && wget -qO- https://bootstrap.pypa.io/get-pip.py | python - \
    && touch /usr/local/bin/xclip \
    && chmod +x /usr/local/bin/xclip \
    && LDFLAGS=-L/lib pip install mitmproxy \
    && apk del --purge \
        g++ \
        libffi-dev \
        libjpeg-turbo-dev \
        libxml2-dev \
        libxslt-dev \
        openssl-dev \
        python-dev \
        zlib-dev \
    && rm -rf ~/.cache/pip \
    && adduser -u 7799 -D mitmproxy

ENV LANG=en_US.UTF-8

USER mitmproxy
RUN mkdir /home/mitmproxy/.mitmproxy
VOLUME /home/mitmproxy/.mitmproxy

EXPOSE 8080

CMD ["mitmproxy"]
