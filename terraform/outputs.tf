output "public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.strapi.public_ip
}

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.strapi.id
}

output "ssm_command" {
  description = "Command to connect to the instance using AWS SSM"
  value       = "aws ssm start-session --target ${aws_instance.strapi.id}"
}