resource "aws_subnet" "public" {
  count                = length(var.public_subnet_cidrs)  # ✅ Add this line
  vpc_id               = var.vpc_id
  cidr_block           = var.public_subnet_cidrs[count.index]
  availability_zone    = element(var.availability_zones, count.index)
  map_public_ip_on_launch = true

  tags = merge(var.tags, {
    Name = "${var.vpc_name}-public-${count.index + 1}"
  })
}

resource "aws_subnet" "private" {
  count                = length(var.private_subnet_cidrs)  # ✅ Add this line
  vpc_id               = var.vpc_id
  cidr_block           = var.private_subnet_cidrs[count.index]
  availability_zone    = element(var.availability_zones, count.index)

  tags = merge(var.tags, {
    Name = "${var.vpc_name}-private-${count.index + 1}"
  })
}
