# Dockerfile
FROM php:8.0-cli

RUN apt-get update -y && apt-get install -y libmcrypt-dev

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /app
COPY . /app

RUN composer self-update
RUN composer install

EXPOSE 8000
CMD php artisan serve --host=0.0.0.0 --port=8000