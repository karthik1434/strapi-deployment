#!/bin/bash
set -ex  # Enable debugging

# Redirect all output to a log file
exec > >(tee /var/log/user-data.log) 2>&1

echo "=== Starting user-data ==="
date

# Install dependencies
apt-get update
apt-get install -y docker.io awscli

echo "=== AWS CLI Version ==="
aws --version

echo "=== Trying ECR Login ==="
aws ecr get-login-password --region us-east-1 | \
  docker login --username AWS --password-stdin 118273046134.dkr.ecr.us-east-1.amazonaws.com

echo "=== Docker Info ==="
docker info

echo "=== Pulling Image ==="
docker pull 118273046134.dkr.ecr.us-east-1.amazonaws.com/strapi-app-karthik:latest

echo "=== Running Container ==="
docker run -d \
  -p 1337:1337 \
  --name strapi-app-karthik \
  --restart unless-stopped \
  118273046134.dkr.ecr.us-east-1.amazonaws.com/strapi-app-karthik:latest

echo "=== Completed successfully ==="
date