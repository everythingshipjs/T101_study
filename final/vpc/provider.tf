provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket         = "namejsjeongkr-t101study-tfstate"
    key            = "final/vpc/terraform.tfstate"
    region         = "ap-northeast-2"
    dynamodb_table = "terraform-locks"
  }
}