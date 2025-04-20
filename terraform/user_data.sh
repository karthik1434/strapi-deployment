#!/bin/bash

# Install Docker and AWS CLI
apt-get update -y
apt-get install -y docker.io awscli

# Start Docker
systemctl start docker
systemctl enable docker

sleep 20

# Wait to ensure EC2 IAM role credentials are available
# Configure AWS credentials
export AWS_ACCESS_KEY_ID="${var.aws_access_key_id}"
export AWS_SECRET_ACCESS_KEY="${var.aws_secret_access_key}"
export AWS_DEFAULT_REGION="us-east-1"


aws configure set aws_access_key_id "${var.aws_access_key_id}"
aws configure set aws_secret_access_key "${var.aws_secret_access_key}"
aws configure set default.region "us-east-1"


# Authenticate with ECR
aws ecr get-login-password --region us-east-1 | \
docker login --username AWS --password-stdin 118273046134.dkr.ecr.us-east-1.amazonaws.com

# Pull and run the image
docker pull 118273046134.dkr.ecr.us-east-1.amazonaws.com/strapi-app-karthik:latest

docker run -d \
  -p 1337:1337 \
  --name strapi-app-karthik \
  118273046134.dkr.ecr.us-east-1.amazonaws.com/strapi-app-karthik:latest
