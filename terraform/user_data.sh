#!/bin/bash

# Install dependencies
apt-get update
apt-get install -y docker.io
apt-get install -y awscli

# Start Docker
systemctl start docker
systemctl enable docker

docker run -d \
  -p 1337:1337 \
  --name strapi-app-karthik \
  "$docker_image"
