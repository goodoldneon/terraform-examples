resource "aws_instance" "nat" {
  ami                         = "${lookup(var.amis, var.region)}"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.nat.key_name}"
  vpc_security_group_ids      = ["${aws_security_group.nat.id}"]
  subnet_id                   = "${aws_subnet.public.id}"
  associate_public_ip_address = true
  source_dest_check           = false

  tags = {
    Name = "nat"
  }
}
