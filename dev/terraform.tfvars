environment = "dev"

vpc_cidr  = "10.0.0.0/16"
vpc_name  = "my-enterprise-vpc"
tags      = { Environment = "dev", Owner = "Cloud Team" }

public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
availability_zones   = ["us-east-2a", "us-east-2b"]

instance_type = "t3.micro"
instance_name = "dev-ec2"
region = "us-east-2"




