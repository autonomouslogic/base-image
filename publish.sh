#!/bin/bash -ex

VERSION="$1"

docker build -t autonomouslogic/base-image:$VERSION .
docker tag autonomouslogic/base-image:$VERSION autonomouslogic/base-image:latest
docker push autonomouslogic/base-image:$VERSION
docker push autonomouslogic/base-image:latest
