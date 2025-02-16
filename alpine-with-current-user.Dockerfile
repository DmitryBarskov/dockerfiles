FROM alpine:latest

ARG UID
ARG GID

RUN addgroup --gid $GID --system mygroup || \
    adduser --system -G "$(getent group $GID | cut -d: -f1)" --uid $UID me

USER me
