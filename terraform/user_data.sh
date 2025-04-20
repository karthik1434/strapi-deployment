#!/bin/bash

# Install Docker and AWS CLI
apt-get update -y
apt-get install -y docker.io awscli

# Start Docker
systemctl start docker
systemctl enable docker

# Wait to ensure EC2 IAM role credentials are available
sleep 30

# Authenticate with ECR
aws ecr get-login-password --region us-east-1 | \
docker login --username AWS --password-stdin 118273046134.dkr.ecr.us-east-1.amazonaws.com

# Pull and run the image
docker pull 118273046134.dkr.ecr.us-east-1.amazonaws.com/strapi-app-karthik:latest

docker run -d \
  -p 1337:1337 \
  --name strapi-app-karthik \
  118273046134.dkr.ecr.us-east-1.amazonaws.com/strapi-app-karthik:latest
