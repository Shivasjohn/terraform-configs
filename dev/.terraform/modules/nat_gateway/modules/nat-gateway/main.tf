# Allocate an Elastic IP (EIP) for the NAT Gateway
resource "aws_eip" "this" {

  tags = merge(var.tags, {
    Name = "${var.vpc_name}-nat-eip"
  })
}

# Create NAT Gateway in the first Public Subnet
resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.this.id
  subnet_id     = element(var.public_subnet_ids, 0) # Uses first Public Subnet

  tags = merge(var.tags, {
    Name = "${var.vpc_name}-nat"
  })
}
