FROM debian:stable-slim

ARG UID
ARG GID

RUN groupadd --gid $GID --system mygroup && \
  useradd --gid $GID --create-home --system --uid $UID me

USER me
