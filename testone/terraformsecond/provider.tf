terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}  
provider "aws" {
 #  provid auther configuration
  region = "var.aws_region"  # Change to your preferred AWS region
  # profile = "default" # Optional: Uses credentials from ~/.aws/credentials
 }