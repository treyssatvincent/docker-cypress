#!/bin/bash

echo Cypress version?
read version

# Build latest & tagged
CYPRESS_VERSION=$version; docker build --build-arg CYPRESS_VERSION=$version -t ninobysa/cypress:$version .
CYPRESS_VERSION=$version; docker build --build-arg CYPRESS_VERSION=$version -t ninobysa/cypress .

docker image push ninobysa/cypress
docker image push ninobysa/cypress:$version

