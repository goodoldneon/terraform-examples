variable "profile" {
  default = "default"
}

variable "region" {
  default = "us-east-1"
}

variable "ubuntu_amis" {
  type = "map"
  default = {
    us-east-1 = "ami-b3425cc9"
  }
}

variable "key_path" {
  default = "~/.ssh/id_rsa.pub"
}
