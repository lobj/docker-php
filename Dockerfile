FROM php:7.1.11-fpm
RUN pecl install redis-3.1.4 \
    && pecl install pdo \
    && pecl install pdo_mysql \
    && pecl install xdebug-2.5.0 \
    && docker-php-ext-enable redis pdo_mysql xdebug
