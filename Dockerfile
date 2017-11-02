FROM php:7.1.11-fpm
RUN pecl install redis-3.1.4 \
    && docker-php-ext-enable redis \
    #&& pecl install xdebug-2.5.0 \
    #&& docker-php-ext-enable xdebug \
    #gd
    && docker-php-ext-install gd\
    && docker-php-ext-enable gd \
    #mysql
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-enable pdo_mysql
