variable "vpc_name" {
  description = "The name of the VPC"
}

variable "aws_region" {
  default = "ap-northeast-2"
}

variable "cidr_numeral" {
  default = ""
}


variable "cidr_numeral_public" {
  default = {
    "0" = "0"
    "1" = "1"
    "2" = "2"
    "3" = "3"
  }
}

variable "availability_zones" {
  type = list(string)
}

