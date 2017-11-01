FROM php:7.1.11-fpm
RUN pecl install redis-3.1.4 \
    && pecl install xdebug-2.5.0 \
    && docker-php-ext-enable redis xdebug \
    #mysql
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-enable pdo_mysql
