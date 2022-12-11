data "terraform_remote_state" "remote" {
  backend = "s3"
  config = {
    bucket = "namejsjeongkr-t101study-tfstate"
    key    = "final/vpc/terraform.tfstate"
    region = "ap-northeast-2"
  }
}