# Learn Terraform - Use Control Tower Account Factory for Terraform

This is a companion repository for the Hashicorp [Provision and Manage Accounts with
Control Tower Account Factory for Terraform
tutorial](https://developer.hashicorp.com/terraform/tutorials/aws/aws-control-tower-aft).

This repository contains boilerplate configuration for defining account
requests to use with the Account Factory for Terraform module. The AFT pipeline
requires the structure used and the included submodule to define a DynamoDB
table item with your account specifications. 

## Add account requests

Account requests are defined in `terraform/accounts.json`. The top-level key is
a stable Terraform identifier for the account and must not be renamed after the
request is applied.

To request another account, add another object alongside `sandbox`:

```json
{
  "sandbox": {
    "control_tower_parameters": {
      "AccountEmail": "sakush84+aft31@gmail.com",
      "AccountName": "aft-created-ac",
      "ManagedOrganizationalUnit": "Sandbox",
      "SSOUserEmail": "sakush84@gmail.com",
      "SSOUserFirstName": "Sandip",
      "SSOUserLastName": "Sharma"
    },
    "account_tags": {
      "Environment": "sandbox"
    },
    "change_management_parameters": {
      "change_requested_by": "Sandip",
      "change_reason": "Manage existing sandbox account"
    },
    "custom_fields": {
      "group": "non-prod"
    },
    "account_customizations_name": "sandbox"
  },
  "application_dev": {
    "control_tower_parameters": {
      "AccountEmail": "sakush84+app-dev@gmail.com",
      "AccountName": "application-dev",
      "ManagedOrganizationalUnit": "Sandbox",
      "SSOUserEmail": "sakush84@gmail.com",
      "SSOUserFirstName": "Sandip",
      "SSOUserLastName": "Sharma"
    },
    "account_tags": {
      "Environment": "development",
      "Owner": "Sandip"
    },
    "change_management_parameters": {
      "change_requested_by": "Sandip",
      "change_reason": "Create application development account"
    },
    "custom_fields": {
      "group": "non-prod"
    },
    "account_customizations_name": "sandbox"
  }
}
```

Each account requires a unique `AccountEmail`. Keep previously applied entries
in the file; removing an entry removes its AFT request record but does not close
the AWS account. The original single-account configuration is retained as
`terraform/main.tf.backup`, which Terraform ignores because it does not end in
`.tf`.
