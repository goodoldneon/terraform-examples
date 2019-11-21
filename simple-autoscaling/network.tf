# VPC
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true
  enable_classiclink   = false

  tags = {
    Name = "main"
  }
}

# Public subnets (1 per AZ)
resource "aws_subnet" "public" {
  count                   = "${length(data.aws_availability_zones.all.names)}"
  availability_zone       = "${element(data.aws_availability_zones.all.names, count.index)}"
  cidr_block              = "10.0.${count.index + 1}.0/24"
  map_public_ip_on_launch = true
  vpc_id                  = "${aws_vpc.main.id}"

  tags = {
    Name = "private-${count.index}"
  }
}

# Private subnets (1 per AZ)
resource "aws_subnet" "private" {
  count                   = "${length(data.aws_availability_zones.all.names)}"
  availability_zone       = "${element(data.aws_availability_zones.all.names, count.index)}"
  cidr_block              = "10.0.${length(aws_subnet.public) + count.index + 1}.0/24"
  map_public_ip_on_launch = false
  vpc_id                  = "${aws_vpc.main.id}"

  tags = {
    Name = "private-${count.index + 1}"
  }
}

# Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = "${aws_vpc.main.id}"

  tags = {
    Name = "main"
  }
}

# Public route table
resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.main.id}"
  }

  tags = {
    Name = "public"
  }
}

# Public route associations
resource "aws_route_table_association" "public" {
  count          = "${length(aws_subnet.public)}"
  subnet_id      = "${element(aws_subnet.public.*.id, count.index)}"
  route_table_id = "${aws_route_table.public.id}"
}
