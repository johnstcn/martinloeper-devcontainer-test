#!/bin/bash

docker buildx create --name k8s-cluster --driver remote $NESTO_BUILDKIT_REMOTE_ADDR --use
