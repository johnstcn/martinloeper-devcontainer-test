#!/bin/bash

# uncomment to debug the successful docker build steps
export BUILDKIT_PROGRESS=plain

NESTO_REGISTRY_NAME=go-test
NESTO_REF=${EXPECTED_REF:-$NESTO_USER_CONTAINER_REGISTRY_HOST/$NESTO_USER_CONTAINER_REGISTRY_NAME/$NESTO_REGISTRY_NAME}
BUILDKIT_NO_CLIENT_TOKEN=true docker buildx build --push -t $NESTO_REF .