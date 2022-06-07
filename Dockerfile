FROM cypress/base:14.17.6

RUN npm i -g cypress@10.0.3 && npm cache clean --force && cypress verify

ENTRYPOINT ["cypress", "run"]
