variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default = "ami-0d0f28110d16ee7d6"
}

variable "instance_type" {
  description = "Instance type"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
  default = "subnet-0cecd601cd0d0d160"
}

variable "security_groups" {
  description = "List of security groups"
  type        = list(string)
  default = ["sg-026ab1bd44121fa84"]
}

variable "instance_name" {
  description = "Name of the instance"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "AWS_ACCESS_KEY_ID" {
  description = "AWS Access Key ID"
  type        = string
  sensitive   = true
}

variable "AWS_SECRET_ACCESS_KEY" {
  description = "AWS Secret Access Key"
  type        = string
  sensitive   = true
}

# Networking variables
variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of Availability Zones"
  type        = list(string)
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}
