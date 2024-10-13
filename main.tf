# main.tf

data "aws_availability_zones" "available" {}
data "aws_region" "current" {}
data "aws_vpc" "main" {
  default = true
}

locals {
  ingress_rules = [{
    port        = 443
    description = "Ingress rules for port 443"
    },
    {
      port        = 80
      description = "Ingress rules for port 80"
  }]
}

resource "aws_vpc" "vpc_demo" {
  cidr_block = var.vpc_cidr
  tags = {
    Name        = var.vpc_name
    Environment = "demo_environment"
    Terraform   = "true"
  }
}

resource "aws_subnet" "demo" {
  vpc_id            = aws_vpc.vpc_demo.id
  cidr_block        = var.vpc_cidr
  availability_zone = var.availability_zone

  tags = {
    Name        = "demo"
    Environment = "demo-env"
  }
}

resource "aws_internet_gateway" "internet_gateway_demo" {
  vpc_id = aws_vpc.vpc_demo.id
  tags = {
    Name = "demo_igw"
  }
}

resource "aws_instance" "web_demo" {
  ami               = var.ami_type
  instance_type     = var.instance_type
  availability_zone = var.availability_zone

  subnet_id = aws_subnet.demo.id

  tags = {
    "Name" = "Web Server"
  }
}

resource "aws_security_group" "my-new-security-group-2" {
  name        = "web_server_traffic"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.vpc_demo.id

  dynamic "ingress" {
    for_each = local.ingress_rules

    content {
      description = ingress.value.description
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = var.protocol
      cidr_blocks = [var.cidr_block]
    }
  }
}