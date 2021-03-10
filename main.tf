provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

data "azurerm_subscription" "current" {
  subscription_id = var.subscription_id
}

data "azurerm_resource_group" "resource_group" {
  name = "phpipam-rg" # existing one
}

# Optional
# Upload terraform state file to shared backend (azure storage)
terraform {
  backend "azurerm" {
    storage_account_name = "terraform"
    container_name       = "terraform-states"
    key                  = "name_of_the_tf_state_file"
    access_key           = "access_key_of_the_storage_account"
  }
}

