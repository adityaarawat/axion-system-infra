# Axion System Infrastructure

Terraform configuration for provisioning the Azure infrastructure used by the Axion System. The repository contains `preprod` and `prod` environments and reusable modules for network, compute, and database resources.

## What is provisioned

The `environments/preprod` and `environments/prod` root modules compose these resources:

| Area | Resources |
| --- | --- |
| Resource organization | Azure resource groups |
| Networking | Virtual network, subnets, public IP addresses, and network security groups |
| Compute | Linux virtual machines and their network interfaces |
| Data | PostgreSQL Flexible Server and database |

Resources are created from reusable modules under `modules/`. Map keys in the environment inputs become stable Terraform instance keys, so keep keys stable when changing names or configuration.

## Repository layout

```text
.
├── environments/
│   └── preprod/       # Environment root module and environment-specific inputs
│   └── prod/           # Production root module and input scaffold
└── modules/           # Reusable Azure resource modules
```

## Prerequisites

- Terraform CLI (the environment is locked to AzureRM provider `5.6.0`).
- Azure CLI and access to the target Azure subscription.
- An Azure Storage account and blob container for the remote Terraform state.
- Azure permissions to create the listed resources and assign any required roles.

Authenticate with Azure CLI and select the target subscription before running Terraform:

```powershell
az login
az account set --subscription "<subscription-id>"
```

The AzureRM provider uses the signed-in Azure identity. Configure the `azurerm` backend when initializing; `provider.tf` intentionally leaves backend settings to the deployment environment.

## Configure the environment

`environments/preprod/terraform.tfvars` contains local environment values and is ignored by Git. Create or edit it with the required values declared in `variables.tf`. Do not commit local `.tfvars` files, state files, plans, or credentials.

## Initialize and deploy

Run Terraform from the environment directory. Supply backend settings through your approved deployment process or a local backend configuration file; do not put credentials in this repository.

```powershell
terraform fmt -recursive
cd environments/preprod
terraform init `
  -backend-config="resource_group_name=<state-resource-group>" `
  -backend-config="storage_account_name=<state-storage-account>" `
  -backend-config="container_name=<state-container>" `
  -backend-config="key=axion/preprod.tfstate"
terraform validate
terraform plan -out=tfplan
terraform apply tfplan
```

Review the plan before applying it. `terraform apply` creates or changes billable Azure resources. Keep the plan file private and delete it after use; saved plans can contain sensitive values.

To inspect useful resource identifiers and endpoints after deployment:

```powershell
terraform output resource_group_ids
terraform output postgresql_server_fqdns
```

## State and secret handling

Use a remote Azure Storage backend with restricted access, encryption, and state locking for shared environments. Terraform state can contain credentials even when variables are marked sensitive, and saved plans can also contain sensitive values. Do not commit either artifact.

Supply VM and PostgreSQL credentials through a secure deployment mechanism and rotate any credentials that have previously been stored in local state or source-controlled configuration. The current infrastructure inputs still pass administrator passwords to Azure resources; integrating a dedicated secrets-management service and workload identities is a future step.

## Current scope

- Environments: `preprod` and `prod` have separate configurations. Production credentials are placeholders and production network/security settings need review before deployment.
- Cloud and provider: Microsoft Azure with the HashiCorp AzureRM provider.
- Terraform backend: Azure Storage backend, configured at `terraform init` time.
