# # environments/prod/backend.tf
# terraform {
#   backend "s3" {
#     bucket         = "stage-terraform-state"
#     key            = "prod/terraform.tfstate"
#     region         = "us-east-1"
#     encrypt        = true
#     dynamodb_table = "terraform-locks"
#   }
# }
