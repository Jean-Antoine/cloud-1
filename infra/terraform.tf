terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.40.0"
    }
  }
  required_version = ">=1.14.8"

  backend "s3" {
    bucket         = "jeada-si-42-tfstate"
    key            = "cloud-1/terraform.tfstate"
    region         = "eu-west-1"
    profile        = "admin"
    encrypt        = true
    dynamodb_table = "terraform-state-lock"
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

