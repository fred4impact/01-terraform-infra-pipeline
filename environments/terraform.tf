data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "my-terraform-state"
    key    = "network/terraform.tfstate"
    region = "us-west-2"
  }
}

locals {
  # Access custom outputs not available via provider API
  custom_network_configs = data.terraform_remote_state.network.outputs.custom_configs
}
