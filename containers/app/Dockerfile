FROM php:7-cli

LABEL maintainer="Oleg Savvateev <o.savvateev@gmail.com>"

# composer install
RUN \
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=bin --filename=composer \
    && php -r "unlink('composer-setup.php');"

# other packages
RUN \
    apt-get update && apt-get install -y \
        wget \
        gnupg \
        mc \
        git \
        curl \
        libpng-dev \
    && rm -rf /var/lib/apt/lists/*

# nodejs install
ARG NVM_VERSION
ARG NODE_VERSION
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v$NVM_VERSION/install.sh | bash
RUN bash -ic 'nvm install $NODE_VERSION'

# yarn install
RUN \
    curl -sS http://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb http://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn \
    && rm -rf /var/lib/apt/lists/*

# locale and timezone
ARG TIMEZONE
RUN \
    apt-get update && apt-get install -y locales \
    && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /etc/locale.alias en_US.UTF-8 \
    && localedef -i ru_RU -c -f UTF-8 -A /etc/locale.alias ru_RU.UTF-8 \
    && ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime && echo $TIMEZONE > /etc/timezone
ENV LANG ru_RU.utf8

# vue-cli install
RUN bash -ic 'npm install -g vue-cli'

# php extensions install
RUN \
    apt-get update && \apt-get install -y \
        libldap2-dev \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu \
    && docker-php-ext-install ldap \
    && docker-php-ext-install pcntl

RUN echo "umask 0002" >> ~/.bashrc
ENTRYPOINT /bin/bash
