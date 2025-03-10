output "public_instance_id" {
  description = "ID of the Public EC2 Instance"
  value       = aws_instance.public.id
}

output "private_instance_id" {
  description = "ID of the Private EC2 Instance"
  value       = aws_instance.private.id
}
