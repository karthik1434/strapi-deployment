variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.medium"
}

variable "image_tag" {
  description = "Docker image tag to deploy"
  default     = "latest"
}

variable "aws_access_key_id" {
  type        = string
  description = "AWS access key for EC2 user_data"
}

variable "aws_secret_access_key" {
  type        = string
  description = "AWS secret key for EC2 user_data"
}