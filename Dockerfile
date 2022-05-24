FROM cypress/base:14.17.6

RUN npm i -g cypress@9.7.0 && npm cache clean --force && cypress verify

ENTRYPOINT ["cypress", "run"]
