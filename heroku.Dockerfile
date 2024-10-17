FROM node:alpine

RUN apk add --update --no-cache curl bash git

RUN curl https://cli-assets.heroku.com/install.sh | sh

WORKDIR /root

COPY heroku.netrc /root/.netrc
