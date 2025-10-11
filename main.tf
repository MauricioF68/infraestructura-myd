terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "myd_vpc" {
  source = "./modules/vpc"


  project_name = "myd"
  region       = "us-east-1"
}
