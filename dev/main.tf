terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.74.2"
    }
  }
}

provider "aws" {
  region = var.region
}

data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

module "ec2" {
  source              = "git::https://github.com/Shivasjohn/terraform-modules.git//modules/ec2-instance?ref=main"
  ami                 = data.aws_ami.amazon_linux_2.id
  instance_type       = var.instance_type
  instance_name       = var.instance_name
  public_subnet_id    = module.subnets.public_subnet_ids[0]
  private_subnet_id   = module.subnets.private_subnet_ids[0]
  security_group_id = module.security_group.security_group_id
  tags               = var.tags
}

module "vpc" {
  source    = "git::https://github.com/Shivasjohn/terraform-modules.git//modules/vpc?ref=main"
  vpc_cidr  = var.vpc_cidr
  vpc_name  = var.vpc_name
  tags      = var.tags
}

module "subnets" {
  source               = "git::https://github.com/Shivasjohn/terraform-modules.git//modules/subnets?ref=main"
  vpc_id              = module.vpc.vpc_id
  vpc_name            = var.vpc_name
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
  tags                = var.tags
}

module "internet_gateway" {
  source      = "git::https://github.com/Shivasjohn/terraform-modules.git//modules/internet-gateway?ref=main"
  vpc_id      = module.vpc.vpc_id
  name        = var.vpc_name  # ✅ Add this line
  tags        = var.tags
  environment = var.environment
}


module "route_tables" {
  source              = "git::https://github.com/Shivasjohn/terraform-modules.git//modules/route-tables?ref=main"
  vpc_id             = module.vpc.vpc_id
  vpc_name           = var.vpc_name
  public_subnet_ids  = module.subnets.public_subnet_ids
  private_subnet_ids = module.subnets.private_subnet_ids
  igw_id             = module.internet_gateway.igw_id
  nat_id             = module.nat_gateway.nat_id
  tags               = var.tags
}

module "nat_gateway" {
  source              = "git::https://github.com/Shivasjohn/terraform-modules.git//modules/nat-gateway?ref=main"
  vpc_name           = var.vpc_name
  public_subnet_ids  = module.subnets.public_subnet_ids
  tags               = var.tags
}

module "security_group" {
  source = "git::https://github.com/Shivasjohn/terraform-modules.git//modules/security-groups?ref=main"
  vpc_id = module.vpc.vpc_id
  tags   = var.tags
}

