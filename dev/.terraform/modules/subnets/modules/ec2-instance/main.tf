# Create Public EC2 Instance
resource "aws_instance" "public" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id             = var.public_subnet_id
  vpc_security_group_ids = [var.security_group_id]
  associate_public_ip_address = true # Public instance needs a public IP

  tags = merge(var.tags, {
    Name = "${var.instance_name}-public"
  })
}

# Create Private EC2 Instance
resource "aws_instance" "private" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id             = var.private_subnet_id
  vpc_security_group_ids = [var.security_group_id]
  associate_public_ip_address = false # Private instance has NO public IP

  tags = merge(var.tags, {
    Name = "${var.instance_name}-private"
  })
}
