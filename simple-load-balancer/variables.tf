variable "web_count" {
  default = 2
}

variable "region" {
  default = "us-east-2"
}

variable "amis" {
  type = "map"
  default = {
    us-east-1 = "ami-b3425cc9"
    us-east-2 = "ami-3ec9fd5b"
    us-west-1 = "ami-61f2fb01"
    us-west-2 = "ami-0aac2e72"
  }
}
