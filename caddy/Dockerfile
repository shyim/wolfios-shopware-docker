#syntax=docker/dockerfile:1.4

ARG PHP_VERSION=8.3

FROM ghcr.io/shyim/wolfios-shopware-docker:${PHP_VERSION}-fpm

USER root

RUN apk add --no-cache caddy curl

COPY --from=shyim/supervisord:latest --link /usr/local/bin/supervisord /usr/bin/supervisord

USER www-data

COPY --link rootfs /

EXPOSE 8000
WORKDIR /var/www/html

ENV FPM_LISTEN=/tmp/php-fpm.sock

ENTRYPOINT [ "/usr/bin/supervisord", "-c", "/etc/supervisord.conf" ]
