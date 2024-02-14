FROM --platform=arm64 node:alpine

RUN apk add --update --no-cache curl bash

RUN curl https://cli-assets.heroku.com/install.sh | sh
RUN yes | heroku login

CMD [ "heroku" ]
