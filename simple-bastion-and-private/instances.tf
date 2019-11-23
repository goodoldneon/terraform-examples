resource "aws_instance" "bastion" {
  ami                         = "${lookup(var.ubuntu_amis, var.region)}"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.main.key_name}"
  vpc_security_group_ids      = ["${aws_security_group.allow_ssh.id}"]
  subnet_id                   = "${aws_subnet.public.id}"
  associate_public_ip_address = true

  tags = {
    Name = "bastion"
  }
}

resource "aws_instance" "private" {
  ami                    = "${lookup(var.ubuntu_amis, var.region)}"
  instance_type          = "t2.micro"
  key_name               = "${aws_key_pair.main.key_name}"
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
  subnet_id              = "${aws_subnet.private.id}"

  tags = {
    Name = "private"
  }
}
