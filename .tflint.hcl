plugin "terraform" {
  enabled = true
  preset  = "recommended"
}

plugin "aws" {
  enabled = false
  version = "0.29.0"
  source  = "github.com/terraform-linters/tflint-ruleset-aws"
}

plugin "google" {
  enabled = false
  version = "0.26.0"
  source  = "github.com/terraform-linters/tflint-ruleset-google"
}

plugin "azurerm" {
  enabled = false
  version = "0.25.1"
  source  = "github.com/terraform-linters/tflint-ruleset-azurerm"
}
