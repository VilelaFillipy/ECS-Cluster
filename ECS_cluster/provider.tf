terraform {
  required_version = ">= 1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.54.1"
    }
  }

  backend "s3" {
    bucket = "fillipy-terraform-tfstat"
    key    = "backup/tfstate"
    region = "us-east-1"

  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "clouddog-labs"
  default_tags {
    tags = {
      owner      = "fillipy"
      managed-by = "Terraform"
    }
  }
}