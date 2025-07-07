FROM ruby:slim

ARG CURRENT_USER_ID
ARG PRIMARY_GROUP_ID

RUN groupadd --gid $PRIMARY_GROUP_ID --system mygroup || \
  useradd --gid $PRIMARY_GROUP_ID --create-home --system --uid $CURRENT_USER_ID me

RUN apt-get update -qq && apt-get install -y --no-install-recommends \
  build-essential \
  git \
  libyaml-dev \
  libpq-dev \
  libsqlite3-dev \
  && rm -rf /var/lib/apt/lists/*

USER me

RUN gem install rails

ENV BUNDLE_APP_CONFIG=".bundle"
WORKDIR /home/app
