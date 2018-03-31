FROM node:9.10.0-alpine

RUN apk update
RUN apk upgrade

RUN npm install -g @angular/cli

# set workdir
ENV APPPATH /usr/src/app
RUN mkdir -p $APPPATH
ADD . $APPPATH
WORKDIR $APPPATH

COPY package.json $APPPATH
COPY package-lock.json $APPPATH

# npm install
RUN npm install
