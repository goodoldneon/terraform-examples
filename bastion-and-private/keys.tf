resource "aws_key_pair" "nat" {
  key_name   = "nat"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}
