resource "aws_security_group" "bastion" {
  name   = "bastion"
  vpc_id = "${aws_vpc.default.id}"

  # SSH
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["${var.all_cidr}"]
  }

  # Ping
  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["${var.all_cidr}"]
  }

  # All
  egress {
    protocol    = -1
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["${var.all_cidr}"]
  }

  tags = {
    Name = "bastion"
  }
}

resource "aws_security_group" "private" {
  name   = "private"
  vpc_id = "${aws_vpc.default.id}"

  # SSH
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["${var.all_cidr}"]
  }

  # Ping
  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["${var.all_cidr}"]
  }

  # All
  egress {
    protocol    = -1
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["${var.all_cidr}"]
  }

  tags = {
    Name = "private"
  }
}
