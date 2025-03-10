variable "environment" {
  description = "The environment for which the IGW is being created (e.g., dev, prod)"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where the IGW will be attached"
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the IGW"
  type        = map(string)
  default     = {}
}

variable "name" {
  description = "Name of the Internet Gateway"
  type        = string
}
