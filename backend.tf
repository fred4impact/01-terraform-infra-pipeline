terraform {
  required_version = ">= 1.0"

  backend "s3" {
    bucket       = "staging-terraform-state-bucket-0bl"
    key          = "staging/terraform.tfstate" # Path inside the bucket
    region       = "us-east-1"                 # Change to your preferred AWS region
    use_lockfile = true
    encrypt      = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

