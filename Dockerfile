FROM php:8.1-alpine

RUN mkdir -p /var/www/html
WORKDIR /var/www/html/

RUN echo "UTC" > /etc/timezone
RUN apk add --no-cache zip unzip curl curl-dev

RUN apk add bash
RUN sed -i 's/bin\/ash/bin\/bash/g' /etc/passwd
RUN apk add --no-cache gcc g++ musl-dev make curl curl-dev openssl-dev zlib-dev openssl autoconf bzip2-dev libxml2-dev enchant2-dev libpng-dev gmp-dev gnu-libiconv-dev imap-dev libmp3splt-dev aspell-dev sqlite-dev libzip-dev

RUN docker-php-ext-install bcmath
RUN docker-php-ext-install pdo
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install pdo_sqlite
RUN docker-php-ext-install opcache
RUN docker-php-ext-install zip
RUN docker-php-ext-install curl
RUN docker-php-ext-install simplexml
RUN docker-php-ext-install pcntl
RUN docker-php-ext-install bz2
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pspell
RUN docker-php-ext-install soap
RUN docker-php-ext-install gd



# RUN /usr/bin/pecl8 channel-update pecl.php.net
RUN /usr/local/bin/pear config-set php_ini /etc/php8/php.ini
RUN apk add libpq-dev
RUN yes | /usr/local/bin/pecl install openswoole
RUN yes | /usr/local/bin/pecl install igbinary
RUN yes | /usr/local/bin/pecl install redis
RUN apk add imagemagick-dev
RUN yes | /usr/local/bin/pecl install imagick
RUN docker-php-ext-enable openswoole.so
RUN docker-php-ext-enable igbinary.so
RUN docker-php-ext-enable redis.so
RUN docker-php-ext-enable imagick.so

RUN ln -s /usr/local/bin/php /usr/bin/php
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
