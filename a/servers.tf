resource "aws_instance" "nat" {
  ami                         = "${var.ami}"
  instance_type               = "t2.micro"
  key_name                    = "${var.aws_key_name}"
  vpc_security_group_ids      = ["${aws_security_group.nat.id}"]
  subnet_id                   = "${aws_subnet.public.id}"
  associate_public_ip_address = true
  source_dest_check           = false

  tags = {
    Name = "nat"
  }
}
