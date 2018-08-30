FROM nginx:1
LABEL maintainer="Oleg Savvateev <o.savvateev@gmail.com>"

# locale and timezone
ARG TIMEZONE
RUN \
    apt-get update && apt-get install -y locales \
    && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /etc/locale.alias en_US.UTF-8 \
    && localedef -i ru_RU -c -f UTF-8 -A /etc/locale.alias ru_RU.UTF-8 \
    && ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime && echo $TIMEZONE > /etc/timezone
ENV LANG ru_RU.utf8
