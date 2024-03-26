terraform {
  required_version = "1.6.1"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.12"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# Using local backend : it’s recommended to use a remote state( with an s3 bucket) and configure state. This allows multiple developers or teams to work on the same infrastructure project without overwriting each other’s changes.
terraform {
  backend "local" {
    path = "terraform.tfstate"
    
  }
}

# Using a remote backend;

# terraform {
#   backend "s3" {
#     bucket         = "my-backend-devops101-terraform"
#     key            = "tfstate/terraform.tfstate"
#     region         = "us-east-1"
#     encrypt        = true
#     dynamodb_table = "terraform-lock-table"
#   }
# }