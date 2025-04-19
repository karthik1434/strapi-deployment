#!/bin/bash

# Install dependencies
apt-get update
apt-get install -y docker.io
apt-get install awscli

# Start Docker
systemctl start docker
systemctl enable docker

# Define your ECR image URI (replace with your actual values)
docker_image="118273046134.dkr.ecr.us-east-1.amazonaws.com/strapi-app-karthik:latest"

# Login to ECR (ensure AWS CLI is installed and configured)
aws ecr get-login-password --region us-east-1 | \
  docker login --username AWS --password-stdin  118273046134.dkr.ecr.us-east-1.amazonaws.com

# Pull and run the Strapi container
docker run -d \
  -p 1337:1337 \
  --name strapi-app-karthik \
  "$docker_image"
