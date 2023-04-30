data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "terraform-aditya-state-storage"
    key    = "prod/network/vpc/terraform.tfstate"
    region = "us-east-1"
  }
}


data "terraform_remote_state" "sg" {
  backend = "s3"

  config = {
    bucket = "terraform-aditya-state-storage"
    key    = "prod/network/security-group/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "ec2" {
  backend = "s3"

  config = {
    bucket = "terraform-aditya-state-storage"
    key    = "prod/instances/webserver/terraform.tfstate"
    region = "us-east-1"
  }
}


