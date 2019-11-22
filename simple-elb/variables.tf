variable "region" {
  type    = "string"
  default = "us-east-2"
}

variable "amis" {
  type = "map"

  default = {
    us-east-2 = "ami-eee2b98b"
    us-west-1 = "ami-84423ae4"
  }
}
