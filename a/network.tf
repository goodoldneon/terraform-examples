resource "aws_eip" "nat" {
  instance = "${aws_instance.nat.id}"
  vpc      = true
}

resource "aws_internet_gateway" "default" {
  vpc_id = "${aws_vpc.default.id}"
}

resource "aws_vpc" "default" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_hostnames = true

  tags = {
    Name = "default"
  }
}

resource "aws_subnet" "public" {
  vpc_id     = "${aws_vpc.default.id}"
  cidr_block = "${var.public_subnet_cidr}"

  tags = {
    Name = "public"
  }
}

resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.default.id}"

  route {
    cidr_block = "${var.all_cidr}"
    gateway_id = "${aws_internet_gateway.default.id}"
  }

  tags = {
    Name = "public"
  }
}
resource "aws_route_table_association" "public" {
  subnet_id      = "${aws_subnet.public.id}"
  route_table_id = "${aws_route_table.public.id}"
}
