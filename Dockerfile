FROM node:18.12-buster-slim

ARG CYPRESS_VERSION

ENV TERM=xterm
ENV npm_config_loglevel=warn
ENV npm_config_unsafe_perm=true
ENV NODE_PATH=/usr/local/lib/node_modules

RUN apt-get update && \
  apt-get install --no-install-recommends -y \
  libgtk2.0-0 \
  libgtk-3-0 \
  libnotify-dev \
  libgconf-2-4 \
  libgbm-dev \
  libnss3 \
  libxss1 \
  libasound2 \
  libxtst6 \
  procps \
  xauth \
  xvfb \
  && npm i -g cypress@$CYPRESS_VERSION \
  && cypress verify \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean \
  && npm cache clean --force

ENTRYPOINT ["cypress", "run"]
