locals {
  prefix = "${terraform.workspace}-${var.prefix}"
  common_tags = {
    ManagedBy   = "Terraform"
    Department  = "systems",
    Provider    = "Company Name",
    Owner       = "DevOps Team"
    Billing     = "Infrastructure"
    Environment = terraform.workspace
    UserEmail   = "alex_pedro@pucminas.br"
  }
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.27"
    }
  }
  backend "s3" {
    bucket = "tfstate-pucminas-alexpedro"
    key    = "global/s3/terraform.tfstate"
    region = "sa-east-1"
  }
}

provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}