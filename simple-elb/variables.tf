variable "profile" {
  type    = "string"
  default = "default"
}

variable "region" {
  type    = "string"
  default = "us-east-1"
}

variable "amis" {
  type = "map"

  default = {
    us-east-1 = "ami-b3425cc9"
  }
}
