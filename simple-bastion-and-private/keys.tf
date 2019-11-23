resource "aws_key_pair" "main" {
  key_name   = "main"
  public_key = "${file("${var.key_path}")}"
}
