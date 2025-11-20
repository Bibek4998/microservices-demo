# Terraform skeleton - fill provider credentials before use
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}

provider "aws" {
  region = var.region
}

variable "region" {
  type = string
  default = "us-east-1"
}

# VPC skeleton
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = { Name = "capstone-vpc" }
}
