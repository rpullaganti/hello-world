terraform {
  # Live modules pin exact Terraform version; generic modules let consumers pin the version.
  # The latest version of Terragrunt (v0.25.1 and above) recommends Terraform 0.13.3 or above.
  required_version = ">= 0.14.1"

  # Live modules pin exact provider version; generic modules let consumers pin the version.
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 3.7.0"
    }
  }
}
provider "aws" {
  region = "eu-west-1"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"

  name = test-vpc
  cidr = 17.29.24.0/21

  azs             = ["eu-west-1a", "eu-west-1b"]
  private_subnets = ["172.29.24.0/25", "172.29.24.0/25"]

   tags = {
    Terraform = "true"
    Environment = "dev"
  }
}