FROM alpine

RUN apk add --update --no-cache \
  build-base cmake coreutils curl unzip gettext-tiny-dev git

WORKDIR /home

RUN git clone --depth 1 https://github.com/neovim/neovim.git
RUN make CMAKE_BUILD_TYPE=RelWithDebInfo
RUN make install
