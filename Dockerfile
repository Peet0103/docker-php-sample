# syntax=docker/dockerfile:1

FROM composer:lts as deps

WORKDIR /app

RUN --mount=type=bind,source=composer.json,target=composer.json \
    --mount=type=bind,source=composer.lock,target=composer.lock \
    --mount=type=cache,target=/tmp/cache \
    composer install --no-dev --no-interaction

################################################################################


FROM php:8.2-apache as final

RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable mysqli

COPY --from=deps app/vendor/ /var/www/html/vendor

COPY ./src /var/www/html
USER www-data
