FROM --platform=$BUILDPLATFORM alpine AS build
ARG BUILDPLATFORM
ARG TARGETARCH
ARG TARGETOS

WORKDIR /root
RUN wget -O exercism.tar.gz "https://github.com/exercism/cli/releases/download/v3.4.0/exercism-3.4.0-$TARGETOS-$TARGETARCH.tar.gz" && \
  tar -xf exercism.tar.gz && \
  rm exercism.tar.gz

FROM alpine
COPY --from=build /root/exercism /bin/exercism
