#!/bin/bash

# Install dependencies
apt-get update
apt-get install -y docker.io

# Start Docker
systemctl start docker
systemctl enable docker

docker run -d \
  -p 1337:1337 \
  --name strapi-app-karthik \
  118273046134.dkr.ecr.us-east-1.amazonaws.com/strapi-app-karthik:latest

  
