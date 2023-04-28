terraform {
  required_version = "1.2.8"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.35"
    }
  }
  backend "s3" {
    bucket = "terraform-aditya-state-storage"
    key    = "prod/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

