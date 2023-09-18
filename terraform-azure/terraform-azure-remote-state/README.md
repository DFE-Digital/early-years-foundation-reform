# Azure Remote State Module

This module provisions a new Azure Storage Account to store Terraform state remotely to allow colloboration between the development team.

**This is a one-off exercise that must applied ahead of all other resources in the configuration.**

1. Navigate to the terraform-azure-remote-state directory using your CLI 
2. Run the init command `terraform init`, then `terraform apply` to provision the Azure storage account and container
3. Initialise the root terraform-azure module with the terraform-init command

        terraform init \
          -backend-config="resource_group_name=<RESOURCE GROUP NAME>" \
          -backend-config="storage_account_name=<STORAGE ACCOUNT NAME>" \
          -backend-config="container_name=<STORAGE CONTAINER NAME>" \
          -backend-config="key=<STATE KEY>"

ref. https://learn.microsoft.com/en-us/azure/developer/terraform/store-state-in-azure-storage?tabs=terraform
