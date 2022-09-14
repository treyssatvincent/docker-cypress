# docker-cypress [![Docker Image Version (latest semver)](https://img.shields.io/docker/v/ninobysa/cypress?style=flat-square)](https://hub.docker.com/r/ninobysa/cypress/tags)

Docker image ready for [Cypress](https://www.cypress.io/).

Cypress is heavy, so is this image.

## Installation
```bash
docker pull ninobysa/cypress:latest
```

## Usage
Example with a static website in a `test` directory:
```bash
docker run --rm --name static -v $(pwd)/test:/usr/share/nginx/html:ro -d nginx:stable-alpine
docker run --rm -v $(pwd)/test:/test -w /test --network=container:static ninobysa/cypress:latest
```` 

## Credit
This is based on the work done at https://github.com/cypress-io/cypress-docker-images for `cypress/base`.

## Missing font
To keep this image as light as possible the fonts to support emoji and Chinese have been removed.

If you need emoji:
``` Dockerfile
FROM ninobysa/cypress:10.8.0

RUN apt-get update && \
  apt-get install --no-install-recommends -y \
  fonts-noto-color-emoji \
  # clean up
  && rm -rf /var/lib/apt/lists/*

```

If you need chinese:
``` Dockerfile
FROM ninobysa/cypress:10.8.0

RUN apt-get update && \
  apt-get install --no-install-recommends -y \
  fonts-arphic-bkai00mp \
  fonts-arphic-bsmi00lp \
  fonts-arphic-gbsn00lp \
  fonts-arphic-gkai00mp \
  fonts-arphic-ukai \
  fonts-arphic-uming \
  ttf-wqy-zenhei \
  ttf-wqy-microhei \
  xfonts-wqy \
  # clean up
  && rm -rf /var/lib/apt/lists/*

```

