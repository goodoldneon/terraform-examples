resource "aws_instance" "bastion" {
  ami                         = "${lookup(var.bastion_amis, var.region)}"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.bastion.key_name}"
  vpc_security_group_ids      = ["${aws_security_group.bastion.id}"]
  subnet_id                   = "${aws_subnet.public.id}"
  associate_public_ip_address = true

  tags = {
    Name = "bastion"
  }
}

resource "aws_instance" "private" {
  ami                    = "${lookup(var.service_amis, var.region)}"
  instance_type          = "t2.micro"
  key_name               = "${aws_key_pair.bastion.key_name}"
  vpc_security_group_ids = ["${aws_security_group.private.id}"]
  subnet_id              = "${aws_subnet.private.id}"

  tags = {
    Name = "private"
  }
}
