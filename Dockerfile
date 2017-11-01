FROM php:7.1.11-fpm
RUN pecl install redis-3.1.4 \
    && pecl install PDO_MYSQL-1.0.2 \
    && pecl install xdebug-2.5.0 \
    && docker-php-ext-enable redis PDO_MYSQL xdebug
