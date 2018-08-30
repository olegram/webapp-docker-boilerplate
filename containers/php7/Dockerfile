FROM php:7-fpm
LABEL maintainer="Oleg Savvateev <o.savvateev@gmail.com>"

RUN \
    apt-get update && \apt-get install -y \
        libldap2-dev \
        libmemcached-dev \
        zlib1g-dev \
        libbz2-dev \
        libicu-dev \
        libxml2-dev \
        libpq-dev \
    && pecl install memcached \
    && rm -rf /tmp/pear \
    && rm -rf /var/lib/apt/lists/*

RUN \
    docker-php-ext-install bcmath \
    && docker-php-ext-install bz2 \
    && docker-php-ext-install calendar \
    && docker-php-ext-install dba \
    && docker-php-ext-install exif \
    && docker-php-ext-install gettext \
    && docker-php-ext-install intl \
    && docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ \
    && docker-php-ext-install ldap \
    && docker-php-ext-enable memcached \
    && docker-php-ext-install pcntl \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql && docker-php-ext-install pgsql pdo_pgsql \
    && docker-php-ext-install soap \
    && docker-php-ext-install sockets \
    && docker-php-ext-install sysvmsg \
    && docker-php-ext-install sysvsem \
    && docker-php-ext-install sysvshm \
    && docker-php-ext-install wddx \
    && docker-php-ext-install zip \
    && docker-php-ext-install opcache

# redis
ARG PHPREDIS_VERSION
RUN \
    mkdir -p /usr/src/php/ext/redis \
    && curl -L https://github.com/phpredis/phpredis/archive/$PHPREDIS_VERSION.tar.gz | tar xvz -C /usr/src/php/ext/redis --strip 1 \
    && echo 'redis' >> /usr/src/php-available-exts \
    && docker-php-ext-install redis

# xdebug install
RUN pecl install xdebug && docker-php-ext-enable xdebug

# locale and timezone
ARG TIMEZONE
RUN \
    apt-get update && apt-get install -y locales \
    && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /etc/locale.alias en_US.UTF-8 \
    && localedef -i ru_RU -c -f UTF-8 -A /etc/locale.alias ru_RU.UTF-8 \
    && ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime && echo $TIMEZONE > /etc/timezone
ENV LANG ru_RU.utf8

# cron
RUN \
    apt-get update && apt-get install -y \
        supervisor \
        cron \
        rsyslog \
    && rm -rf /var/lib/apt/lists/*

#artisan autocomplete
RUN \
    apt-get update && apt-get install -y \
        bash-completion \
    && rm -rf /var/lib/apt/lists/* \
    && echo "if [ -f /etc/bash_completion ]; then" >> ~/.bashrc \
    && echo ". /etc/bash_completion" >> ~/.bashrc \
    && echo "fi" >> ~/.bashrc

# copy etc
COPY etc/ /etc/

ARG GID
RUN echo $GID && groupadd --gid $GID host-machine-group && usermod -a -G host-machine-group www-data
RUN echo "umask 0002" >> ~/.bashrc

ENTRYPOINT supervisord
