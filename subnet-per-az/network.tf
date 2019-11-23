resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "public" {
  # In each AZ, but no more than 3 AZs.
  count                   = "${min(length(data.aws_availability_zones.all.names), 3)}"

  availability_zone       = "${element(data.aws_availability_zones.all.names, count.index)}"
  cidr_block              = "10.0.${count.index + 1}.0/24"
  map_public_ip_on_launch = true
  vpc_id                  = "${aws_vpc.main.id}"

  tags = {
    Name = "public-${count.index + 1}"
  }
}

resource "aws_subnet" "private" {
  # In each AZ, but no more than 3 AZs.
  count                   = "${min(length(data.aws_availability_zones.all.names), 3)}"

  availability_zone       = "${element(data.aws_availability_zones.all.names, count.index)}"
  cidr_block              = "10.0.${length(aws_subnet.public) + count.index + 1}.0/24"
  map_public_ip_on_launch = true
  vpc_id                  = "${aws_vpc.main.id}"

  tags = {
    Name = "private-${count.index + 1}"
  }
}
