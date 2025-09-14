# Azure Service Bus Terraform Module

This module provisions an enterprise-grade Azure Service Bus namespace with parameterized topics, queues, and subscriptions. It uses managed identities and is designed for secure, scalable deployments.

## Files
- `main.tf`: Resource definitions for Service Bus, topics, queues, subscriptions, and managed identity.
- `variables.tf`: All configurable parameters.
- `outputs.tf`: Key outputs for integration and visibility.
- `backend.tf`: Remote state backend configuration (Azure Blob Storage).

## Usage
1. Update `backend.tf` with your Azure storage details for remote state.
2. Set variable values in a `terraform.tfvars` file or via CLI.
3. Run `terraform init`, `terraform plan`, and `terraform apply`.

## Security & Best Practices
- No secrets are hardcoded; use managed identities and Azure Key Vault for secrets.
- All resource counts and names are parameterized for flexibility.
- Remote state is required for team safety and collaboration.

## Example `terraform.tfvars`
```hcl
resource_group_name        = "project1-rg"
location                  = "eastus"
servicebus_namespace_name = "project1-sb"
topic_count               = 3
topic_name_prefix         = "project1_topic_"
queue_count               = 2
queue_name_prefix         = "project1_queue_"
subscription_count        = 4
subscription_name_prefix  = "project1_sub_"
```

## Next Steps
- Integrate with Azure Key Vault for secrets.
- Add RBAC roles as needed for applications.
- Expand with additional Service Bus features if required.
