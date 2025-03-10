variable "vpc_id" {
  description = "The ID of the VPC where Route Tables will be created"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "igw_id" {
  description = "Internet Gateway ID for Public Route Table"
  type        = string
}

variable "nat_id" {
  description = "NAT Gateway ID for Private Route Table"
  type        = string
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}
