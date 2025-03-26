#!/bin/sh

# Define variables
GITHUB_USERNAME="assidiqi598"
IMAGE_NAME="item-app"
IMAGE_TAG="v1"

# Build a docker image based on Dockerfile in this directory
docker build -t $IMAGE_NAME:$IMAGE_TAG .

# List local docker images
docker image ls

# Tag the image for GitHub Container Registry (GHCR)
docker tag $IMAGE_NAME:$IMAGE_TAG ghcr.io/$GITHUB_USERNAME/$IMAGE_NAME:$IMAGE_TAG

# Authenticate with GitHub Packages
echo $GH_TOKEN | docker login ghcr.io -u $GITHUB_USERNAME --password-stdin

# Push docker image to GHCR
docker push ghcr.io/$GITHUB_USERNAME/$IMAGE_NAME:$IMAGE_TAG
