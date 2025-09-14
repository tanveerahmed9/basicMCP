# backend.tf
# Purpose: Configures remote state backend in Azure for team collaboration and state locking.

terraform {
  backend "azurerm" {
    resource_group_name  = "<REPLACE_WITH_STATE_RG>"
    storage_account_name = "<REPLACE_WITH_STATE_STORAGE>"
    container_name       = "<REPLACE_WITH_STATE_CONTAINER>"
    key                  = "servicebus.terraform.tfstate"
  }
}

# Replace the above placeholders with your actual remote state resource details.
