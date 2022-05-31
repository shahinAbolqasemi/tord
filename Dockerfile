FROM python:3.9.13-alpine3.16
RUN apk update && apk add \
    tor \
    --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ \
    && rm -rf /var/cache/apk/*
EXPOSE 9050
COPY torrc.default /etc/tor/torrc.default
RUN chown -R 1009550000 /etc/tor
RUN mkdir /.tor
RUN chown -R 1009550000 /.tor
USER 1009550000
ENTRYPOINT [ "tor" ]
CMD [ "-f", "/etc/tor/torrc.default" ]
