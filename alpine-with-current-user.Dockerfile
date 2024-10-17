FROM alpine:latest

ARG UID
ARG GID

RUN addgroup -g $GID -S mygroup && \
  adduser -S -G mygroup -S -u $UID me

USER me
