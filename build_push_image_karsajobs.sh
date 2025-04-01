#!/bin/sh

# Define variables
GITHUB_USERNAME="assidiqi598"
IMAGE_NAME="karsajobs"
IMAGE_TAG="latest"

# Build a docker image based on Dockerfile in this directory for linux/amd64 architecture
docker buildx build --platform linux/amd64 -t ghcr.io/$GITHUB_USERNAME/$IMAGE_NAME:$IMAGE_TAG .

# Authenticate with GitHub Packages
echo $GH_TOKEN | docker login ghcr.io -u $GITHUB_USERNAME --password-stdin

# Push docker image to GHCR
docker push ghcr.io/$GITHUB_USERNAME/$IMAGE_NAME:$IMAGE_TAG
