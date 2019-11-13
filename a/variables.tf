variable "region" {
  default = "us-east-2"
}

variable "ami" {
  default = "ami-3ec9fd5b"
}

variable "aws_key_path" {
  default = "/Users/aaron/.ssh/aws"
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
