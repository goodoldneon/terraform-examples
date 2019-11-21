resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = "${aws_vpc.main.id}"
  count                   = "${length(data.aws_availability_zones.all.names)}"
  availability_zone       = "${element(data.aws_availability_zones.all.names, count.index)}"
  cidr_block              = "10.0.${count.index + 1}.0/24"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "public-${count.index}"
  }
}

resource "aws_subnet" "private" {
  vpc_id                  = "${aws_vpc.main.id}"
  count                   = "${length(data.aws_availability_zones.all.names)}"
  availability_zone       = "${element(data.aws_availability_zones.all.names, count.index)}"
  cidr_block              = "10.0.${length(aws_subnet.public) + count.index + 1}.0/24"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "private-${count.index + 1}"
  }
}
