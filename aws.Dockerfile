FROM debian:stable-slim AS build

ARG USER_ID
ARG GROUP_ID

RUN apt update && \
  apt install -y curl unzip man less && \
  rm -rf /var/lib/apt/lists/*

RUN groupadd --gid $GROUP_ID --system mygroup && \
  useradd --gid $GROUP_ID --create-home --system --uid $USER_ID --password '' me && \
  usermod -a -G root me

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o awscliv2.zip && \
  unzip awscliv2.zip && \
  rm awscliv2.zip && \
  aws/install

USER me
WORKDIR /home/me
