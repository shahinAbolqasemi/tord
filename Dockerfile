FROM python:3.9.13-alpine3.16
RUN apk update && apk add \
    tor \
    --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ \
    && rm -rf /var/cache/apk/*
EXPOSE 9050
COPY torrc.default /etc/tor/torrc.default
RUN chown -R tor /etc/tor
# USER tor
RUN mkdir /.tor
ENTRYPOINT [ "tor" ]
CMD [ "-f", "/etc/tor/torrc.default" ]
