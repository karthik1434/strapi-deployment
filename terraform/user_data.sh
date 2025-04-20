#!/bin/bash

# Install dependencies
apt-get update
apt-get install -y docker.io awscli
# Pull and run Strapi container
docker pull 118273046134.dkr.ecr.us-east-1.amazonaws.com/strapi-app-karthik:latest
docker run -d \
  -p 1337:1337 \
  --name strapi-app-karthik \
  118273046134.dkr.ecr.us-east-1.amazonaws.com/strapi-app-karthik:latest
