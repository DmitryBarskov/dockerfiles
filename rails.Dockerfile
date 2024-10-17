FROM ruby:alpine

RUN apk add --update --no-cache \
    build-base \
    libpq-dev \
    gcompat \
    tzdata \
    git

RUN gem install rails

RUN adduser $USER -DS
USER $USER
ENV BUNDLE_APP_CONFIG=".bundle"
WORKDIR /home/app
