FROM php:7.1.11-fpm
RUN set -ex \
    && cd ~ \
    && mv /etc/apt/sources.list /etc/apt/sources.list.bak \
    && { \
    echo deb http://mirrors.aliyun.com/debian/ jessie main non-free contrib; \
    echo deb http://mirrors.aliyun.com/debian/ jessie-proposed-updates main non-free contrib; \
    echo deb-src http://mirrors.aliyun.com/debian/ jessie main non-free contrib; \
    echo deb-src http://mirrors.aliyun.com/debian/ jessie-proposed-updates main non-free contrib; \
    } | tee /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y git \
    libpcre3-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng12-dev \
    && docker-php-ext-install -j$(nproc) iconv mcrypt \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    pecl install redis-3.1.4 \
    && docker-php-ext-enable redis \
    #&& pecl install xdebug-2.5.0 \
    #&& docker-php-ext-enable xdebug \
    #gd
    && docker-php-ext-install gd\
    && docker-php-ext-enable gd \
    #mysql
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-enable pdo_mysql
