#!/bin/bash

# Exit immediately if any command fails
set -e

# Install dependencies
apt-get update
apt-get install -y \
    docker.io \
    awscli  # Needed for ECR login

# Add current user to docker group to avoid sudo
usermod -aG docker $USER

# Start and enable Docker
systemctl enable --now docker

# Login to ECR (required to pull private images)
aws ecr get-login-password --region ${AWS_REGION} | \
  docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com

# Stop and remove any existing container with the same name
docker rm -f strapi-app-karthik || true

# Pull and run the Strapi container
docker run -d \
  --name strapi-app-karthik \
  -p 1337:1337 \
  --restart unless-stopped \
  -e NODE_ENV=production \
  ${docker_image}