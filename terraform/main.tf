module "sandbox" {
  source = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail              = "sakush84+aft31@gmail.com"
    AccountName               = "aft-created-ac"
    ManagedOrganizationalUnit = "Sandbox"
    SSOUserEmail              = "sakush84@gmail.com"
    SSOUserFirstName          = "Sandip"
    SSOUserLastName           = "Sharma"
  }

  account_tags = {
    "Learn Tutorial" = "AFT"
    "Org" = "Sandy & Co.."
  }

  change_management_parameters = {
    change_requested_by = "Sandip"
    change_reason       = "Sandykr: Learn AWS Control Tower Account Factory for Terraform"
  }

  custom_fields = {
    group = "non-prod"
  }

  account_customizations_name = "sandbox-customization"
}
