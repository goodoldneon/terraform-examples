variable "region" {
  default = "us-east-2"
}

variable "service_amis" {
  type = "map"
  default = {
    us-east-1 = "ami-b3425cc9"
    us-east-2 = "ami-3ec9fd5b"
    us-west-1 = "ami-61f2fb01"
    us-west-2 = "ami-0aac2e72"
  }
}

variable "bastion_amis" {
  type = "map"
  default = {
    us-east-1 = "ami-1d4e7a66"
    us-east-2 = "ami-dbbd9dbe"
    us-west-1 = "ami-969ab1f6"
    us-west-2 = "ami-8803e0f0"
  }
}

variable "aws_key_path" {
  default = "/Users/aaron/.ssh/aws"
}

variable "aws_key_name" {
  default = "aws"
}

variable "vpc_cidr" {
  description = "CIDR for the whole VPC"
  default     = "10.0.0.0/16"
}

variable "all_cidr" {
  description = "CIDR for all traffic"
  default     = "0.0.0.0/0"
}

variable "public_subnet_cidr" {
  description = "CIDR for the public subnet"
  default     = "10.0.0.0/24"
}
