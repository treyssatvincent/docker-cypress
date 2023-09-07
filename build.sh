#!/bin/bash

echo Cypress version?
read version

# Test
CYPRESS_VERSION=$version; docker build --build-arg CYPRESS_VERSION=$version -t tmp-ninobysa/cypress .

docker run --rm --name static -v $(pwd)/test:/usr/share/nginx/html:ro -d nginx:stable-alpine
docker run --rm -v $(pwd)/test:/test -w /test --network=container:static tmp-ninobysa/cypress
docker stop static

