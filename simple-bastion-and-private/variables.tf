variable "profile" {
  type    = "string"
  default = "default"
}

variable "region" {
  type    = "string"
  default = "us-east-1"
}

variable "ubuntu_amis" {
  type = "map"

  default = {
    us-east-1 = "ami-b3425cc9"
  }
}

variable "key_path" {
  type    = "string"
  default = "~/.ssh/id_rsa.pub"
}
