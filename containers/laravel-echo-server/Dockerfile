FROM node:8
LABEL maintainer="Oleg Savvateev <o.savvateev@gmail.com>"
RUN yarn global add laravel-echo-server
RUN mkdir /home/laravel-echo-server
WORKDIR /home/laravel-echo-server
CMD laravel-echo-server start >> /home/laravel-echo-server/log
