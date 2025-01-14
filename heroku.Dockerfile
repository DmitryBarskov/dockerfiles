FROM node:alpine

RUN apk add --update --no-cache curl bash git

RUN curl https://cli-assets.heroku.com/install.sh | sh

ARG UID
ARG GID
ARG USERNAME="me"

RUN addgroup -g $GID -S mygroup && \
  adduser -S -G mygroup -S -u $UID $USERNAME

USER $USERNAME

COPY .netrc "/home/$USERNAME/.netrc"
