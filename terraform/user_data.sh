#!/bin/bash

# Install Docker and AWS CLI
apt-get update -y
apt-get install -y docker.io awscli

# Start Docker
systemctl start docker
systemctl enable docker

# Wait for Docker to initialize
sleep 20

# Configure AWS credentials (using environment variables)
export AWS_ACCESS_KEY_ID="$aws_access_key_id"
export AWS_SECRET_ACCESS_KEY="$aws_secret_access_key"
export AWS_DEFAULT_REGION="us-east-1"

# Authenticate with ECR
aws ecr get-login-password --region us-east-1 | \
docker login --username AWS --password-stdin 118273046134.dkr.ecr.us-east-1.amazonaws.com

# Pull and run the image
docker pull 118273046134.dkr.ecr.us-east-1.amazonaws.com/strapi-app-karthik:latest

docker run -d \
  -p 1337:1337 \
  --name strapi-app-karthik \
  118273046134.dkr.ecr.us-east-1.amazonaws.com/strapi-app-karthik:latest