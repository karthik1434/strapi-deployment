variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "docker_repository" {
  description = "Docker repository for Strapi image"
  default     = "your-dockerhub-username/strapi-app"
}

variable "image_tag" {
  description = "Docker image tag to deploy"
  default     = "latest"
}