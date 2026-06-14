locals {
  account_requests = jsondecode(file("${path.module}/accounts.json"))
}

module "account_requests" {
  source   = "./modules/aft-account-request"
  for_each = local.account_requests

  control_tower_parameters = each.value.control_tower_parameters

  account_tags = try(each.value.account_tags, {})

  change_management_parameters = each.value.change_management_parameters

  custom_fields = try(each.value.custom_fields, {})

  account_customizations_name = try(each.value.account_customizations_name, null)
}

# Preserve the existing request's Terraform address during this migration.
moved {
  from = module.sandbox
  to   = module.account_requests["sandbox"]
}
