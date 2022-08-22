#!/bin/bash

echo Cypress version?
read version

# Test
CYPRESS_VERSION=$version; docker build --build-arg CYPRESS_VERSION=$version -t tmp-ninobysa/cypress .

docker run tmp-ninobysa/cypress version
docker run --rm --name static -v $(pwd)/test:/usr/share/nginx/html:ro -d nginx:stable-alpine
docker run --rm -v $(pwd)/test:/test -w /test --network=container:static tmp-ninobysa/cypress


# Build latest & tagged
CYPRESS_VERSION=$version; docker build --build-arg CYPRESS_VERSION=$version -t ninobysa/cypress:$version .
CYPRESS_VERSION=$version; docker build --build-arg CYPRESS_VERSION=$version -t ninobysa/cypress .

