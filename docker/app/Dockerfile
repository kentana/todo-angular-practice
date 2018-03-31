FROM ruby:2.5.1-alpine3.7

RUN apk update
RUN apk upgrade

# install libs for build rails.
RUN apk add alpine-sdk
RUN apk add mariadb-dev

# set workdir
ENV APPPATH /usr/src/app
RUN mkdir -p $APPPATH
ADD . $APPPATH
WORKDIR $APPPATH

COPY Gemfile $APPPATH
COPY Gemfile.lock $APPPATH

# bundle install
RUN bundle install

# install npm

# install angular-cli

# get bootstrap