#!/bin/bash

# Install dependencies
apt-get update
apt-get install -y docker.io

# Start Docker
systemctl start docker
systemctl enable docker

# Pull and run the Strapi container
docker run -d \
  -p 1337:1337 \
  --name strapi-app-karthik \
  ${docker_image}