variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "instance_name" {
  description = "Name prefix for EC2 instances"
  type        = string
}

variable "public_subnet_id" {
  description = "Subnet ID where the public instance will be deployed"
  type        = string
}

variable "private_subnet_id" {
  description = "Subnet ID where the private instance will be deployed"
  type        = string
}

variable "security_group_id" {
  description = "Security Group ID to attach to EC2 instances"
  type        = string
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}
