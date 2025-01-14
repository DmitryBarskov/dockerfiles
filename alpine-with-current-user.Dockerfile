FROM alpine:latest

ARG UID
ARG GID

RUN addgroup --gid $GID --system mygroup || true
RUN adduser --system --gid $GID --uid $UID me

USER me
