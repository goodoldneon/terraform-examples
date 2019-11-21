resource "aws_key_pair" "example" {
  key_name   = "example"
  public_key = "${file("${var.key-path}")}"
}
